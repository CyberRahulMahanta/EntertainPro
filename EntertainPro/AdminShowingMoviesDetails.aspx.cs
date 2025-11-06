using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EntertainPro
{
    public partial class AdminShowingMoviesDetails : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnStr"].ConnectionString);
        SqlDataAdapter da;
        DataSet ds;
        SqlCommand cmd;
        protected void Page_Load(object sender, EventArgs e)
        {
            HandleActions();
            if (!IsPostBack)
            {
                string movieId = Request.QueryString["MovieID"];
                BindShowings(movieId);
                AddShowMovie();
                ComboToSelectScreen();
            }
        }

        private void BindShowings(string movieId)
        {
            using (SqlCommand cmd = new SqlCommand(@"
                SELECT s.ShowingID, s.MovieID, m.Title, sc.ScreenName, 
                       s.ShowDate, s.ShowTime, s.Language, s.Status
                FROM ShowingMovies s
                INNER JOIN Movies m ON s.MovieID = m.MovieID
                INNER JOIN Screens sc ON s.ScreenID = sc.ScreenID
                WHERE s.MovieID = @MovieID
                ORDER BY s.ShowDate DESC, s.ShowTime ASC", con))
            {
                cmd.Parameters.AddWithValue("@MovieID", movieId);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                rptShowings.DataSource = dt;
                rptShowings.DataBind();

            }
        }

        protected void rptShowings_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "EditShow")
            {
                string showingId = e.CommandArgument.ToString();
                SqlCommand cmd = new SqlCommand("SELECT * FROM ShowingMovies WHERE ShowingID=@id", con);
                cmd.Parameters.AddWithValue("@id", showingId);
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    hfShowingID.Value = dr["ShowingID"].ToString();
                    txtShowDate.Text = Convert.ToDateTime(dr["ShowDate"]).ToString("yyyy-MM-dd");
                    if (dr["ShowTime"] != DBNull.Value && !string.IsNullOrEmpty(dr["ShowTime"].ToString()))
                    {
                        txtShowTime.Text = TimeSpan.Parse(dr["ShowTime"].ToString()).ToString(@"hh\:mm");
                    }
                    else
                    {
                        txtShowTime.Text = ""; // or "00:00" or whatever default you prefer
                    }

                    txtLanguage.Text = dr["Language"].ToString();
                    ddlStatus.SelectedValue = dr["Status"].ToString();
                }
                con.Close();

                ScriptManager.RegisterStartupScript(this, GetType(), "showModal", "showModal();", true);
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            string date = txtShowDate.Text;
            string time = txtShowTime.Text;
            string lang = txtLanguage.Text;
            string status = ddlStatus.SelectedValue;
            string id = hfShowingID.Value;

            string query = "UPDATE ShowingMovies SET " +
                           "ShowDate = '" + date + "', " +
                           "ShowTime = '" + time + "', " +
                           "Language = '" + lang + "', " +
                           "Status = '" + status + "' " +
                           "WHERE ShowingID = " + id;

            using (SqlCommand cmd = new SqlCommand(query, con))
            {
                con.Open();
                int rows = cmd.ExecuteNonQuery();
                con.Close();
            }

            string movieId = Request.QueryString["MovieID"];
            Response.Redirect($"AdminShowingMoviesDetails.aspx?MovieID={movieId}&updated=true", false);
        }

        private void HandleActions()
        {
            string movieId = Request.QueryString["Movieid"];
            string showingId = string.Empty;

            if (Request.QueryString["activate"] != null)
            {
                showingId = Request.QueryString["activate"];
                UpdateStatus(showingId, "active");
            }
            else if (Request.QueryString["deactivate"] != null)
            {
                showingId = Request.QueryString["deactivate"];
                UpdateStatus(showingId, "inactive");
            }
        }

        private void UpdateStatus(string showingId, string status)
        {
            try
            {
                string query = "UPDATE ShowingMovies SET Status='" + status + "' WHERE ShowingID='" + showingId + "'";
                SqlCommand cmd = new SqlCommand(query, con);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();

                string movieId = Request.QueryString["MovieID"];
                Response.Redirect("AdminShowingMoviesDetails.aspx?MovieID=" + movieId + "&updated=true", false);
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error updating status: " + ex.Message + "');</script>");
            }
        }
        protected void btnConfirmDelete_Click(object sender, EventArgs e)
        {
            string movieId = hfMovieID.Value;
            string showingId = hfShowingID.Value;

            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("DELETE FROM ShowingMovies WHERE ShowingID = @ShowingID AND MovieID = @MovieID", con);
                cmd.Parameters.AddWithValue("@ShowingID", showingId);
                cmd.Parameters.AddWithValue("@MovieID", movieId);
                int rows = cmd.ExecuteNonQuery();
                con.Close();

                if (rows > 0)
                {
                    // ✅ Redirect with query parameter (same as update)
                    Response.Redirect("AdminShowingMoviesDetails.aspx?MovieID=" + movieId + "&deleted=true", false);
                }
                else
                {
                    // ❌ Show toast directly (no redirect)
                    ScriptManager.RegisterStartupScript(this, GetType(), "showToast",
                        "showToast('No record found to delete.', 'error');", true);
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "showToast",
                    $"showToast('Error: {ex.Message.Replace("'", "")}', 'error');", true);
            }
        }

        void getcon()
        {
            if (con.State == ConnectionState.Closed)
                con.Open();
        }

        private void AddShowMovie()
        {
            if (Request.QueryString["MovieID"] == null) return;

            string movieId = Request.QueryString["MovieID"];
            string query = "SELECT Title FROM Movies WHERE MovieID = " + movieId;

            getcon();
            SqlCommand cmd = new SqlCommand(query, con);
            object result = cmd.ExecuteScalar();
            con.Close();

            txtMovieName.Text = result != null ? result.ToString() : "Movie not found";
        }

        void ComboToSelectScreen()
        {
            getcon();
            da = new SqlDataAdapter("SELECT * FROM Screens", con);
            ds = new DataSet();
            da.Fill(ds);
            ddlScreen.Items.Add(new ListItem("--Select Showings Screen--", "0"));

            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                ddlScreen.Items.Add(ds.Tables[0].Rows[i][1].ToString());
            }

        }
        protected void ddlScreen_SelectedIndexChanged(object sender, EventArgs e)
        {
            getcon();
            da = new SqlDataAdapter("select ScreenID from Screens where ScreenName='" + ddlScreen.Text + "'", con);
            ds = new DataSet();
            da.Fill(ds);
            ViewState["ScreenID"] = ds.Tables[0].Rows[0][0].ToString();
        }

        protected void btnSubmitShow_Click(object sender, EventArgs e)
        {
            if (ddlScreen.SelectedValue == "0")
            {
                lblMessage.Text = "Please select a screen..!";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                return;
            }

            // 1. Validate and Format Date/Time
            // Use DateTime.TryParse to ensure the input is valid before formatting.
            if (!DateTime.TryParse(txtDate.Text, out DateTime showDate))
            {
                lblMessage.Text = "Invalid Date format.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                return;
            }

            if (!TimeSpan.TryParse(txtTime.Text, out TimeSpan showTime))
            {
                lblMessage.Text = "Invalid Time format.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                return;
            }

            // Convert DateTime and TimeSpan objects into SQL-safe string formats (YYYY-MM-DD and HH:MM:SS)
            string sqlDate = showDate.ToString("yyyy-MM-dd");
            string sqlTime = showTime.ToString(@"hh\:mm\:ss"); // Format for TimeSpan 

            // 2. Build the SQL Command (Insecure Method)
            getcon();

            string sql = "INSERT INTO ShowingMovies (MovieID, ScreenID, ShowDate, ShowTime, Status, Language) VALUES ('"
                        + Request.QueryString["MovieID"] + "', '"
                        + ViewState["ScreenID"] + "', '"
                        // Use the correctly formatted date and time strings
                        + sqlDate + "', '"
                        + sqlTime + "', '"
                        + DropDownList1.SelectedValue + "', '"
                        + txtlang.Text + "')";

            cmd = new SqlCommand(sql, con);

            // 3. Execute the command
            cmd.ExecuteNonQuery();

            lblMessage.Text = "Show added successfully!";
            lblMessage.ForeColor = System.Drawing.Color.Green;
            Response.Redirect(Request.RawUrl);
        }
    }
}