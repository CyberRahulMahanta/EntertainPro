using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;
using static System.Runtime.CompilerServices.RuntimeHelpers;

namespace EntertainPro
{
    public partial class AdminShowingMovies : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnStr"].ConnectionString);
        SqlDataAdapter da;
        DataSet ds;
        SqlCommand cmd;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadShowings();
                ComboToSelectMovie();
                ComboToSelectScreen();
            }
        }

        void LoadShowings()
        {
            string query = @"SELECT 
                    sm.MovieID,
                    m.Title AS MovieTitle,
                    m.ImageUrl,
                    sm.ShowDate,
                    COUNT(b.BookingID) AS TotalBookings
                 FROM ShowingMovies sm
                 INNER JOIN Movies m ON sm.MovieID = m.MovieID
                 LEFT JOIN Bookings b ON sm.ShowingID = b.ShowingID
                 GROUP BY sm.MovieID, m.Title, m.ImageUrl, sm.ShowDate
                 ORDER BY sm.ShowDate DESC";

            SqlDataAdapter da = new SqlDataAdapter(query, con);
            DataTable dt = new DataTable();
            da.Fill(dt);
            rptShowings.DataSource = dt;
            rptShowings.DataBind();
        }

        void getcon()
        {
            if (con.State == ConnectionState.Closed)
                con.Open();
        }
        void ComboToSelectMovie()
        {
            getcon();
            da = new SqlDataAdapter("SELECT * FROM Movies WHERE Category = 'Showing'", con);
            ds = new DataSet();
            da.Fill(ds);
            ddlMovies.Items.Add(new ListItem("--Select Showings Movie--", "0"));

            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                ddlMovies.Items.Add(ds.Tables[0].Rows[i][1].ToString());
            }

        }

        void ComboToSelectScreen()
        {
            getcon();
            da = new SqlDataAdapter("SELECT * FROM Screens", con);
            ds = new DataSet();
            da.Fill(ds);
            ddlScreens.Items.Add(new ListItem("--Select Showings Screen--", "0"));

            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                ddlScreens.Items.Add(ds.Tables[0].Rows[i][1].ToString());
            }

        }

        protected void ddlMovies_SelectedIndexChanged(object sender, EventArgs e)
        {
            getcon();
            da = new SqlDataAdapter("select MovieID from Movies where Title='" + ddlMovies.Text + "' AND Category ='Showing'", con);
            ds = new DataSet();
            da.Fill(ds);
            ViewState["MovieID"] = ds.Tables[0].Rows[0][0].ToString();
        }

        protected void ddlScreens_SelectedIndexChanged(object sender, EventArgs e)
        {
            getcon();
            da = new SqlDataAdapter("select ScreenID from Screens where ScreenName='" + ddlScreens.Text + "'", con);
            ds = new DataSet();
            da.Fill(ds);
            ViewState["ScreenID"] = ds.Tables[0].Rows[0][0].ToString();
        }

        protected void btnAddShow_Click(object sender, EventArgs e)
        {
            if (ddlMovies.SelectedValue == "0" || ddlScreens.SelectedValue == "0")
            {
                lblMessage.Text = "Please select a Movie and Screen!";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                return;
            }
            getcon();
            cmd = new SqlCommand("insert into ShowingMovies (MovieID, ScreenID, ShowDate) values ('" + ViewState["MovieID"] + "','" + ViewState["ScreenID"] + "','" + txtShowDate.Text + "')", con);
            cmd.ExecuteNonQuery();
            lblMessage.Text = "Show added successfully!";
            lblMessage.ForeColor = System.Drawing.Color.Green;
            Response.Redirect(Request.RawUrl);
        }
    }
}