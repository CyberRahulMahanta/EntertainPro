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
    public partial class AdminTheaters : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnStr"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadScreens();
                if (Request.QueryString["deleted"] == "1")
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "showToast",
                        "showToast('Screen deleted successfully!', 'success');", true);
                }
            }
        }

        void getcon()
        {
            if (con.State != ConnectionState.Open)
                con.Open();
        }
        void LoadScreens()
        {
            string query = @"
        SELECT 
            s.ScreenID,
            s.ScreenName,
            s.ScreenType,
            s.Capacity,
            s.Description,
            s.ClassicSeat,
            s.PrimeSeat,
            s.ReclinerSeat,
            m.Title AS CurrentMovie
        FROM Screens s
        LEFT JOIN ShowingMovies sm 
            ON s.ScreenID = sm.ScreenID AND sm.Status = 'active'
        LEFT JOIN Movies m 
            ON sm.MovieID = m.MovieID
        ORDER BY s.ScreenID";

            using (SqlCommand cmd = new SqlCommand(query, con))
            using (SqlDataAdapter da = new SqlDataAdapter(cmd))
            {
                DataTable dt = new DataTable();
                da.Fill(dt);

                DataTable result = dt.Clone(); // copy structure

                var screenGroups = dt.AsEnumerable()
                    .GroupBy(r => r["ScreenID"])
                    .Select(g =>
                    {
                        DataRow first = g.First();
                        string movies = string.Join(", ",
                            g.Where(x => !string.IsNullOrEmpty(x["CurrentMovie"].ToString()))
                             .Select(x => x["CurrentMovie"].ToString())
                             .Distinct() // ✅ remove duplicate titles
                        );

                        DataRow newRow = result.NewRow();
                        newRow.ItemArray = first.ItemArray;
                        newRow["CurrentMovie"] = string.IsNullOrEmpty(movies) ? "No active movie" : movies;
                        return newRow;
                    });

                foreach (var row in screenGroups)
                    result.Rows.Add(row);

                rptScreens.DataSource = result;
                rptScreens.DataBind();
            }
        }

        protected void btnSaveScreen_Click(object sender, EventArgs e)
        {
            try
            {
                if (string.IsNullOrWhiteSpace(txtScreenName.Text) ||
                    string.IsNullOrWhiteSpace(ddlScreenType.SelectedValue) ||
                    string.IsNullOrWhiteSpace(txtCapacity.Text) ||
                    string.IsNullOrWhiteSpace(txtClassic.Text) ||
                    string.IsNullOrWhiteSpace(txtPrime.Text) ||
                    string.IsNullOrWhiteSpace(txtRecliner.Text))
                {
                    lblValidation.Text = "⚠ Please fill all required fields!";
                    lblValidation.CssClass = "inline-block text-sm font-medium text-red-700 bg-red-100 border border-red-300 rounded-md px-3 py-1";
                    ScriptManager.RegisterStartupScript(this, GetType(), "ShowModal", "showModal();", true);
                    return;
                }

                getcon();


                string query = "INSERT INTO Screens (ScreenName, ScreenType, Capacity, Description, ClassicSeat, PrimeSeat, ReclinerSeat) " +
                               "VALUES ('" + txtScreenName.Text + "', '" + ddlScreenType.SelectedValue + "', '" + txtCapacity.Text + "', '" + txtDescription.Text + "', '" + txtClassic.Text + "', '" + txtPrime.Text + "', '" + txtRecliner.Text + "')";

                SqlCommand cmd = new SqlCommand(query, con);
                int result = cmd.ExecuteNonQuery();

                if (result > 0)
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "showToast('Screen added successfully!');", true);
                    lblValidation.Visible = false;
                }
                else
                {
                    lblValidation.Text = "⚠ Failed to add screen!";
                    lblValidation.Visible = true;
                }
            }
            catch (Exception ex)
            {
                lblValidation.Text = "❌ Error: " + ex.Message;
                lblValidation.Visible = true;
            }
            finally
            {
                if (con != null && con.State == System.Data.ConnectionState.Open)
                    con.Close();
            }
            ClearFields();
            LoadScreens();
        }

        void ClearFields()
        {
            txtScreenName.Text = "";
            ddlScreenType.SelectedIndex = 0;
            txtCapacity.Text = "";
            txtDescription.Text = "";
            txtClassic.Text = "";
            txtPrime.Text = "";
            txtRecliner.Text = "";
        }
        protected void btnConfirmDelete_Click(object sender, EventArgs e)
        {
            try
            {
                string screenId = hiddenDeleteId.Value; // now it matches JS

                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnStr"].ConnectionString))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("DELETE FROM Screens WHERE ScreenID = @id", con);
                    cmd.Parameters.AddWithValue("@id", screenId);
                    cmd.ExecuteNonQuery();
                }

                Response.Redirect(Request.RawUrl.Split('?')[0] + "?deleted=1");
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "showError",
                    $"showToast('Error: {ex.Message}', 'error');", true);
            }
            LoadScreens();
        }


    }
}