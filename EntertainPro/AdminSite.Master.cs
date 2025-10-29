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
        public string UserImageUrl = "https://placehold.co/40x40/dc2626/ffffff?text=U";
        public string UserFullName = "User";
        public string UserRole = "User";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserID"] == null || Session["UserEmail"] == null)
            {
                Response.Redirect("Login.aspx");
                return;
            }

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
                                    UserImageUrl = ResolveUrl(imagePath);
                                else
                                    UserImageUrl = "~/img/50.jpg";
                            }
                        }
                    }
                }
            }
            catch
            {
                UserImageUrl = "~/img/50.jpg";
                UserFullName = "User";
            }
        }

    }
}