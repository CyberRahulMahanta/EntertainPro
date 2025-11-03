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

        protected void Page_Load(object sender, EventArgs e)
        {
            HandleActions();
            if (!IsPostBack)
            {
                string movieId = Request.QueryString["MovieID"];
                BindShowings(movieId);
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
                UpdateStatus(showingId, "Active");
            }
            else if (Request.QueryString["deactivate"] != null)
            {
                showingId = Request.QueryString["deactivate"];
                UpdateStatus(showingId, "Inactive");
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

    }
}