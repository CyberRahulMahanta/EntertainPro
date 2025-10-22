using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EntertainPro
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        String s = ConfigurationManager.ConnectionStrings["ConnStr"].ConnectionString;
        DataSet ds;
        SqlDataAdapter da;
        SqlConnection con;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["UserID"] != null)
                {
                    fillWishlist();
                }
                if (Session["unm"] != null)
                {
                    if (navUserItem != null) navUserItem.Visible = true;
                    if (navLoginItem != null) navLoginItem.Visible = false;

                    if (navUserName != null) navUserName.InnerText = Session["unm"].ToString();

                    if (userAvatar != null)
                    {
                        userAvatar.Src = string.IsNullOrEmpty(Session["UserImage"] as string)
                            ? "img/50.jpg"
                            : Session["UserImage"].ToString();
                    }
                }
                else
                {
                    if (navUserItem != null) navUserItem.Visible = false;
                    if (navLoginItem != null) navLoginItem.Visible = true;
                }
            }
        }

        void fillWishlist()
        {
            if (Session["UserID"] == null || DataList2 == null)
                return;

            int userId = Convert.ToInt32(Session["UserID"]);
            using (SqlConnection con = new SqlConnection(s))
            {
                SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM Wishlists WHERE UserId=@UserId", con);
                da.SelectCommand.Parameters.AddWithValue("@UserId", userId);
                DataSet ds = new DataSet();
                da.Fill(ds);

                DataList2.DataSource = ds;
                DataList2.DataBind();

                wishlistCount.InnerText = ds.Tables[0].Rows.Count.ToString();
            }
        }



        protected void wishlistBtn_Click(object sender, EventArgs e)
        {
            // *** FIX: Add null check for wishlistPanel ***
            if (wishlistPanel != null)
            {
                wishlistPanel.Visible = true;
                wishlistPanel.CssClass = "wishlist-panel active"; // slide-in
            }
        }

        protected void CloseWishlist_Click(object sender, EventArgs e)
        {
            // *** FIX: Add null check for wishlistPanel ***
            if (wishlistPanel != null)
            {
                wishlistPanel.CssClass = "wishlist-panel"; // hide panel
            }
        }

        // ... existing code ...

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