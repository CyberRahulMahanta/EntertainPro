using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EntertainPro
{
    public partial class AdminSite : System.Web.UI.MasterPage
    {
        // Holds the full URL or path of the user's avatar
        public string UserImageUrl = "https://placehold.co/40x40/dc2626/ffffff?text=U"; // default fallback
        public string UserFullName = "User";       // Full name to display
        public string UserRole = "User";           // Role to display

        protected void Page_Load(object sender, EventArgs e)
        {
            // Redirect to login page if user is not authenticated
            if (Session["UserID"] == null || Session["UserEmail"] == null)
            {
                Response.Redirect("Login.aspx");
                return;
            }

            // Load user profile image from database
            LoadUserImage();
        }

        private void LoadUserImage()
        {
            try
            {
                string connStr = ConfigurationManager.ConnectionStrings["ConnStr"].ConnectionString;
                using (SqlConnection con = new SqlConnection(connStr))
                {
                    con.Open();

                    string userId = Session["UserID"].ToString();

                    // Fetch FirstName, LastName, and ImagePath
                    string query = "SELECT FirstName, LastName, ImagePath FROM Users WHERE UserID = " + userId;

                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        using (SqlDataReader dr = cmd.ExecuteReader())
                        {
                            if (dr.Read())
                            {
                                UserFullName = dr["FirstName"].ToString() + " " + dr["LastName"].ToString();
                                string imagePath = dr["ImagePath"].ToString();

                                if (!string.IsNullOrEmpty(imagePath))
                                    UserImageUrl = ResolveUrl(imagePath); // properly resolves '~/img/50.jpg' or any path
                                else
                                    UserImageUrl = "~/img/50.jpg"; // default
                            }
                        }
                    }
                }
            }
            catch
            {
                // fallback placeholder
                UserImageUrl = "~/img/50.jpg";
                UserFullName = "User";
            }
        }

    }
}