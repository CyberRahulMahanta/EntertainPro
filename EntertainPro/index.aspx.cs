using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
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
        DataSet ds;
        SqlCommand cmd;
        SqlDataAdapter da;
        SqlConnection con;

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
                fillWishlist();

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

        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }
        protected void dlUpcoming_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "cmd_view")
            {
                int id = Convert.ToInt32(e.CommandArgument);
                Response.Redirect("viewDetails.aspx?id=" + id);
            }
            else if (e.CommandName == "AddToWishlist")
            {
                if (Session["UserID"] == null)
                {
                    Response.Redirect("Login.aspx");
                    return;
                }
                getcon();
                da = new SqlDataAdapter("Select * from Users where UserID  ='" + Session["UserID"] + "'", con);
                ds = new DataSet();
                da.Fill(ds);

                int UserID = Convert.ToInt32(Session["UserID"]);
                int MovieID = Convert.ToInt32(e.CommandArgument);

                da = new SqlDataAdapter("Select * from Movies where MovieID = '" + MovieID + "'", con);
                ds = new DataSet();
                da.Fill(ds);

                string Movie_Name = ds.Tables[0].Rows[0][1].ToString();
                string Language = ds.Tables[0].Rows[0][9].ToString();
                string ImageURL = ds.Tables[0].Rows[0][4].ToString();


                cmd = new SqlCommand("Insert into Wishlists(UserID, MovieID, Movie_Name, Language, ImageURL) values ('" + UserID + "','" + MovieID + "', '" + Movie_Name + "','" + Language + "','" + ImageURL + "')", con);
                int rows = cmd.ExecuteNonQuery(); ;

                if (rows > 0)
                {
                    fillWishlist();
                    ScriptManager.RegisterStartupScript(this, GetType(), "success",
                        "showLabelToast('Movie added to your wishlist successfully!', 'success');", true);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "error",
                        "showLabelToast('Failed to add movie to wishlist!', 'error');", true);
                }

            }
        }

        void fillWishlist()
        {

            int userId = Convert.ToInt32(Session["UserID"]);
            con = new SqlConnection(s);

            da = new SqlDataAdapter("SELECT * FROM Wishlists WHERE UserId='" + userId + "'", con);
            ds = new DataSet();
            da.Fill(ds);

            DataList2.DataSource = ds;
            DataList2.DataBind();

            wishlistCount.InnerText = ds.Tables[0].Rows.Count.ToString();
        }

        protected void wishlistBtn_Click(object sender, EventArgs e)
        {
            wishlistPanel.Visible = true;
            wishlistPanel.CssClass = "wishlist-panel active"; // slide-in
        }

        protected void CloseWishlist_Click(object sender, EventArgs e)
        {
            wishlistPanel.CssClass = "wishlist-panel"; // hide panel
        }

        protected void DataList2_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "Remove")
            {
                int WishList_ID = Convert.ToInt32(e.CommandArgument);
                int userId = Convert.ToInt32(Session["UserID"]);

                using (SqlConnection con = new SqlConnection(s))
                {
                    string query = "DELETE FROM Wishlists WHERE WishList_ID=@WishList_ID AND UserId=@UserId";
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@WishList_ID", WishList_ID);
                        cmd.Parameters.AddWithValue("@UserId", userId);
                        con.Open();
                        cmd.ExecuteNonQuery();
                        con.Close();
                    }
                }
                fillWishlist();
            }
        }

    }
}