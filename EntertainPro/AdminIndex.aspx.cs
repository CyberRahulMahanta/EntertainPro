using System;
using System.Configuration;
using System.Data.SqlClient;

namespace EntertainPro
{
    public partial class AdminIndex : System.Web.UI.Page
    {
        // Connection string from Web.config
        string s = ConfigurationManager.ConnectionStrings["ConnStr"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadDashboard();
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
    }
}
