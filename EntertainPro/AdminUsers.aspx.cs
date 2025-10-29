using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Net.Mail;
using System.Web.Services;

namespace EntertainPro
{
    public partial class AdminUsers : System.Web.UI.Page
    {
        string connStr = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=C:\\Users\\DELL\\source\\repos\\EntertainPro\\EntertainPro\\EntertainPro\\App_Data\\project.mdf;Integrated Security=True"; // Change DB info

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadUsers();
            }
        }

        private void LoadUsers()
        {
            DataTable dt = new DataTable();

            using (SqlConnection con = new SqlConnection(connStr))
            {
                con.Open();

                string query = "SELECT u.UserID, u.FirstName + ' ' + u.LastName AS Username,u.DOB, u.Phone, u.Gender, u.Role, u.Email, u.ImagePath, u.CreatedAt, " +
                               "(SELECT COUNT(*) FROM Bookings b WHERE b.UserID = u.UserID) AS Bookings " +
                               "FROM Users u " +
                               "WHERE u.Role = 'user' " +
                               "ORDER BY u.CreatedAt DESC";

                SqlDataAdapter da = new SqlDataAdapter(query, con);
                da.Fill(dt);

                totalUsers.InnerText = dt.Rows.Count.ToString();
            }

            // Bind to Repeater instead of DataList
            UserRepeater.DataSource = dt;
            UserRepeater.DataBind();
        }


        [WebMethod]
        public static string SendEmail(string toEmail, string messageContent)
        {
            try
            {
                MailMessage mail = new MailMessage();
                mail.To.Add(toEmail);
                mail.Subject = "Message from Admin";
                mail.Body = messageContent;
                mail.IsBodyHtml = false;

                SmtpClient smtp = new SmtpClient();
                smtp.Send(mail);

                return "success";
            }
            catch (Exception ex)
            {
                return "error: " + ex.Message;
            }
        }

        protected void ConfirmDeleteBtn_Click(object sender, EventArgs e)
        {
            int userId;
            if (int.TryParse(HiddenUserID.Value, out userId))
            {
                string s = ConfigurationManager.ConnectionStrings["ConnStr"].ConnectionString;

                using (SqlConnection con = new SqlConnection(s))
                {
                    string query = "DELETE FROM Users WHERE UserID = @UserID";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@UserID", userId);
                    con.Open();
                    cmd.ExecuteNonQuery();
                }

                LoadUsers();
            }
        }

    }
}
