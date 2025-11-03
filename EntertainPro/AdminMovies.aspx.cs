using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EntertainPro
{
    public partial class AdminMovies : System.Web.UI.Page
    {
        string s = ConfigurationManager.ConnectionStrings["ConnStr"].ConnectionString;
        SqlConnection con;
        SqlCommand cmd;

        string fnm;

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

                // Redirect with a flag so toast shows after refresh
                Response.Redirect("AdminMovies.aspx?deleted=1");
            }
        }


        void imgupload()
        {
            if (ImageFile.HasFile)
            {
                fnm = "img/" + ImageFile.FileName;
                ImageFile.SaveAs(Server.MapPath(fnm));
            }
            else
            {
                fnm = "movie_images/default.jpg"; // fallback image
            }
        }

        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        protected void btnSaveMovie_Click(object sender, EventArgs e)
        {
            try
            {
                lblValidationMessage.Text = "";

                if (string.IsNullOrWhiteSpace(txtTitle.Text) ||
                    string.IsNullOrWhiteSpace(txtGenre.Text) ||
                    string.IsNullOrWhiteSpace(txtRating.Text) ||
                    string.IsNullOrWhiteSpace(txtTrailerUrl.Text) ||
                    string.IsNullOrWhiteSpace(ddlCategory.SelectedValue) ||
                    string.IsNullOrWhiteSpace(ddlSubCategory.SelectedValue) ||
                    string.IsNullOrWhiteSpace(txtDuration.Text) ||
                    string.IsNullOrWhiteSpace(txtLanguage.Text) ||
                    string.IsNullOrWhiteSpace(txtReleaseDate.Text))
                {
                    lblValidationMessage.Text = "⚠️ Please fill in all required fields before saving.";
                    lblValidationMessage.Style["display"] = "block";

                    ScriptManager.RegisterStartupScript(this, GetType(), "ShowModal", "document.getElementById('addMovieModal').classList.remove('hidden');", true);
                    return;
                }
                imgupload();
                getcon();

                string sql = "INSERT INTO Movies (Title, Genre, Rating, ImageUrl, TrailerUrl, Category, SubCategory, Duration, Language, ReleaseDate) " +
                             "VALUES ('" + txtTitle.Text + "', '" + txtGenre.Text + "', '" + txtRating.Text + "', '" + fnm + "', '" + txtTrailerUrl.Text + "', '" + ddlCategory.SelectedValue + "', '" + ddlSubCategory.SelectedValue + "', '" + txtDuration.Text + "', '" + txtLanguage.Text + "', '" + txtReleaseDate.Text + "')";
                cmd = new SqlCommand(sql, con);
                cmd.ExecuteNonQuery();
                con.Close();

                ClearFormFields();

                // ✅ Redirect safely with success flag
                Response.Redirect("AdminMovies.aspx?success=1");
            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "toastError",
                    "showToast('Error: " + ex.Message.Replace("'", "\\'") + "', 'error');", true);
            }
        }



        private void ClearFormFields()
        {
            txtTitle.Text = "";
            txtGenre.Text = "";
            txtRating.Text = "";
            txtTrailerUrl.Text = "";
            txtDuration.Text = "";
            txtLanguage.Text = "";
            txtReleaseDate.Text = "";

            ddlCategory.SelectedIndex = 0;
            ddlSubCategory.SelectedIndex = 0;
        }
    }
}
