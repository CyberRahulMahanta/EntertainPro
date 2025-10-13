using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EntertainPro
{
    public partial class AdminDashboard : System.Web.UI.Page
    {
        // Connection string from Web.config
        string s = ConfigurationManager.ConnectionStrings["ConnStr"].ConnectionString;
        protected DataTable TopMoviesData = new DataTable();
        protected DataTable RecentBookingsData = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadDashboard();
                LoadChartData();
                LoadTopMovies();
                LoadRecentBookings();
            }
        }

        private void LoadDashboard()
        {
            using (SqlConnection con = new SqlConnection(s))
            {
                con.Open();

                // --- Total Revenue ---
                string revenueSql = "SELECT ISNULL(SUM(TicketPrice),0) FROM Bookings WHERE PaymentStatus='Paid'";
                SqlCommand cmdRevenue = new SqlCommand(revenueSql, con);
                decimal totalRevenue = Convert.ToDecimal(cmdRevenue.ExecuteScalar());
                lblTotalRevenue.Text = "Rs." + totalRevenue.ToString("N0");

                // Revenue last month using SQL concatenation
                int lastMonth = DateTime.Now.Month - 1;
                string revenueLastMonthSql = "SELECT ISNULL(SUM(TicketPrice),0) FROM Bookings WHERE PaymentStatus='Paid' AND MONTH(BookingDate)=" + lastMonth;
                SqlCommand cmdRevenueLastMonth = new SqlCommand(revenueLastMonthSql, con);
                decimal revenueLastMonth = Convert.ToDecimal(cmdRevenueLastMonth.ExecuteScalar());
                decimal revenueChange = revenueLastMonth == 0 ? 100 : ((totalRevenue - revenueLastMonth) / revenueLastMonth) * 100;
                lblRevenueChange.Text = revenueChange.ToString("N1");

                // --- Tickets Sold ---
                string ticketsSql = "SELECT COUNT(*) FROM Bookings WHERE PaymentStatus='Paid'";
                SqlCommand cmdTickets = new SqlCommand(ticketsSql, con);
                int ticketsSold = Convert.ToInt32(cmdTickets.ExecuteScalar());
                lblTicketsSold.Text = ticketsSold.ToString("N0");

                // Tickets sold last week using SQL concatenation
                int currentWeek = DateTime.Now.DayOfYear / 7;
                int lastWeek = currentWeek - 1;
                string ticketsLastWeekSql = "SELECT COUNT(*) FROM Bookings WHERE PaymentStatus='Paid' AND DATEPART(week, BookingDate)=" + lastWeek;
                SqlCommand cmdTicketsLastWeek = new SqlCommand(ticketsLastWeekSql, con);
                int ticketsLastWeek = Convert.ToInt32(cmdTicketsLastWeek.ExecuteScalar());
                decimal ticketsChange = ticketsLastWeek == 0 ? 100 : ((ticketsSold - ticketsLastWeek) / (decimal)ticketsLastWeek) * 100;
                lblTicketsChange.Text = ticketsChange.ToString("N1");

                // --- Active Users ---
                string usersSql = "SELECT COUNT(*) FROM Users where Role='User'";
                SqlCommand cmdUsers = new SqlCommand(usersSql, con);
                int activeUsers = Convert.ToInt32(cmdUsers.ExecuteScalar());
                lblActiveUsers.Text = activeUsers.ToString("N0");

                // Active users last month
                string usersLastMonthSql = "SELECT COUNT(*) FROM Users WHERE Role='User' AND MONTH(CreatedAt)=" + lastMonth;
                SqlCommand cmdUsersLastMonth = new SqlCommand(usersLastMonthSql, con);
                int usersLastMonth = Convert.ToInt32(cmdUsersLastMonth.ExecuteScalar());
                decimal usersChange = usersLastMonth == 0 ? 100 : ((activeUsers - usersLastMonth) / (decimal)usersLastMonth) * 100;
                lblUsersChange.Text = usersChange.ToString("N1");

                // --- Movies Playing ---
                string moviesSql = "SELECT COUNT(*) FROM ShowingMovies";
                SqlCommand cmdMovies = new SqlCommand(moviesSql, con);
                int moviesPlaying = Convert.ToInt32(cmdMovies.ExecuteScalar());
                lblMoviesPlaying.Text = moviesPlaying.ToString("N0");

                // New releases this month
                string moviesNewSql = "SELECT COUNT(*) FROM Movies WHERE MONTH(ReleaseDate)=" + DateTime.Now.Month;
                SqlCommand cmdMoviesNew = new SqlCommand(moviesNewSql, con);
                int newMovies = Convert.ToInt32(cmdMoviesNew.ExecuteScalar());
                lblMoviesChange.Text = newMovies.ToString();
            }
        }

        private void LoadChartData()
        {
            DataTable dt = new DataTable();
            // Assuming 's' is the connection string

            using (SqlConnection con = new SqlConnection(s))
            {
                // ❌ CORRECTION 1: The original query used DATEADD(DAY, -7, GETDATE())
                // which gives a *rolling 7-day window*, not the current calendar week.
                // This corrected query gets data for the CURRENT CALENDAR WEEK
                // and uses DATEDIFF(DAY, 0, BookingDate) to ensure proper chronological grouping/ordering.
                string query = @"
        SELECT 
            CAST(BookingDate AS DATE) AS BookingDay, 
            DATENAME(WEEKDAY, BookingDate) AS DayName, 
            COUNT(*) AS TotalTickets
        FROM Bookings
        WHERE 
            BookingDate >= DATEADD(wk, DATEDIFF(wk, 0, GETDATE()), 0) 
            AND BookingDate < DATEADD(wk, DATEDIFF(wk, 0, GETDATE()), 7)
        GROUP BY 
            CAST(BookingDate AS DATE), 
            DATENAME(WEEKDAY, BookingDate)
        ORDER BY 
            BookingDay;";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    con.Open();
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    da.Fill(dt);
                }
            }

            // ✅ Convert DataTable to a list of simple objects (This part was correct)
            var dataList = new System.Collections.Generic.List<object>();
            foreach (DataRow row in dt.Rows)
            {
                // Use the new BookingDay column for more descriptive JSON data
                dataList.Add(new
                {
                    BookingDay = ((DateTime)row["BookingDay"]).ToString("yyyy-MM-dd"), // Full date
                    DayName = row["DayName"].ToString(), // Day name
                    TotalTickets = Convert.ToInt32(row["TotalTickets"])
                });
            }

            // ✅ Serialize the clean list (This part was correct)
            System.Web.Script.Serialization.JavaScriptSerializer js = new System.Web.Script.Serialization.JavaScriptSerializer();
            string jsonData = js.Serialize(dataList);

            // ✅ Register JSON to be used by JS (This part was correct)
            ClientScript.RegisterStartupScript(this.GetType(), "chartData", $"var chartData = {jsonData};", true);
        }

        private void LoadTopMovies()
        {
            string connStr = ConfigurationManager.ConnectionStrings["ConnStr"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connStr))
            {
                string query = @"
                    SELECT TOP 5 m.Title, m.Genre, m.Duration, COUNT(b.BookingID) AS TicketsSold
                    FROM Movies m
                    INNER JOIN ShowingMovies s ON m.MovieID = s.MovieID
                    INNER JOIN Bookings b ON s.ShowingID = b.ShowingID
                    WHERE b.BookingDate >= DATEADD(DAY, -7, GETDATE())
                    GROUP BY m.Title, m.Genre, m.Duration
                    ORDER BY TicketsSold DESC
                ";

                SqlDataAdapter da = new SqlDataAdapter(query, con);
                da.Fill(TopMoviesData);
            }
        }

        protected string GetRankColor(int rank)
        {
            switch (rank)
            {
                case 0: return "bg-red-600";
                case 1: return "bg-slate-400";
                case 2: return "bg-amber-500";
                default: return "bg-gray-400";
            }
        }


        private void LoadRecentBookings()
        {
            string connStr = System.Configuration.ConfigurationManager.ConnectionStrings["ConnStr"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connStr))
            {
                string query = @"
    SELECT TOP 5 
        b.BookingID, 
        m.Title, 
        m.Genre, 
        m.Duration, -- Total minutes
        s.ShowTime, 
        b.SeatNumber, 
        b.TicketPrice, 
        b.PaymentStatus
    FROM Bookings b
    INNER JOIN ShowingMovies s ON b.ShowingID = s.ShowingID
    INNER JOIN Movies m ON s.MovieID = m.MovieID
    ORDER BY b.BookingDate DESC";



                SqlDataAdapter da = new SqlDataAdapter(query, con);
                DataTable dt = new DataTable();
                da.Fill(dt);

                rptRecentBookings.DataSource = dt;
                rptRecentBookings.DataBind();
            }
        }

        protected string FormatDuration(object durationObj)
        {
            if (durationObj == null || durationObj == DBNull.Value)
                return "0h 0m";

            int totalMinutes;
            // Try parse as int if it's string
            if (!int.TryParse(durationObj.ToString(), out totalMinutes))
                return "0h 0m";

            int hours = totalMinutes / 60;
            int minutes = totalMinutes % 60;
            return $"{hours}h {minutes}m";
        }


        protected string GetAmountClass(string status)
        {
            return status == "Completed" ? "text-green-600" : "text-yellow-600";
        }

        protected string GetStatusClass(string status)
        {
            return status == "Completed" ? "bg-green-100 text-green-800" : "bg-yellow-100 text-yellow-800";
        }

    }
}
