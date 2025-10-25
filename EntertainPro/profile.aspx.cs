using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Web.UI;

namespace EntertainPro
{
    public partial class profile : System.Web.UI.Page
    {
        string s = ConfigurationManager.ConnectionStrings["ConnStr"].ConnectionString;
        SqlConnection con;
        SqlCommand cmd;
        private string fnm;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["UserID"] != null)
                {
                    int userId = Convert.ToInt32(Session["UserID"]);
                    LoadUserData(userId);
                    BindBookings();
                }
                else
                {
                    Response.Redirect("Login.aspx");
                }

                if (Session["ProfilePicUpdateSuccess"] != null && (bool)Session["ProfilePicUpdateSuccess"])
                {
                    string script = "showToast('Profile picture updated successfully!', 'success');";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "showToastAfterRedirect", script, true);

                    Session.Remove("ProfilePicUpdateSuccess");
                }

                if (Session["UpdateSuccess"] != null && (bool)Session["UpdateSuccess"])
                {
                    string script = "showToast('Profile updated successfully!', 'success');";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "showToastSuccess", script, true);

                    Session.Remove("UpdateSuccess");
                }
            }
        }

        private void LoadUserData(int userId)
        {
            using (SqlConnection con = new SqlConnection(s))
            {
                string query = "SELECT (FirstName + ' ' + LastName) AS FullName, FirstName, LastName, Email, DOB, Phone, Gender, ImagePath FROM Users WHERE UserID=" + userId;
                SqlCommand cmd = new SqlCommand(query, con);
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.Read())
                {
                    // Labels
                    lblFirstName.Text = reader["FirstName"].ToString();
                    lblLastName.Text = reader["LastName"].ToString();
                    lblEmail.Text = reader["Email"].ToString();
                    lblDOB.Text = Convert.ToDateTime(reader["DOB"]).ToString("yyyy-MM-dd");
                    lblMobile.Text = reader["Phone"].ToString();
                    lblGender.Text = reader["Gender"].ToString();

                    // TextBoxes
                    txtFirstName.Text = lblFirstName.Text;
                    txtLastName.Text = lblLastName.Text;
                    txtDOB.Text = Convert.ToDateTime(reader["DOB"]).ToString("yyyy-MM-dd");
                    txtMobile.Text = lblMobile.Text;
                    ddlGender.SelectedValue = reader["Gender"].ToString();

                    fullName.Text = reader["FullName"].ToString();
                    userName.InnerText = reader["FirstName"].ToString();

                    string profilePic = reader["ImagePath"].ToString();
                    if (!string.IsNullOrEmpty(profilePic))
                    {
                        profilePicContainer.InnerHtml = $"<img src='{profilePic}' class='w-full h-full object-cover rounded-full' />";
                        profileContainer.InnerHtml = $"<img src='{profilePic}' class='w-full h-full object-cover rounded-full' />";
                    }
                    else
                    {
                        string initials = GetInitials(reader["FirstName"].ToString(), reader["LastName"].ToString());
                        profilePicContainer.InnerText = initials;
                        profileContainer.InnerText = initials;
                    }

                    reader.Close();
                }
            }
        }
        protected void EditButton_Click(object sender, EventArgs e)
        {
            lblFirstName.CssClass = "hidden";
            lblLastName.CssClass = "hidden";
            lblDOB.CssClass = "hidden";
            lblMobile.CssClass = "hidden";
            lblGender.CssClass = "hidden";

            txtFirstName.CssClass = "profile-input";
            txtLastName.CssClass = "profile-input";
            txtDOB.CssClass = "profile-input";
            txtMobile.CssClass = "profile-input";
            ddlGender.CssClass = "profile-input";

            btnEdit.CssClass = "hidden";
            btnSave.CssClass = "px-4 py-1 bg-[#ff4444] text-white font-medium rounded-lg hover:bg-red-600 transition duration-200 shadow-md";
        }

        protected void SaveButton_Click(object sender, EventArgs e)
        {
            if (Session["UserID"] == null || !int.TryParse(Session["UserID"].ToString(), out int userId))
            {
                Response.Redirect("Login.aspx");
                return;
            }

            using (SqlConnection con = new SqlConnection(s))
            {
                con.Open();

                string query = "UPDATE Users SET " +
                               "FirstName='" + txtFirstName.Text + "', " +
                               "LastName='" + txtLastName.Text + "', " +
                               "DOB='" + txtDOB.Text + "', " +
                               "Phone='" + txtMobile.Text + "', " +
                               "Gender='" + ddlGender.SelectedValue + "' " +
                               "WHERE UserID=" + userId;

                SqlCommand cmd = new SqlCommand(query, con);
                cmd.ExecuteNonQuery();
            }

            LoadUserData(userId);
            txtFirstName.CssClass = "hidden";
            txtLastName.CssClass = "hidden";
            txtDOB.CssClass = "hidden";
            txtMobile.CssClass = "hidden";
            ddlGender.CssClass = "hidden";

            lblFirstName.CssClass = "profile-field-display font-medium";
            lblLastName.CssClass = "profile-field-display font-medium";
            lblDOB.CssClass = "profile-field-display font-medium";
            lblMobile.CssClass = "profile-field-display font-medium";
            lblGender.CssClass = "profile-field-display font-medium";

            btnEdit.CssClass = "text-[#ff4444] hover:text-red-600 font-medium flex items-center justify-end absolute top-0 right-0";
            btnSave.CssClass = "hidden";

            Session["UpdateSuccess"] = true;
            Response.Redirect(Request.RawUrl);
        }

        private string GetInitials(string firstName, string lastName)
        {
            string f = string.IsNullOrEmpty(firstName) ? "" : firstName.Substring(0, 1).ToUpper();
            string l = string.IsNullOrEmpty(lastName) ? "" : lastName.Substring(0, 1).ToUpper();
            return f + l;
        }

        void UploadFile()
        {
            fnm = "img/" + fuProfilePic.FileName;
            fuProfilePic.SaveAs(Server.MapPath(fnm));
        }

        void UpdateProfilePicture()
        {
            int userID = Convert.ToInt32(Session["UserID"]);
            using (SqlConnection con = new SqlConnection(s))
            {
                con.Open();

                string q = "UPDATE Users SET ImagePath = @ImagePath WHERE UserID = @UserID";
                SqlCommand cmd = new SqlCommand(q, con);

                cmd.Parameters.AddWithValue("@ImagePath", fnm);
                cmd.Parameters.AddWithValue("@UserID", userID);

                cmd.ExecuteNonQuery();
            }

            profilePicContainer.Style["background-image"] = $"url('{fnm}')";
            profilePicContainer.Style["background-size"] = "cover";
            profilePicContainer.Style["background-position"] = "center";
            profilePicContainer.Style["color"] = "transparent";
            profilePicContainer.InnerHtml = "";
        }

        protected void btnSaveProfilePic_Click(object sender, EventArgs e)
        {
            if (fuProfilePic.HasFile)
            {
                UploadFile();
                UpdateProfilePicture();

                Session["ProfilePicUpdateSuccess"] = true;

                Response.Redirect(Request.RawUrl);

            }
            else
            {
                string script = "showToast('Please select an image first.', 'error');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "showToastError", script, true);
            }
        }

        private void BindBookings()
        {
            // Get UserID from session
            int userID = Convert.ToInt32(Session["UserID"]);

            string connStr = ConfigurationManager.ConnectionStrings["ConnStr"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connStr))
            {
                // Using string concatenation instead of parameterized query
                string query = @"
                SELECT 
                    b.BookingID,
                    b.SeatNumber,
                    b.TicketPrice,
                    b.PaymentStatus,
                    b.PaymentID,
                    sm.ShowDate,
                    sm.ShowTime,
                    sm.Language AS ShowLanguage,
                    m.Title AS MovieName,
                    m.Duration AS MovieDuration,
                    m.Language AS MovieLanguage,
                    s.ScreenName,
                    s.ScreenType
                FROM Bookings b
                INNER JOIN ShowingMovies sm ON b.ShowingID = sm.ShowingID
                INNER JOIN Movies m ON sm.MovieID = m.MovieID
                INNER JOIN Screens s ON sm.ScreenID = s.ScreenID
                WHERE b.UserID = " + userID + @"
                ORDER BY sm.ShowDate DESC, sm.ShowTime DESC
            ";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    dlBookings.DataSource = dt;
                    dlBookings.DataBind();
                }
            }

        }
    }
}