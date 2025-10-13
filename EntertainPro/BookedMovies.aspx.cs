using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using Twilio;
using Twilio.Rest.Api.V2010.Account;
using Twilio.Types;
using System.Web.UI.WebControls;
using static QRCoder.PayloadGenerator;

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
                        ticket_navigation.Visible = false;
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

        private bool SendWhatsAppNotification(int userId)
        {
            string customerNumber = "";
            string userName = "";
            string movieTitle = "";
            string seatNumber = "";
            string showDate = "";
            string showTime = "";

            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnStr"].ToString()))
            {
                con.Open();

                // ✅ Join all related tables to get booking details
                string query = @"
            SELECT TOP 1 
                u.FirstName, 
                u.phone, 
                m.Title AS MovieTitle, 
                b.SeatNumber, 
                sm.ShowDate, 
                sm.ShowTime
            FROM Bookings b
            INNER JOIN Users u ON b.UserID = u.UserID
            INNER JOIN ShowingMovies sm ON b.ShowingID = sm.ShowingID
            INNER JOIN Movies m ON sm.MovieID = m.MovieID
            WHERE u.UserID = @userId
            ORDER BY b.BookingDate DESC";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@userId", userId);
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            userName = reader["FirstName"].ToString();
                            customerNumber = reader["phone"].ToString();
                            movieTitle = reader["MovieTitle"].ToString();
                            seatNumber = reader["SeatNumber"].ToString();
                            showDate = Convert.ToDateTime(reader["ShowDate"]).ToString("dd MMM yyyy");
                            showTime = reader["ShowTime"].ToString();
                        }
                        else
                        {
                            ShowToast("No booking found for this user.", "error");
                            return false;
                        }
                    }
                }
            }

            if (string.IsNullOrEmpty(customerNumber))
            {
                ShowToast("Phone number not found.", "error");
                return false;
            }

            // ✅ Format phone number for WhatsApp
            if (!customerNumber.StartsWith("+91"))
                customerNumber = "+91" + customerNumber.TrimStart('0');

            // ✅ Build a dynamic and nice WhatsApp message
            string message =
                $"Hello {userName}, your booking for *{movieTitle}* is confirmed!\n" +
                $"Seat: {seatNumber}\n" +
                $"Date: {showDate}\n" +
                $"Time: {showTime}\n\n" +
                $"Thank you for choosing *EntertainPro*!";

            try
            {
                var accountSid = "YOUR_TWILIO_ID_HERE";
                var authToken = "YOUR_TWILIO_TOKEN_HERE";
                Twilio.TwilioClient.Init(accountSid, authToken);

                var msg = Twilio.Rest.Api.V2010.Account.MessageResource.Create(
                    to: new Twilio.Types.PhoneNumber("whatsapp:" + customerNumber),
                    from: new Twilio.Types.PhoneNumber("whatsapp:+14155238886"),
                    body: message
                );

                ShowToast($"Notification sent to {userName} ({customerNumber})", "success");
                return true;
            }
            catch (Exception ex)
            {
                ShowToast($"Error sending message: {ex.Message}", "error");
                return false;
            }
        }

        protected void btnNotify_Click(object sender, EventArgs e)
        {
            if (Session["UserID"] == null)
            {
                ShowToast("User not logged in!", "error");
                return;
            }

            int userId = Convert.ToInt32(Session["UserID"]);

            bool success = SendWhatsAppNotification(userId);

            if (success)
                Session["NotificationSent"] = true;
        }




        private void ShowToast(string message, string type)
        {
            string bgColor = type == "success" ? "green" : "red";
            string script = $@"
        var toast = document.getElementById('toastMessage');
        toast.style.backgroundColor = '{bgColor}';
        toast.innerText = '{message}';
        toast.style.display = 'block';
        setTimeout(function() {{ toast.style.display = 'none'; }}, 4000);
    ";
            ClientScript.RegisterStartupScript(this.GetType(), Guid.NewGuid().ToString(), script, true);
        }
    }

}