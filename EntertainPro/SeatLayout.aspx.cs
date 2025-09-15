using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Web.Script.Serialization; // Requires a reference to System.Web.Extensions
using System.Web.UI;

namespace EntertainPro
{
    public class SeatCategory
    {
        public string Name { get; set; }
        public decimal Price { get; set; }
        public List<string> RowLetters { get; set; }
        public string CategoryKey { get; set; }
    }

    public partial class SeatLayout : System.Web.UI.Page
    {
        public string MovieTitle { get; protected set; } = "Movie Not Found";
        public string MovieImageUrl { get; protected set; } = "img/placeholder.jpg";
        public string MovieGenre { get; protected set; } = "N/A";
        public string MovieRating { get; protected set; } = "N/A";
        public string ShowDayDateTime { get; protected set; } = "N/A";
        public string ScreenType { get; protected set; } = "N/A";

        // **CHANGE 1: Replaced the static configuration with a public property.**
        // This list will now be populated dynamically for each page request with prices from the database.
        public List<SeatCategory> SeatCategories { get; set; }

        public SeatLayout()
        {
            // Initialize with an empty list to avoid null reference exceptions.
            SeatCategories = new List<SeatCategory>();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int showingId = 0;

                if (int.TryParse(Request.QueryString["showingId"], out int id))
                {
                    showingId = id;
                }
                else
                {
                    string movieId = Request.QueryString["movieId"];
                    string screenId = Request.QueryString["screenId"];
                    string showDate = Request.QueryString["showDate"];
                    string showTime = Request.QueryString["showTime"];

                    if (!string.IsNullOrEmpty(movieId) && !string.IsNullOrEmpty(screenId) && !string.IsNullOrEmpty(showDate) && !string.IsNullOrEmpty(showTime))
                    {
                        showingId = FindShowingId(movieId, screenId, showDate, showTime);
                    }
                }

                if (showingId > 0)
                {
                    LoadShowingDetails(showingId);
                }
                else if (ltlSeatMap.Text == "")
                {
                    ltlSeatMap.Text = "<p style='color: red; text-align: center;'>Error: Movie showing could not be found or specified.</p>";
                }
            }
        }

        private int FindShowingId(string movieId, string screenId, string showDate, string showTime)
        {
            int foundId = 0;
            string connStr = ConfigurationManager.ConnectionStrings["ConnStr"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connStr))
            {
                string query = @"SELECT ShowingID FROM ShowingMovies 
                                 WHERE MovieID = @MovieID AND ScreenID = @ScreenID 
                                 AND ShowDate = @ShowDate AND ShowTime = @ShowTime";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@MovieID", movieId);
                    cmd.Parameters.AddWithValue("@ScreenID", screenId);
                    cmd.Parameters.AddWithValue("@ShowDate", showDate);
                    cmd.Parameters.AddWithValue("@ShowTime", showTime);

