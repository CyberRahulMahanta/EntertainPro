using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace EntertainPro
{
    public partial class AdminMovieDetails : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataReader dr;
        string fnm;
        string s = System.Configuration.ConfigurationManager.ConnectionStrings["ConnStr"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            string movieId = Request.QueryString["id"];
            if (Request.Form["action"] == "save" && movieId != null)
            {
                saveMovieDetails(movieId);
                return;
            }

            if (!IsPostBack)
            {
                if (movieId != null)
                {
                    getMovieDetails(movieId);
                }
            }
            else if (movieId != null)
            {
                getMovieDetails(movieId);
            }
        }

        void getMovieDetails(string id)
        {
            try
            {
                getcon();
                string sql = "SELECT * FROM Movies WHERE MovieID = '" + id.Replace("'", "''") + "'";

                cmd = new SqlCommand(sql, con);
                dr = cmd.ExecuteReader();

                if (dr.Read())
                {
                    lblTitle.Text = dr["Title"].ToString();
                    lblGenre.Text = dr["Genre"].ToString();
                    lblRating.Text = dr["Rating"].ToString();
                    lblLanguage.Text = dr["Language"].ToString();
                    lblDuration.Text = dr["Duration"].ToString();

                    DateTime releaseDate = Convert.ToDateTime(dr["ReleaseDate"]);
                    lblReleaseDate.Text = releaseDate.ToString("MMMM dd, yyyy");
                    lblTrailer.Text = dr["TrailerUrl"].ToString();
                    imgPoster.ImageUrl = ResolveUrl("~/" + dr["ImageUrl"].ToString());

                    txtGenre.Text = dr["Genre"].ToString();
                    string category = dr["Category"].ToString();
                    string subCategory = dr["SubCategory"].ToString();

                    // Display Mode: Labels still show the text
                    lblCategory.Text = category;
                    lblSubCategory.Text = subCategory;

                    if (ddlCategory.Items.FindByValue(category) != null)
                    {
                        ddlCategory.SelectedValue = category;
                    }
                    if (ddlSubCategory.Items.FindByValue(subCategory) != null)
                    {
                        ddlSubCategory.SelectedValue = subCategory;
                    }
                    txtRating.Text = dr["Rating"].ToString();
                    txtLanguage.Text = dr["Language"].ToString();
                    txtDuration.Text = dr["Duration"].ToString();
                    txtReleaseDate.Text = releaseDate.ToString("yyyy-MM-dd");
                    txtTrailer.Text = dr["TrailerUrl"].ToString();
                }
                else
                {
                    lblTitle.Text = "Movie not found.";
                }

                dr.Close();
                con.Close();
            }
            catch (Exception ex)
            {
                lblTitle.Text = "Error: " + ex.Message;
            }
        }

        void saveMovieDetails(string id)
        {
            try
            {
                getcon();
                string escId = id.Replace("'", "''");
                string newImageUrl = null;
                bool imageUpdated = false;

                if (filePoster.HasFile)
                {
                    imgupload();
                    newImageUrl = fnm;
                    imageUpdated = true;
                }

                string title = lblTitle.Text.Replace("'", "''");
                string genre = txtGenre.Text.Replace("'", "''");
                string category = ddlCategory.SelectedValue;
                string subCategory = ddlSubCategory.SelectedValue;
                string rating = txtRating.Text.Replace("'", "''");
                string language = txtLanguage.Text.Replace("'", "''");
                string duration = txtDuration.Text.Replace("'", "''");
                string releaseDate = txtReleaseDate.Text;
                string trailer = txtTrailer.Text.Replace("'", "''");

                string sql = "UPDATE Movies SET " +
                    "Title = '" + title + "', " +
                    "Genre = '" + genre + "', " +
                    "Category = '" + category + "', " +
                    "SubCategory = '" + subCategory + "', " +
                    "Rating = '" + rating + "', " +
                    "Language = '" + language + "', " +
                    "Duration = '" + duration + "', " +
                    "ReleaseDate = '" + releaseDate + "', " +
                    "TrailerUrl = '" + trailer + "'";

                if (imageUpdated)
                {
                    sql += ", ImageUrl = '" + newImageUrl.Replace("'", "''") + "'";
                }

                sql += " WHERE MovieID = '" + escId + "'";

                cmd = new SqlCommand(sql, con);
                cmd.ExecuteNonQuery();
                con.Close();

                ScriptManager.RegisterStartupScript(this, this.GetType(),
                        "showToast", "showToast('Movie details saved successfully!');", true);

                Response.AddHeader("REFRESH", "1;URL=AdminMovieDetails.aspx?id=" + id);

            }
            catch (Exception ex)
            {
                lblTitle.Text = "Error saving changes: " + ex.Message;
            }
        }
        void imgupload()
        {
            if (filePoster.HasFile)
            {
                fnm = "img/" + filePoster.FileName;
                filePoster.SaveAs(Server.MapPath(fnm));
            }
            else
            {
                fnm = "img/default.jpg";
            }
        }
        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }
    }
}