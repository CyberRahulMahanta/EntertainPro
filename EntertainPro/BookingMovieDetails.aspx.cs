using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web.UI;

namespace EntertainPro
{
    // ✅ The helper classes are now defined here, directly inside the namespace.
    public class ScreenModel
    {
        public int ScreenID { get; set; }
        public string ScreenName { get; set; }
        public string ScreenType { get; set; }
        public List<TimeSlot> TimeSlots { get; set; }
    }

    public class TimeSlot
    {
        public TimeSpan ShowTime { get; set; }
        public string Status { get; set; }
        public string Language { get; set; }
        public int ShowingID { get; set; }
        public string ShowTimeFormatted
        {
            get { return DateTime.Today.Add(ShowTime).ToString("hh:mm tt"); }
        }
    }

    // The page's main class containing all the logic.
    public partial class BookingMovieDetails : System.Web.UI.Page
    {
        // Connection string
        string s = ConfigurationManager.ConnectionStrings["ConnStr"].ConnectionString;

        // Properties to store screen list and show dates, accessible by the .aspx page
        protected List<ScreenModel> screensList = new List<ScreenModel>();
        protected List<DateTime> showDatesList = new List<DateTime>();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["Id"] != null)
                {
                    int movieId;
                    if (int.TryParse(Request.QueryString["Id"], out movieId))
                    {
                        LoadMovieDetails(movieId);
                        LoadShowDates(movieId);

                        // Determine the selected date from query string, or default to today
                        DateTime selectedDate;
                        if (!DateTime.TryParse(Request.QueryString["date"], out selectedDate))
                        {
                            selectedDate = DateTime.Today;
                        }

                        // Bind screens and showtimes for the selected movie and date
                        BindScreens(movieId, selectedDate);
                    }
                    else
                    {
                        Response.Write("Invalid Movie Id");
                    }
                }
            }
        }

        // Load general movie details like title, poster, etc.
        private void LoadMovieDetails(int movieId)
        {
            using (SqlConnection con = new SqlConnection(s))
            {
                con.Open();
                string query = "SELECT * FROM Movies WHERE MovieID=@MovieID";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@MovieID", movieId);
                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        if (dr.Read())
                        {
                            imgPoster.ImageUrl = dr["ImageUrl"].ToString();
                            lblTitle.Text = dr["Title"].ToString();
                            lblRating.Text = dr["Rating"].ToString();
                            lblGenre.Text = dr["Genre"].ToString();
                            lblDuration.Text = dr["Duration"].ToString();
                            lblLanguage.Text = dr["Language"].ToString();
                            lblReleaseDate.Text = Convert.ToDateTime(dr["ReleaseDate"]).ToString("dddd, MMM dd, yyyy");
                            trailerLink.HRef = dr["TrailerUrl"].ToString();
                        }
                    }
                }
            }
        }

        // Load available show dates into the list for the top date picker
        private void LoadShowDates(int movieId)
        {
            showDatesList = new List<DateTime>();
            using (SqlConnection con = new SqlConnection(s))
            {
                con.Open();
                string query = "SELECT DISTINCT CAST(ShowDate AS DATE) AS ShowDate FROM ShowingMovies WHERE MovieID = @MovieID AND CAST(ShowDate AS DATE) >= CAST(GETDATE() AS DATE) ORDER BY ShowDate;";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@MovieID", movieId);
                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        while (dr.Read())
                        {
                            showDatesList.Add(Convert.ToDateTime(dr["ShowDate"]));
                        }
                    }
                }
            }
        }

        // Bind screens and their associated time slots
        private void BindScreens(int movieId, DateTime showDate)
        {
            using (SqlConnection con = new SqlConnection(s))
            {
                con.Open();
                // Assumes your table is ShowingMovies, adjust if necessary
                string query = @"
                    SELECT s.ScreenID, s.ScreenName, s.ScreenType,
                           sm.ShowingID, sm.ShowTime, sm.Status, sm.Language
                    FROM Screens s
                    INNER JOIN ShowingMovies sm ON sm.ScreenID = s.ScreenID
                    WHERE sm.MovieID=@MovieID AND CAST(sm.ShowDate AS DATE)=@ShowDate
                    ORDER BY s.ScreenID, sm.ShowTime";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@MovieID", movieId);
                    cmd.Parameters.AddWithValue("@ShowDate", showDate.Date);

                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        var screenMap = new Dictionary<int, ScreenModel>();
                        while (dr.Read())
                        {
                            int screenId = Convert.ToInt32(dr["ScreenID"]);
                            if (!screenMap.ContainsKey(screenId))
                            {
                                screenMap[screenId] = new ScreenModel
                                {
                                    ScreenID = screenId,
                                    ScreenName = dr["ScreenName"].ToString(),
                                    ScreenType = dr["ScreenType"].ToString(),
                                    TimeSlots = new List<TimeSlot>()
                                };
                            }
                            screenMap[screenId].TimeSlots.Add(new TimeSlot
                            {
                                ShowTime = (TimeSpan)dr["ShowTime"],
                                Status = dr["Status"].ToString(),
                                Language = dr["Language"].ToString(),
                                ShowingID = Convert.ToInt32(dr["ShowingID"])
                            });
                        }
                        screensList = screenMap.Values.ToList();
                    }
                }
            }
            // Show/hide the "No Showtimes" placeholder based on whether any screens were found
            phNoShowtime.Visible = !screensList.Any();
        }
    }
}