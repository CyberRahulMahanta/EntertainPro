<%@ Page Title="" Language="C#" MasterPageFile="~/AdminSite.Master" AutoEventWireup="true" CodeBehind="AdminShowingMovies.aspx.cs" Inherits="EntertainPro.AdminShowingMovies" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <main class="flex-1 p-6 md:p-8">
        <div class="mb-8 flex flex-col md:flex-row md:items-center md:justify-between">
            <div>
                <h1 class="text-3xl md:text-4xl font-extrabold text-gray-900 mb-4 flex items-center gap-3">
                    <svg class="w-12 h-12 text-red-500 animate-bounce" viewBox="0 0 24 24" fill="none"
                        xmlns="http://www.w3.org/2000/svg">
                        <path d="M7 21L12 17L17 21M7.8 17H16.2C17.8802 17 18.7202 17 19.362 16.673C19.9265 16.3854 20.3854 15.9265 20.673 15.362C21 14.7202 21 13.8802 21 12.2V7.8C21 6.11984 21 5.27976 20.673 4.63803C20.3854 4.07354 19.9265 3.6146 19.362 3.32698C18.7202 3 17.8802 3 16.2 3H7.8C6.11984 3 5.27976 3 4.63803 3.32698C4.07354 3.6146 3.6146 4.07354 3.32698 4.63803C3 5.27976 3 6.11984 3 7.8V12.2C3 13.8802 3 14.7202 3.32698 15.362C3.6146 15.9265 4.07354 16.3854 4.63803 16.673C5.27976 17 6.11984 17 7.8 17Z"
                            stroke="#ef4444" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" />
                    </svg>

                    <span class="bg-gradient-to-r from-red-500 via-pink-500 to-purple-500 bg-clip-text text-transparent">Showing Movies
                    </span>
                </h1>

                <p class="text-gray-500 text-sm md:text-base">
                    View, edit, and organize movies available in your theaters.
                </p>
            </div>

            <!-- ✅ Add Show Button -->
            <div class="mt-4 md:mt-0">
                <button type="button" id="openAddShowModal"
                    class="inline-flex items-center gap-2 bg-red-500 hover:bg-red-600 text-white px-5 py-2.5 rounded-lg text-sm font-semibold shadow transition">
                    <svg xmlns="http://www.w3.org/2000/svg" class="w-5 h-5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 4v16m8-8H4" />
                    </svg>
                    Add Show
                </button>
            </div>
        </div>

        <div class="bg-white rounded-xl shadow-lg border border-slate-100 overflow-hidden">
            <div class="p-6 border-b border-slate-100">
                <div class="flex flex-col sm:flex-row sm:items-center justify-between gap-4">

                    <div class="relative w-full sm:w-auto order-1">
                        <svg class="absolute left-3 top-1/2 -translate-y-1/2 w-5 h-5 text-slate-400"
                            xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24"
                            stroke="currentColor" stroke-width="2" stroke-linecap="round"
                            stroke-linejoin="round" aria-hidden="true">
                            <circle cx="11" cy="11" r="8" />
                            <line x1="21" y1="21" x2="16.65" y2="16.65" />
                        </svg>
                        <input type="text" id="filter-search-input" placeholder="Search Movies..."
                            aria-label="Search bookings"
                            class="w-full sm:w-64 bg-slate-100 rounded-lg py-2 pl-10 pr-4 text-sm focus:outline-none focus:ring-2 focus:ring-red-500 focus-ring-custom-accent transition-all">
                    </div>

                    <div class="flex flex-wrap items-center gap-3 order-2 sm:ml-auto">

                        <div class="flex items-center space-x-2">
                            <div class="relative">
                                <svg class="absolute left-2 top-1/2 -translate-y-1/2 w-5 h-5 text-slate-400 pointer-events-none"
                                    xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2"
                                    stroke-linecap="round" stroke-linejoin="round">
                                    <rect x="3" y="4" width="18" height="18" rx="2" ry="2" />
                                    <line x1="16" y1="2" x2="16" y2="6" />
                                    <line x1="8" y1="2" x2="8" y2="6" />
                                    <line x1="3" y1="10" x2="21" y2="10" />
                                </svg>
                                <input type="text"
                                    placeholder="Start Date"
                                    onfocus="this.type='date'" onblur="if(!this.value)this.type='text'"
                                    class="pl-8 pr-2 py-1 rounded-lg border border-slate-200 focus:border-red-500 focus:ring-1 focus:ring-red-500 text-sm w-30 appearance-none">
                            </div>

                            <span class="text-slate-400 font-semibold text-sm">to</span>

                            <div class="relative">
                                <svg class="absolute left-2 top-1/2 -translate-y-1/2 w-5 h-5 text-slate-400 pointer-events-none"
                                    xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2"
                                    stroke-linecap="round" stroke-linejoin="round">
                                    <rect x="3" y="4" width="18" height="18" rx="2" ry="2" />
                                    <line x1="16" y1="2" x2="16" y2="6" />
                                    <line x1="8" y1="2" x2="8" y2="6" />
                                    <line x1="3" y1="10" x2="21" y2="10" />
                                </svg>
                                <input type="text"
                                    placeholder="End Date"
                                    onfocus="this.type='date'" onblur="if(!this.value)this.type='text'"
                                    class="pl-8 pr-2 py-1 rounded-lg border border-slate-200 focus:border-red-500 focus:ring-1 focus:ring-red-500 text-sm w-30 appearance-none">
                            </div>
                        </div>

                        <select id="time-filter-select" title="Filter by show time"
                            class="bg-blue-50 border border-blue-300 rounded-lg px-4 py-2 text-sm font-medium text-blue-700 hover:bg-blue-100 focus:ring-2 focus:ring-blue-500 focus:outline-none transition-shadow duration-150">
                            <option value="all" class="bg-white text-slate-700">All Showing Movies</option>
                            <option value="Today" class="bg-white text-slate-700">Today</option>
                            <option value="Tomorrow" class="bg-white text-slate-700">Tomorrow</option>
                            <option value="Day After Tomorrow" class="bg-white text-slate-700">Day After Tomorrow</option>
                        </select>

                    </div>
                </div>
            </div>
            <div class="overflow-x-auto">
                <div id="movieLoader" class="hidden flex flex-col items-center justify-center py-10">
                    <div class="w-10 h-10 border-4 border-red-300 border-t-red-600 rounded-full animate-spin"></div>
                    <p class="mt-3 text-sm text-slate-600 font-medium">Searching movies...</p>
                </div>

                <div id="noMovieDiv" class="hidden">
                    <div class="flex flex-col items-center justify-center py-12 bg-red-50 rounded-lg mt-6">
                        <svg class="w-12 h-12 text-red-400 mb-3" fill="none" stroke="currentColor" stroke-width="1.5" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round"
                                d="M12 9v3.75m0 3.75h.007v.008H12v-.008zm9-3.75A9 9 0 1 1 3 12a9 9 0 0 1 18 0z" />
                        </svg>
                        <h3 class="text-lg font-semibold text-red-700">No movies found</h3>
                        <p class="text-sm text-slate-600 mt-1">Try a different title or filteration.</p>
                    </div>
                </div>

                <table id="movieTable" class="w-full">
                    <thead class="bg-slate-50/70 border-b border-slate-100">
                        <tr>
                            <th class="text-left py-4 px-5 font-semibold text-slate-700 text-sm tracking-wider">Movie</th>
                            <th class="text-left py-4 px-5 font-semibold text-slate-700 text-sm tracking-wider">Show Date</th>
                            <th class="text-center py-4 px-5 font-semibold text-slate-700 text-sm tracking-wider">Total Bookings</th>
                            <th class="text-center py-4 px-5 font-semibold text-slate-700 text-sm tracking-wider">Action</th>
                        </tr>
                    </thead>
                    <tbody class="divide-y divide-slate-100 text-slate-600">
                        <asp:Repeater ID="rptShowings" runat="server">
                            <ItemTemplate>
                                <tr class="movie-row border-b hover:bg-gray-50 transition">
                                    <td class="py-3 px-4 flex items-center gap-3 font-medium">
                                        <img src='<%# Eval("ImageUrl") %>' alt="Poster" class="w-10 h-14 rounded-md object-cover shadow-sm border" />
                                        <span><%# Eval("MovieTitle") %></span>
                                    </td>
                                    <td class="py-3 px-4"><%# Eval("ShowDate", "{0:dd-MMM-yyyy}") %></td>
                                    <td class="py-3 px-4 text-center align-middle"><%# Eval("TotalBookings") %></td>
                                    <td class="py-3 px-4 text-center align-middle">
                                        <a href='<%# "AdminShowingMoviesDetails.aspx?MovieID=" + Eval("MovieID") %>'
                                            class="bg-blue-500 hover:bg-blue-600 text-white px-3 py-1 rounded-md text-xs shadow">View Details
                                        </a>
                                    </td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                    </tbody>
                </table>
            </div>
        </div>

        <!-- Add Show Modal -->
        <div id="addShowModal" class="fixed inset-0 bg-black bg-opacity-50 hidden items-center justify-center z-50">
            <div class="bg-white rounded-2xl shadow-2xl p-6 w-full max-w-lg relative">
                <h2 class="text-2xl font-bold text-gray-800 mb-5 text-center">Add New Show</h2>

                <asp:Panel ID="pnlAddShow" runat="server">
                    <div class="space-y-5">

                        <!-- 🎬 Select Movie -->
                        <div>
                            <label class="block text-left font-medium text-gray-700 mb-1">Select Movie</label>
                            <asp:DropDownList ID="ddlMovies" runat="server" CssClass="border w-full px-3 py-2 rounded-lg focus:ring-2 focus:ring-red-400 focus:outline-none" OnSelectedIndexChanged="ddlMovies_SelectedIndexChanged">
                            </asp:DropDownList>
                        </div>

                        <!-- 🖥️ Select Screen -->
                        <div>
                            <label class="block text-left font-medium text-gray-700 mb-1">Select Screen</label>
                            <asp:DropDownList ID="ddlScreens" runat="server"
                                CssClass="border w-full px-3 py-2 rounded-lg focus:ring-2 focus:ring-red-400 focus:outline-none" OnSelectedIndexChanged="ddlScreens_SelectedIndexChanged">
                            </asp:DropDownList>
                        </div>

                        <!-- 📅 Select Date -->
                        <div>
                            <label class="block text-left font-medium text-gray-700 mb-1">Show Date</label>
                            <asp:TextBox ID="txtShowDate" runat="server" TextMode="Date"
                                CssClass="border w-full px-3 py-2 rounded-lg focus:ring-2 focus:ring-red-400 focus:outline-none"></asp:TextBox>
                        </div>

                        <div class="text-center">
                            <asp:Label ID="lblMessage" runat="server" CssClass="text-sm font-medium"></asp:Label>
                        </div>

                        <!-- Buttons -->
                        <div class="flex justify-center gap-4 mt-6">
                            <asp:Button ID="btnAddShow" runat="server" Text="Add Show"
                                CssClass="bg-red-600 hover:bg-red-700 text-white px-6 py-2 rounded-lg" OnClick="btnAddShow_Click"/>
                            <button type="button" id="closeAddShowModal"
                                class="bg-gray-300 hover:bg-gray-400 text-gray-800 px-6 py-2 rounded-lg">
                                Cancel</button>
                        </div>

                    </div>
                </asp:Panel>
            </div>
        </div>


        <script>
            document.addEventListener("DOMContentLoaded", () => {
                const searchInput = document.getElementById("filter-search-input");
                const timeFilter = document.getElementById("time-filter-select");
                const rows = document.querySelectorAll(".movie-row");
                const loader = document.getElementById("movieLoader");
                const noMovies = document.getElementById("noMovieDiv");
                const table = document.getElementById("movieTable");
                const today = new Date();

                function normalizeDate(dateStr) {
                    const parsed = new Date(dateStr);
                    if (!isNaN(parsed)) return parsed;
                    const [day, mon, year] = dateStr.split("-");
                    return new Date(`${mon} ${day}, ${year}`);
                }

                function filterMovies() {
                    loader.classList.remove("hidden");
                    noMovies.classList.add("hidden");
                    table.classList.add("opacity-50"); // fade effect

                    setTimeout(() => {
                        loader.classList.add("hidden");
                        table.classList.remove("opacity-50");

                        const searchText = searchInput.value.toLowerCase().trim();
                        const filterOption = timeFilter.value;
                        let visibleCount = 0;

                        rows.forEach(row => {
                            const movieName = row.querySelector("td:nth-child(1)")?.innerText.toLowerCase() || "";
                            const dateText = row.querySelector("td:nth-child(2)")?.innerText.trim() || "";
                            const showDate = normalizeDate(dateText);
                            let matchSearch = movieName.includes(searchText);

                            let matchDate = true;
                            if (filterOption === "Today") {
                                matchDate = showDate.toDateString() === today.toDateString();
                            } else if (filterOption === "Tomorrow") {
                                const tomorrow = new Date(today);
                                tomorrow.setDate(today.getDate() + 1);
                                matchDate = showDate.toDateString() === tomorrow.toDateString();
                            } else if (filterOption === "Day After Tomorrow") {
                                const dayAfter = new Date(today);
                                dayAfter.setDate(today.getDate() + 2);
                                matchDate = showDate.toDateString() === dayAfter.toDateString();
                            }

                            if (matchSearch && matchDate) {
                                row.style.display = "";
                                visibleCount++;
                            } else {
                                row.style.display = "none";
                            }
                        });

                        // show "no movies" message if nothing visible
                        if (visibleCount === 0) {
                            noMovies.classList.remove("hidden");
                            table.classList.add("hidden");
                        } else {
                            noMovies.classList.add("hidden");
                            table.classList.remove("hidden");
                        }

                    }, 500);
                }

                searchInput.addEventListener("input", filterMovies);
                timeFilter.addEventListener("change", filterMovies);
            });
            // 🔹 Open Add Show Modal
            document.getElementById('openAddShowModal').addEventListener('click', function () {
                const modal = document.getElementById('addShowModal');
                modal.classList.remove('hidden');
                modal.classList.add('flex');
            });

            // 🔹 Close Add Show Modal
            document.getElementById('closeAddShowModal').addEventListener('click', function () {
                const modal = document.getElementById('addShowModal');
                modal.classList.remove('flex');
                modal.classList.add('hidden');
            });
        </script>
    </main>
</asp:Content>
