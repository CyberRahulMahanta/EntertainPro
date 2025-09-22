using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EntertainPro
{
    public partial class BookedMovies : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserID"] == null)
            {
                Response.Redirect("Login.aspx");
                return;
            }

            if (!IsPostBack)
            {
                ViewState["PageIndex"] = 0;
                BindTickets();
            }
        }

        private void BindTickets()
        {
            string connStr = ConfigurationManager.ConnectionStrings["ConnStr"].ConnectionString;
            using (var con = new SqlConnection(connStr))
            {
                string query = @"
                    SELECT 
                        B.PaymentID, MIN(U.FirstName + ' ' + U.LastName) AS FullName, MIN(M.Title) AS MovieTitle,
                        MIN(M.ImageUrl) AS PosterUrl, MIN(SCR.ScreenType) AS ScreenName,
                        MIN(CAST(SM.ShowDate AS DATETIME) + CAST(SM.ShowTime AS DATETIME)) AS FullShowTime,
                        MIN(B.PaymentStatus) AS PaymentStatus, MIN(B.QrCodeImage) AS QrCodeImage,
                        SUM(B.TicketPrice) AS TotalPrice, STRING_AGG(B.SeatNumber, ', ') AS AllSeats
                    FROM Bookings AS B
                    INNER JOIN ShowingMovies AS SM ON B.ShowingID = SM.ShowingID
                    INNER JOIN Movies AS M ON SM.MovieID = M.MovieID
                    INNER JOIN Screens AS SCR ON SM.ScreenID = SCR.ScreenID
                    INNER JOIN Users AS U ON B.UserID = U.UserID
                    WHERE B.UserID = @UserID
                    GROUP BY B.PaymentID
                    ORDER BY MIN(CAST(SM.ShowDate AS DATETIME) + CAST(SM.ShowTime AS DATETIME)) DESC;";

                using (var cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@UserID", Session["UserID"].ToString());

                    var dt = new DataTable();
                    var da = new SqlDataAdapter(cmd);
                    da.Fill(dt);

                    if (dt.Rows.Count > 0)
                    {
                        PagedDataSource pds = new PagedDataSource();
                        pds.DataSource = dt.DefaultView;
                        pds.AllowPaging = true;
                        pds.PageSize = 1;
                        pds.CurrentPageIndex = Convert.ToInt32(ViewState["PageIndex"]);

                        btnPrevious.Enabled = !pds.IsFirstPage;
                        btnNext.Enabled = !pds.IsLastPage;

                        dlBookings.DataSource = pds;
                        dlBookings.DataBind();
                    }
                    else
                    {
                        dlBookings.Visible = false;
                        pnlNoBookings.Visible = true;
                    }
                }
            }
        }

        // "Next" button click handler
        protected void btnNext_Click(object sender, EventArgs e)
        {
            int currentPage = Convert.ToInt32(ViewState["PageIndex"]);
            currentPage++;
            ViewState["PageIndex"] = currentPage;
            BindTickets();
        }

        // "Previous" button click handler
        protected void btnPrevious_Click(object sender, EventArgs e)
        {
            int currentPage = Convert.ToInt32(ViewState["PageIndex"]);
            currentPage--;
            ViewState["PageIndex"] = currentPage;
            BindTickets();
        }
        public string GetStatusBadge(object statusObj)
        {
            if (statusObj != DBNull.Value)
            {
                string status = statusObj.ToString().ToLower();
                return $"<span class='info-value status-{status}'>{status.ToUpper()}</span>";
            }
            return "";
        }

        public string GetQrCodeUrl(object qrCodeData)
        {
            if (qrCodeData != DBNull.Value && ((byte[])qrCodeData).Length > 0)
            {
                byte[] bytes = (byte[])qrCodeData;
                return "data:image/png;base64," + Convert.ToBase64String(bytes);
            }
            return "QR Code wasnot generated..!";
        }

        protected void btnDownload_Click(object sender, EventArgs e)
        {

        }
    }
}