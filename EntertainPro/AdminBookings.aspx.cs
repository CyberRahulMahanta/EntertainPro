using QRCoder;
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
    public partial class AdminBookings : System.Web.UI.Page
    {
        string s = ConfigurationManager.ConnectionStrings["ConnStr"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadBookings();
            }
        }

        private void LoadBookings()
        {
            using (SqlConnection con = new SqlConnection(s))
            {
                string query = @"
                    SELECT 
                        b.BookingID,
                        (u.FirstName + ' ' + u.LastName) AS CustomerName,
                        m.Title,
                        s.ShowTime,
                        b.SeatNumber,
                        b.TicketPrice,
                        b.PaymentStatus,
                        b.BookingDate
                    FROM Bookings b
                    INNER JOIN Users u ON b.UserID = u.UserID
                    INNER JOIN ShowingMovies s ON b.ShowingID = s.ShowingID
                    INNER JOIN Movies m ON s.MovieID = m.MovieID
                    ORDER BY b.BookingID DESC";

                SqlCommand cmd = new SqlCommand(query, con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                rptBookings.DataSource = dt;
                rptBookings.DataBind();
            }
        }

        // Helper method to style the status column dynamically
        public string GetStatusBadge(string status)
        {
            switch (status.ToLower())
            {
                case "paid":
                    return "<span class='inline-flex items-center px-3 py-1 text-xs font-semibold rounded-full bg-emerald-100 text-emerald-700 ring-1 ring-emerald-200'>Paid</span>";

                case "unpaid":
                    return "<span class='inline-flex items-center px-3 py-1 text-xs font-semibold rounded-full bg-red-100 text-red-700 ring-1 ring-red-200'>Unpaid</span>";

                default:
                    return "<span class='inline-flex items-center px-3 py-1 text-xs font-semibold rounded-full bg-slate-100 text-slate-700 ring-1 ring-slate-200'>" + status + "</span>";
            }
        }

        protected void btnConfirmDelete_Click(object sender, EventArgs e)
        {
            int bookingId = int.Parse(hfDeleteBookingID.Value);

            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnStr"].ConnectionString))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("DELETE FROM Bookings WHERE BookingID = @BookingID", con);
                cmd.Parameters.AddWithValue("@BookingID", bookingId);
                cmd.ExecuteNonQuery();
            }

            LoadBookings();
        }

        protected void rptBookings_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "ViewDetails")
            {
                int bookingID = Convert.ToInt32(e.CommandArgument);

                string query = @"
            SELECT 
                b.BookingID,
                (u.FirstName + ' ' + u.LastName) AS FullName,
                m.Title AS MovieName,
                sm.Language,
                b.SeatNumber,
                b.TicketPrice AS Price,
                b.BookingDate,
                b.PaymentID,
                b.QrCodeImage,
                s.ScreenName,
                s.ScreenType,
                sm.ShowDate,
                sm.ShowTime
            FROM Bookings b
            INNER JOIN Users u ON b.UserID = u.UserID
            INNER JOIN ShowingMovies sm ON b.ShowingID = sm.ShowingID
            INNER JOIN Movies m ON sm.MovieID = m.MovieID
            INNER JOIN Screens s ON sm.ScreenID = s.ScreenID
            WHERE b.BookingID = @BookingID";

                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnStr"].ConnectionString))
                {
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@BookingID", bookingID);
                    con.Open();

                    SqlDataReader dr = cmd.ExecuteReader();
                    if (dr.Read())
                    {
                        lblBookingID.Text = dr["BookingID"].ToString();
                        lblCustomerName.Text = dr["FullName"].ToString();
                        lblMovieName.Text = dr["MovieName"].ToString();
                        lblLanguage.Text = dr["Language"].ToString();
                        lblSeatNumber.Text = dr["SeatNumber"].ToString();
                        lblPrice.Text = dr["Price"].ToString();
                        lblBookingDate.Text = Convert.ToDateTime(dr["BookingDate"]).ToString("dd-MM-yyyy");
                        lblPaymentID.Text = dr["PaymentID"].ToString();
                        lblScreenName.Text = dr["ScreenName"].ToString();
                        lblScreenType.Text = dr["ScreenType"].ToString();
                        lblShowDate.Text = Convert.ToDateTime(dr["ShowDate"]).ToString("dd-MM-yyyy");
                        lblShowTime.Text = dr["ShowTime"].ToString();

                        if (dr["QrCodeImage"] != DBNull.Value)
                        {
                            byte[] imgBytes = (byte[])dr["QrCodeImage"];
                            string base64String = Convert.ToBase64String(imgBytes);
                            imgQrCode.ImageUrl = "data:image/png;base64," + base64String;
                        }
                        else
                        {
                            imgQrCode.ImageUrl = "img/noqr.png";
                        }
                    }
                    con.Close();
                }

                // Open modal
                ScriptManager.RegisterStartupScript(this, this.GetType(), "showModal", "openModal('viewModal');", true);
            }
        }


    }
}