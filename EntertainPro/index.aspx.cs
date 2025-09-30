using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EntertainPro
{
    public partial class index : System.Web.UI.Page
    {
        String s = ConfigurationManager.ConnectionStrings["ConnStr"].ConnectionString;
        static int currentPage = 0;
        int pageSize = 8;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadUpcomingMovies();
                LoadUpcomingMoviesCategory();
                LoadReleasedMoviesCategory();
                LoadBestMoviesCategory();
                LoadTopMovies();
                BindMovies();

                if (Session["unm"] != null)
                {
                    navUserItem.Visible = true;
                    navLoginItem.Visible = false;

                    navUserName.InnerText = Session["unm"].ToString();

                    if (Session["UserImage"] != null && Session["UserImage"].ToString() != "")
                    {
                        userAvatar.Src = Session["UserImage"].ToString();
                    }
                    else
                    {
                        userAvatar.Src = "img/50.jpg";
                    }
                }
                else
                {
                    navUserItem.Visible = false;
                    navLoginItem.Visible = true;
                }
            }
        }

        private void LoadUpcomingMovies()
        {
            using (SqlConnection con = new SqlConnection(s))
            {
                SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM Movies where Category = 'Upcoming'", con);
                DataTable dt = new DataTable();
                da.Fill(dt);
                PagedDataSource pg = new PagedDataSource();
                pg.DataSource = dt.DefaultView;
                pg.AllowPaging = true;
                pg.PageSize = pageSize;
                pg.CurrentPageIndex = currentPage;

                btnPrev.Enabled = !pg.IsFirstPage;
                btnNext.Enabled = !pg.IsLastPage;

                dlUpcoming.DataSource = pg;
                dlUpcoming.DataBind();
            }
        }

        protected void btnPrev_Click(object sender, EventArgs e)
        {
            if (currentPage > 0)
            {
                currentPage--;
                LoadUpcomingMovies();
            }
        }

        protected void btnNext_Click(object sender, EventArgs e)
        {
            currentPage++;
            LoadUpcomingMovies();
        }

        private void LoadUpcomingMoviesCategory()
        {
            using (SqlConnection con = new SqlConnection(s))
            {
                string query = "SELECT * FROM Movies WHERE Category='Popular' AND SubCategory='Upcoming'";
                SqlDataAdapter da = new SqlDataAdapter(query, con);
                DataTable dt = new DataTable();
                da.Fill(dt);

                DataList1.DataSource = dt;
                DataList1.DataBind();
            }
        }

        // Load movies with Category = Popular and SubCategory = Released
        private void LoadReleasedMoviesCategory()
        {
            using (SqlConnection con = new SqlConnection(s))
            {
                string query = "SELECT * FROM Movies WHERE Category='Popular' AND SubCategory='Released'";
                SqlDataAdapter da = new SqlDataAdapter(query, con);
                DataTable dt = new DataTable();
                da.Fill(dt);

                dlReleased.DataSource = dt;
                dlReleased.DataBind();
            }
        }

        // Load movies with Category = Popular and SubCategory = Best of Library
        private void LoadBestMoviesCategory()
        {
            using (SqlConnection con = new SqlConnection(s))
            {
                string query = "SELECT * FROM Movies WHERE Category='Popular' AND SubCategory='Best of Library'";
                SqlDataAdapter da = new SqlDataAdapter(query, con);
                DataTable dt = new DataTable();
                da.Fill(dt);

                dlBest.DataSource = dt;
                dlBest.DataBind();
            }
        }

        private void LoadTopMovies()
        {
            using (SqlConnection con = new SqlConnection(s))
            {
                string query = "SELECT * FROM Movies WHERE Category = 'Top'";
                SqlDataAdapter da = new SqlDataAdapter(query, con);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (dt.Rows.Count > 0)
                {
                    rptTopMovies.DataSource = dt;
                    rptTopMovies.DataBind();

                    int totalItems = dt.Rows.Count;
                    int itemsPerSlide = 4;
                    int slideCount = (int)Math.Ceiling((double)totalItems / itemsPerSlide);

                    rptTopMoviesIndicators.DataSource = new int[slideCount];
                    rptTopMoviesIndicators.DataBind();
                }
            }
        }

        protected void rptTopMovies_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Literal litStart = (Literal)e.Item.FindControl("litSlideStart");
                Literal litEnd = (Literal)e.Item.FindControl("litSlideEnd");

                int itemsPerSlide = 4;
                if (e.Item.ItemIndex % itemsPerSlide == 0)
                {
                    string activeClass = (e.Item.ItemIndex == 0) ? " active" : "";
                    litStart.Text = $"<div class='carousel-item{activeClass}'><div class='upcome_2i row'>";
                }
                int totalItems = ((DataTable)((Repeater)sender).DataSource).Rows.Count;
                if (e.Item.ItemIndex % itemsPerSlide == itemsPerSlide - 1 || e.Item.ItemIndex == totalItems - 1)
                {
                    litEnd.Text = "</div></div>";
                }
            }
        }


        // Show overlay and filter movies
        private void BindMovies()
        {
            DataTable dt = new DataTable();
            using (SqlConnection con = new SqlConnection(s))
            {
                string query = "SELECT * FROM Movies";
                SqlDataAdapter da = new SqlDataAdapter(query, con);
                da.Fill(dt);
            }

            dlMovies.DataSource = dt;
            dlMovies.DataBind();
        }

        protected string GetGenreTags(object dataItem)
        {
            var sb = new StringBuilder();
            if (dataItem is System.Data.DataRowView rowView)
            {
                if (rowView.Row.Table.Columns.Contains("Genre") && rowView["Genre"] != DBNull.Value)
                {
                    string genreString = rowView["Genre"].ToString();
                    List<string> genres = genreString.Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries).ToList();
                    foreach (var genre in genres)
                    {
                        sb.Append($"<span class='genre-tag'>{genre.Trim()}</span>");
                    }
                }
            }
            return sb.ToString();
        }

        public string GetStars(int rating)
        {
            string stars = "";
            for (int i = 1; i <= 5; i++)
            {
                stars += i <= rating ? "<i class='fa fa-star'></i>" : "<i class='fa fa-star-o'></i>";
            }
            return stars;
        }

    }
}