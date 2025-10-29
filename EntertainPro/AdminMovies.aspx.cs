using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EntertainPro
{
    public partial class AdminMovies : System.Web.UI.Page
    {
        string s = ConfigurationManager.ConnectionStrings["ConnStr"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                LoadMovies();
        }

        private void LoadMovies()
        {
            using (SqlConnection con = new SqlConnection(s))
            {
                string query = "SELECT * FROM Movies ORDER BY MovieID DESC";
                SqlCommand cmd = new SqlCommand(query, con);
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                rptMovies.DataSource = reader;
                rptMovies.DataBind();

            }
        }

        protected void rptMovies_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "ViewDetails")
            {
                string movieId = e.CommandArgument.ToString();
                Response.Redirect("AdminMovieDetails.aspx?id=" + movieId);
            }
            else if (e.CommandName == "DeleteMovie")
            {
                // No direct delete here — handled via modal confirmation
            }
        }

        protected void btnConfirmDelete_Click(object sender, EventArgs e)
        {
            string movieId = hfMovieIdToDelete.Value;

            if (!string.IsNullOrEmpty(movieId))
            {
                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnStr"].ConnectionString))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("DELETE FROM Movies WHERE MovieID = @MovieID", con);
                    cmd.Parameters.AddWithValue("@MovieID", movieId);
                    cmd.ExecuteNonQuery();
                }

                // Hide modal after delete
                ScriptManager.RegisterStartupScript(this, GetType(), "HideModal", "hideDeleteModal();", true);

                // Optional: Show success toast
                ScriptManager.RegisterStartupScript(this, GetType(), "ShowToast", "showDeleteToast();", true);

                // Reload the movie list
                LoadMovies();
            }
        }
    }
}