                    try
                    {
                        con.Open();
                        object result = cmd.ExecuteScalar();
                        if (result != null && result != DBNull.Value)
                        {
                            foundId = Convert.ToInt32(result);
                        }
                    }
                    catch (Exception ex)
                    {
                        ltlSeatMap.Text = "<p style='color: red; text-align: center;'>DATABASE ERROR (FindShowingId): " + ex.Message + "</p>";
                    }
                }
            }
            return foundId;
        }

        private void LoadShowingDetails(int showingId)
        {
            string connStr = ConfigurationManager.ConnectionStrings["ConnStr"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connStr))
            {
                try
                {
                    con.Open();

                    // **CHANGE 2: Updated query to fetch dynamic seat prices from the Screens table.**
                    string query = @"
                        SELECT 
                            m.Title, m.ImageUrl, m.Genre, m.Rating, 
                            sm.ShowDate, sm.ShowTime, s.ScreenType,
                            s.ClassicSeat AS ClassicPrice, 
                            s.PrimeSeat AS PrimePrice, 
                            s.ReclinerSeat AS ReclinerPrice
                        FROM ShowingMovies sm
                        JOIN Movies m ON sm.MovieID = m.MovieID
                        JOIN Screens s ON sm.ScreenID = s.ScreenID
                        WHERE sm.ShowingID = @ShowingID AND sm.Status = 'active'";

                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@ShowingID", showingId);
                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            if (reader.Read())
                            {
                                MovieTitle = reader["Title"].ToString();
                                MovieImageUrl = reader["ImageUrl"].ToString();
                                MovieGenre = reader["Genre"].ToString();
                                MovieRating = reader["Rating"].ToString();
                                ScreenType = reader["ScreenType"].ToString();
                                DateTime showDate = (DateTime)reader["ShowDate"];
                                TimeSpan showTime = (TimeSpan)reader["ShowTime"];
                                DateTime showDateTime = showDate.Add(showTime);
                                ShowDayDateTime = showDateTime.ToString("ddd, dd MMM, hh:mm tt", CultureInfo.InvariantCulture);

                                // **CHANGE 3: Populate the SeatCategories list with prices from the database.**
                                // The row letters/layout is still fixed, but prices are now dynamic.
                                this.SeatCategories = new List<SeatCategory>
                                {
                                    new SeatCategory {
                                        Name = "CLASSIC",
                                        Price = (decimal)reader["ClassicPrice"],
                                        CategoryKey = "classic",
                                        RowLetters = new List<string> { "A", "B", "C", "D" }
                                    },
                                    new SeatCategory {
                                        Name = "PRIME",
                                        Price = (decimal)reader["PrimePrice"],
                                        CategoryKey = "prime",
                                        RowLetters = new List<string> { "E", "F", "G" }
                                    },
                                    new SeatCategory {
                                        Name = "RECLINER",
                                        Price = (decimal)reader["ReclinerPrice"],
                                        CategoryKey = "recliner",
                                        RowLetters = new List<string> { "R" }
                                    }
                                };
                            }
                            else
                            {
                                ltlSeatMap.Text = "<p style='color: red; text-align: center;'>Error: The specified showing could not be found or is inactive.</p>";
                                return;
                            }
                        }
                    }

                    var bookedSeats = new HashSet<string>();
                    string bookedSeatsQuery = "SELECT SeatNumber FROM Bookings WHERE ShowingID = @ShowingID";

                    using (SqlCommand cmd = new SqlCommand(bookedSeatsQuery, con))
                    {
                        cmd.Parameters.AddWithValue("@ShowingID", showingId);
                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                bookedSeats.Add(reader["SeatNumber"].ToString());
                            }
                        }
                    }

                    // This method will now use the dynamically populated SeatCategories list.
                    ltlSeatMap.Text = GenerateSeatMapHtml(bookedSeats);
                }
                catch (Exception ex)
                {
                    ltlSeatMap.Text = "<p style='color: red; text-align: center;'>DATABASE ERROR (LoadShowingDetails): " + ex.Message + "</p>";
                }
            }
        }

        private string GenerateSeatMapHtml(HashSet<string> bookedSeats)
        {
            var sb = new StringBuilder();
            // **CHANGE 4: Using the dynamic 'SeatCategories' property instead of the old static list.**
            foreach (var category in this.SeatCategories)
            {
                sb.AppendFormat("<div class='seat-category'>");
                sb.AppendFormat("<h2>{0} (₹{1:F2})</h2>", category.Name, category.Price);
                bool isRecliner = (category.CategoryKey == "recliner");

                foreach (var rowLetter in category.RowLetters)
                {
                    sb.AppendFormat("<div class='seat-row {0}'>", isRecliner ? "recliner-row" : "");
                    sb.AppendFormat("<span class='row-label'>{0}</span>", rowLetter);
                    sb.Append("<div class='seat-group'>");
                    for (int i = 12; i >= 7; i--) sb.Append(GenerateSeatDiv(rowLetter, i, isRecliner, bookedSeats));
                    sb.Append("</div>");
                    sb.Append("<div class='aisle'></div>");
                    sb.Append("<div class='seat-group'>");
                    for (int i = 6; i >= 1; i--) sb.Append(GenerateSeatDiv(rowLetter, i, isRecliner, bookedSeats));
                    sb.Append("</div>");
                    sb.AppendFormat("<span class='row-label'>{0}</span>", rowLetter);
                    sb.Append("</div>");
                }
                sb.Append("</div>");
            }
            return sb.ToString();
        }

        private string GenerateSeatDiv(string rowLetter, int seatNum, bool isRecliner, HashSet<string> bookedSeats)
        {
            string seatId = $"{rowLetter}{seatNum}";
            string statusClass = bookedSeats.Contains(seatId) ? "occupied" : "available";
            string seatClass = isRecliner ? "seat recliner" : "seat";
            string seatContent = isRecliner ? "<img src='img/51.jpg' alt='Recliner seat'>" : seatNum.ToString();
            return $"<div class='{seatClass} {statusClass}' data-seat='{seatId}'>{seatContent}</div>";
        }

        public string GetSeatPricesJson()
        {
            // **CHANGE 5: Using the dynamic 'SeatCategories' property here as well.**
            // This is crucial for the JavaScript logic to get the correct prices.
            var priceDict = this.SeatCategories.SelectMany(c => c.RowLetters.Select(r => new { Row = r, c.Price }))
                                               .ToDictionary(x => x.Row, x => x.Price);
            return new JavaScriptSerializer().Serialize(priceDict);
        }

        public string GetSeatCategoriesJson()
        {
            // **CHANGE 6: Using the dynamic 'SeatCategories' property.**
            var catDict = this.SeatCategories.ToDictionary(c => c.CategoryKey, c => c.RowLetters);
            return new JavaScriptSerializer().Serialize(catDict);
        }
    }
}