<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="BookingMovieDetails.aspx.cs" Inherits="EntertainPro.BookingMovieDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" type="text/css" href="css/BookingMovieDetails.css" />
    <link rel="stylesheet" type="text/css" href="css/BookingMovieDates.css" />
    <link rel="stylesheet" type="text/css" href="css/BookingMovieFilter.css" />
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">

    <!-- Movie Details -->
    <div class="movie-details">
        <div class="movie-poster">
            <asp:Image ID="imgPoster" runat="server" CssClass="poster" />
            <a id="trailerLink" runat="server" class="play-button" title="Play Trailer">
                <span class="fa fa-play-circle"></span>
            </a>
        </div>
        <div class="movie-info">
            <h3>
                <asp:Label ID="lblTitle" runat="server" /></h3>
            <div class="movie-meta">
                <span>
                    <asp:Label ID="lblRating" runat="server" /></span>
                <span>
                    <asp:Label ID="lblDuration" runat="server" /></span>
                <span>
                    <asp:Label ID="lblReleaseDate" runat="server" /></span>
                <span>
                    <asp:Label ID="lblGenre" runat="server" /></span>
                <span>
                    <asp:Label ID="lblLanguage" runat="server" /></span>
            </div>
            <a href="#" class="view-details">View Details</a>
        </div>
    </div>

    <!-- Show Dates -->
    <div class="date-container">
        <% 
            string selectedDate = Request.QueryString["date"];
            foreach (var d in showDatesList)
            {
                // Add "selected" if this date matches the query string
                string isSelected = (selectedDate != null && selectedDate == d.ToString("yyyy-MM-dd")) ? "selected" : "";
        %>
        <div class='date-item <%= d.Date == DateTime.Today ? "today" : "" %> <%= isSelected %>'>
            <a href='?Id=<%= Request.QueryString["Id"] %>&date=<%= d.ToString("yyyy-MM-dd") %>'>
                <div class='small-bold'><%= d.ToString("MMM") %></div>
                <div class='large-bold'><%= d.ToString("dd") %></div>
                <div class='label'>
                    <%= d.Date == DateTime.Today ? "Today" :
                        (d.Date == DateTime.Today.AddDays(1) ? "Tomorrow" : d.ToString("dddd")) %>
                </div>
            </a>
        </div>
        <% } %>
    </div>


    <script>
        // Get all date items
        const dateItems = document.querySelectorAll('.date-item');

        dateItems.forEach(item => {
            item.addEventListener('click', function () {
                // Remove 'selected' from all items
                dateItems.forEach(i => i.classList.remove('selected'));

                // Add 'selected' to the clicked item
                this.classList.add('selected');
            });
        });
    </script>

    <div class="filter-box">
        <div class="top-bar">
            <input type="text" class="search-input" placeholder="Search for screens by types..!" />
            <div class="status">
                <span><span class="dot green"></span>Available</span>
                <span><span class="dot yellow"></span>Filling Fast</span>
                <span><span class="dot red"></span>Sold Out</span>
                <span><span class="dot gray"></span>Lapsed</span>
            </div>
        </div>

        <hr />

        <div class="filters">
            <select>
                <option>Languages</option>
            </select>
            <select>
                <option>Formats</option>
            </select>
            <select>
                <option>Experiences</option>
            </select>
            <select>
                <option>Accessibility</option>
            </select>
            <select>
                <option>Select Special Tags</option>
            </select>

            <button class="reset-btn">Reset</button>
        </div>
    </div>

    <asp:PlaceHolder ID="phNoShowtime" runat="server" Visible="false">
        <section class="showtime-picker bg-gray-50 flex items-center justify-center py-8 px-4">
            <div
                class="max-w-3xl w-full bg-white rounded-lg shadow-lg p-6 flex flex-col items-center space-y-4 border border-gray-200">

                <!-- Icon -->
                <div class="w-12 h-12 flex items-center justify-center rounded-full bg-gray-100">
                    <svg xmlns="http://www.w3.org/2000/svg" class="w-6 h-6" fill="none" stroke="currentColor"
                        stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                        viewBox="0 0 24 24">
                        <circle cx="12" cy="12" r="10" />
                        <polyline points="12 6 12 12 16 14" />
                        <circle cx="19.5" cy="4.5" r="2.5" stroke-width="1.5" />
                        <line x1="19.5" y1="7" x2="19.5" y2="9" stroke-width="1.5" stroke-linecap="round" />
                    </svg>
                </div>

                <h2 class="text-center text-gray-900 text-lg font-semibold">Unable to spot the right showtime?
                </h2>

                <p class="text-center text-gray-700 text-base max-w-sm">
                    Let us know your preferred Movie
                </p>

                <button
                    class="mt-2 px-6 py-2 border border-gray-800 rounded-full font-bold text-gray-900 hover:bg-gray-100 focus:outline-none focus:ring-2 focus:ring-gray-500 transition">
                    Enjoy another Movie
                </button>
            </div>
        </section>
    </asp:PlaceHolder>


    <!-- Screens + Time Slots -->
    <div class="screens-wrapper">
        <% foreach (var screen in screensList)
            { %>
        <div class="container">

            <!-- Header with screen name, price, and icons -->
            <div class="header">
                <span>
                    <i class="fa fa-video-camera"></i>Entertain Pro - <%= screen.ScreenName %>
                </span>
                <div class="icons">
                    <i class="fa fa-heart favorite" title="Add to Favorite"></i>
                    <i class="fa fa-minus minimize" title="Minimize"></i>
                </div>
            </div>

            <!-- Screen details -->
            <div class="details">
                Screen Type: <%= screen.ScreenType %>
            </div>

            <!-- Time Slots -->
            <div class="content-area">
                <% foreach (var slot in screen.TimeSlots)
                    {
                        string cssClass = slot.Status.ToLower() == "active" ? "active" : "inactive";
                        string showDateStr = Request.QueryString["date"] ?? DateTime.Today.ToString("yyyy-MM-dd");
                        string showTimeStr = slot.ShowTime.ToString(@"hh\:mm"); // format as HH:mm
                %>

                <% if (cssClass == "active")
                    { %>
                <a class="time-slot <%= cssClass %>"
                    href='SeatLayout.aspx?movieId=<%= Request.QueryString["Id"] %>&screenId=<%= screen.ScreenID %>&showDate=<%= showDateStr %>&showTime=<%= showTimeStr %>&language=<%= slot.Language %>&showingId=<%= slot.ShowingID %>'>
                    <span class="language-label"><%= slot.Language %></span>
                    <div class="slot-time"><%= slot.ShowTimeFormatted %></div>
                </a>

                <% }
                else
                { %>
                <div class="time-slot <%= cssClass %>">
                    <span class="language-label"><%= slot.Language %></span>
                    <div class="slot-time"><%= slot.ShowTimeFormatted %></div>
                </div>
                <% } %>

                <% } %>
            </div>
            <!-- end content-area -->

        </div>
        <!-- end container -->
        <% } %>
    </div>
    <!-- end screens-wrapper -->



    <!-- JS for minimize -->
    <script>
        document.addEventListener("DOMContentLoaded", function () {
            document.querySelectorAll('.container').forEach(container => {
                const minimizeBtn = container.querySelector('.minimize');
                const contentArea = container.querySelector('.content-area');
                minimizeBtn.addEventListener('click', function () {
                    if (contentArea.classList.contains('collapsed')) {
                        contentArea.classList.remove('collapsed');
                        minimizeBtn.classList.remove('fa-plus');
                        minimizeBtn.classList.add('fa-minus');
                    } else {
                        contentArea.classList.add('collapsed');
                        minimizeBtn.classList.remove('fa-minus');
                        minimizeBtn.classList.add('fa-plus');
                    }
                });
            });
        });
    </script>

</asp:Content>

