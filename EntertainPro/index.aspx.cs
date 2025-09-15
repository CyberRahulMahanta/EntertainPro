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

                if (Session["unm"] != null)
                {
                    navUserItem.Visible = true;
                    navLoginItem.Visible = false;

                    navUserName.InnerText = Session["unm"].ToString();

                    // check if user uploaded image
                    if (Session["UserImage"] != null && Session["UserImage"].ToString() != "")
                    {
                        userAvatar.Src = Session["UserImage"].ToString();  // path from DB/session
                    }
                    else
                    {
                        userAvatar.Src = "img/50.jpg";  // default avatar
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