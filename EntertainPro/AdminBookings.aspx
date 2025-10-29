<%@ Page Title="" Language="C#" MasterPageFile="~/AdminSite.Master" AutoEventWireup="true" CodeFile="AdminBookings.aspx.cs" Inherits="EntertainPro.AdminBookings" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(-20px);
            }

            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .animate-fadeIn {
            animation: fadeIn 0.3s ease-out;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <main class="flex-1 p-6 md:p-10">
        <div class="mb-8">
            <div class="mb-8">
                <h1 class="text-3xl md:text-4xl font-extrabold text-gray-900 mb-4 flex items-center gap-3">
                    <!-- Custom SVG Icon -->
                    <svg class="w-10 h-10 text-red-500 animate-bounce" xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 24 24">
                        <path d="m13.817 5.669 4.504 4.501-8.15 8.15-4.501-4.504zm-3.006 13.944 8.8-8.8c.166-.163.27-.389.27-.64s-.103-.477-.269-.64l-5.156-5.156c-.166-.158-.392-.255-.64-.255s-.474.097-.64.256l-8.8 8.8c-.166.163-.27.389-.27.64s.103.477.269.64l5.156 5.156c.166.158.392.255.64.255s.474-.097.64-.256zm12.663-9.073-12.918 12.933c-.332.326-.787.527-1.289.527s-.957-.201-1.289-.527l-1.794-1.793c.477-.492.77-1.164.77-1.905 0-1.513-1.227-2.74-2.74-2.74-.74 0-1.412.294-1.905.771l.001-.001-1.781-1.794c-.326-.332-.527-.787-.527-1.289s.201-.957.527-1.289l12.919-12.906c.332-.326.787-.527 1.289-.527s.957.201 1.289.527l1.781 1.781c-.515.499-.835 1.197-.835 1.969 0 1.513 1.227 2.74 2.74 2.74.773 0 1.471-.32 1.969-.835l.001-.001 1.794 1.781c.326.332.527.787.527 1.289s-.201.957-.527 1.289z"></path>
                    </svg>

                    <span class="bg-gradient-to-r from-red-500 via-pink-500 to-purple-500 bg-clip-text text-transparent">Bookings Overview
                    </span>
                </h1>

                <p class="text-gray-500 text-sm md:text-base">
                    View and manage all ticket bookings, including payment status and customer details.
                </p>
            </div>

        </div>

        <div class="bg-white rounded-xl shadow-lg border border-slate-100 overflow-hidden">

            <div class="p-6 border-b border-slate-100">
                <div class="flex flex-col sm:flex-row sm:items-center justify-between gap-4">

                    <!-- Search Bar -->
                    <div class="relative w-full sm:w-auto order-1">
                        <svg class="absolute left-3 top-1/2 -translate-y-1/2 w-5 h-5 text-slate-400"
                            xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24"
                            stroke="currentColor" stroke-width="2" stroke-linecap="round"
                            stroke-linejoin="round" aria-hidden="true">
                            <circle cx="11" cy="11" r="8" />
                            <line x1="21" y1="21" x2="16.65" y2="16.65" />
                        </svg>
                        <input type="text" id="filter-search-input" placeholder="Search Bookings..."
                            aria-label="Search bookings"
                            class="w-full sm:w-64 bg-slate-100 rounded-lg py-2 pl-10 pr-4 text-sm focus:outline-none focus:ring-2 focus:ring-red-500 focus-ring-custom-accent transition-all">
                    </div>

                    <!-- Filters Group -->
                    <div class="flex flex-wrap items-center gap-3 order-2 sm:ml-auto">

                        <!-- Date Range Filter (FIXED) -->
                        <div class="flex items-center space-x-2">
                            <!-- Start Date -->
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

                            <!-- End Date -->
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


                        <!-- Show Time Filter -->
                        <select id="time-filter-select" title="Filter by show time"
                            class="bg-blue-50 border border-blue-300 rounded-lg px-4 py-2 text-sm font-medium text-blue-700 hover:bg-blue-100 focus:ring-2 focus:ring-blue-500 focus:outline-none transition-shadow duration-150">
                            <option value="all" class="bg-white text-slate-700">All Show Times</option>
                            <option value="morning" class="bg-white text-slate-700">Morning (8 AM – 12 PM)</option>
                            <option value="afternoon" class="bg-white text-slate-700">Afternoon (12 PM – 5 PM)</option>
                            <option value="evening" class="bg-white text-slate-700">Evening (5 PM – 9 PM)</option>
                            <option value="night" class="bg-white text-slate-700">Night (9 PM – 12 AM)</option>
                        </select>

                    </div>
                </div>
            </div>

            <div class="overflow-x-auto">
                <table class="w-full">
                    <thead class="bg-slate-50/70 border-b border-slate-100">
                        <tr>
                            <th class="text-left py-4 px-5 font-semibold text-slate-700 text-sm tracking-wider">Booking ID</th>
                            <th class="text-left py-4 px-5 font-semibold text-slate-700 text-sm tracking-wider">Customer</th>
                            <th class="text-left py-4 px-5 font-semibold text-slate-700 text-sm tracking-wider">Movie</th>
                            <th class="text-left py-4 px-5 font-semibold text-slate-700 text-sm tracking-wider">Show Time</th>
                            <th class="text-left py-4 px-5 font-semibold text-slate-700 text-sm tracking-wider">Seats</th>
                            <th class="text-left py-4 px-5 font-semibold text-slate-700 text-sm tracking-wider">Amount</th>
                            <th class="text-left py-4 px-5 font-semibold text-slate-700 text-sm tracking-wider">Booking Date</th>
                            <th class="text-left py-4 px-5 font-semibold text-slate-700 text-sm tracking-wider">Status</th>
                            <th class="text-left py-4 px-5 font-semibold text-slate-700 text-sm tracking-wider">Action</th>
                        </tr>
                    </thead>
                    <tbody class="divide-y divide-slate-100 text-slate-600">
                        <asp:Repeater ID="rptBookings" runat="server" OnItemCommand="rptBookings_ItemCommand">
                            <ItemTemplate>
                                <tr class="hover:bg-slate-50/50 transition-colors duration-150" data-status='<%# Eval("PaymentStatus") %>'>
                                    <td class="py-4 px-5 font-semibold text-slate-800">#BK<%# Eval("BookingID") %></td>
                                    <td class="py-4 px-5"><%# Eval("CustomerName") %></td>
                                    <td class="py-4 px-5"><%# Eval("Title") %></td>
                                    <td class="py-4 px-5"><%# DateTime.Today.Add((TimeSpan)Eval("ShowTime")).ToString("hh:mm tt") %></td>
                                    <td class="py-4 px-5"><%# Eval("SeatNumber") %></td>
                                    <td class="py-4 px-5 font-semibold text-green-700">Rs <%# Eval("TicketPrice") %></td>
                                    <td class="py-4 px-5"><%# Convert.ToDateTime(Eval("BookingDate")).ToString("dd MMM yyyy") %></td>
                                    <td class="py-4 px-5"><%# GetStatusBadge(Eval("PaymentStatus").ToString()) %></td>

                                    <!-- ✅ Action Buttons -->
                                    <td class="py-4 px-6 space-x-2">
                                        <asp:LinkButton
                                            ID="btnView"
                                            runat="server"
                                            CommandName="ViewDetails"
                                            CommandArgument='<%# Eval("BookingID") %>'
                                            CssClass="inline-flex items-center px-3 py-1 text-xs font-medium rounded-lg bg-blue-100 text-blue-700 hover:bg-blue-200 transition">
                                            <i class="fa fa-eye mr-1"></i> View
                                        </asp:LinkButton>

                                        <button
                                            type="button"
                                            onclick='openDeleteModal(<%# Eval("BookingID") %>)'
                                            class="inline-flex items-center px-3 py-1 text-xs font-medium rounded-lg bg-red-100 text-red-700 hover:bg-red-200 transition">
                                            <i class="fa fa-trash mr-1"></i>Delete
                                        </button>
                                    </td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                    </tbody>
                </table>
            </div>

        </div>

        <!-- View Details Modal -->
        <div id="viewModal"
            class="fixed inset-0 flex items-center justify-center bg-black/50 hidden z-50 backdrop-blur-sm">

            <div class="bg-white rounded-2xl shadow-2xl w-[850px] max-w-[95%] p-8 relative animate-fadeIn">

                <!-- Header -->
                <div class="flex justify-between items-center mb-6 border-b pb-3">
                    <h2 class="text-2xl font-bold text-gray-800 flex items-center gap-2">
                        <i class="fa fa-ticket-alt text-blue-600"></i>
                        Booking Details
                    </h2>
                    <button type="button" onclick="closeModal('viewModal')"
                        class="text-gray-500 hover:text-red-500 text-2xl font-bold">
                        &times;</button>
                </div>

                <!-- Content -->
                <div class="grid grid-cols-[2fr_1fr] gap-8">
                    <!-- Left Info -->
                    <div class="grid grid-cols-2 gap-x-6 gap-y-3 text-gray-700 text-[15px] leading-relaxed">
                        <p><strong>Booking ID:</strong></p>
                        <p>
                            <asp:Label ID="lblBookingID" runat="server" />
                        </p>
                        <p><strong>Customer Name:</strong></p>
                        <p>
                            <asp:Label ID="lblCustomerName" runat="server" />
                        </p>
                        <p><strong>Movie Name:</strong></p>
                        <p>
                            <asp:Label ID="lblMovieName" runat="server" />
                        </p>
                        <p><strong>Language:</strong></p>
                        <p>
                            <asp:Label ID="lblLanguage" runat="server" />
                        </p>
                        <p><strong>Seat Number:</strong></p>
                        <p>
                            <asp:Label ID="lblSeatNumber" runat="server" />
                        </p>
                        <p><strong>Price:</strong></p>
                        <p>₹<asp:Label ID="lblPrice" runat="server" /></p>
                        <p><strong>Booking Date:</strong></p>
                        <p>
                            <asp:Label ID="lblBookingDate" runat="server" />
                        </p>
                        <p><strong>Payment ID:</strong></p>
                        <p>
                            <asp:Label ID="lblPaymentID" runat="server" />
                        </p>
                        <p><strong>Screen Name:</strong></p>
                        <p>
                            <asp:Label ID="lblScreenName" runat="server" />
                        </p>
                        <p><strong>Screen Type:</strong></p>
                        <p>
                            <asp:Label ID="lblScreenType" runat="server" />
                        </p>
                        <p><strong>Show Date:</strong></p>
                        <p>
                            <asp:Label ID="lblShowDate" runat="server" />
                        </p>
                        <p><strong>Show Time:</strong></p>
                        <p>
                            <asp:Label ID="lblShowTime" runat="server" />
                        </p>
                    </div>

                    <!-- Right QR Section -->
                    <div class="flex flex-col items-center justify-center border border-gray-200 rounded-xl bg-gray-50 p-4 shadow-inner">
                        <h3 class="font-semibold text-gray-700 mb-2">QR Code</h3>
                        <asp:Image ID="imgQrCode" runat="server" CssClass="w-40 h-40 object-contain" />
                    </div>
                </div>

                <!-- Footer -->
                <div class="mt-8 flex justify-end space-x-3">
                    <button type="button"
                        onclick="downloadBookingDetails()"
                        class="bg-red-600 text-white px-6 py-2 rounded-lg font-medium hover:bg-red-700 transition duration-200 shadow-sm flex items-center gap-2">
                        <i class="fa fa-download"></i>Download All Booking Details
                    </button>

                    <button type="button"
                        onclick="closeModal('viewModal')"
                        class="bg-blue-600 text-white px-6 py-2 rounded-lg font-medium hover:bg-blue-700 transition duration-200 shadow-sm">
                        Close
                    </button>
                </div>

            </div>
        </div>




        <!-- Delete Confirmation Modal -->
        <div id="deleteModal" class="fixed inset-0 bg-black/50 hidden items-center justify-center z-50">
            <div class="bg-white p-6 rounded-2xl w-[350px] shadow-lg text-center">
                <h3 class="text-lg font-semibold text-gray-800 mb-3">Delete Booking</h3>
                <p class="text-gray-600 mb-5">Are you sure you want to delete this booking?</p>

                <asp:HiddenField ID="hfDeleteBookingID" runat="server" />

                <div class="flex justify-center space-x-3">
                    <button type="button" onclick="closeModal('deleteModal')" class="px-4 py-2 bg-gray-200 rounded-lg hover:bg-gray-300">Cancel</button>
                    <asp:Button
                        ID="btnConfirmDelete"
                        runat="server"
                        Text="Delete"
                        CssClass="px-4 py-2 bg-red-600 text-white rounded-lg hover:bg-red-700"
                        OnClick="btnConfirmDelete_Click" />
                </div>
            </div>
        </div>

    </main>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

    <script>
        function openModal(id) {
            const modal = document.getElementById(id);
            modal.classList.remove("hidden");
            setTimeout(() => {
                const inner = modal.querySelector("div");
                inner.classList.remove("scale-95", "opacity-0");
                inner.classList.add("scale-100", "opacity-100");
            }, 10);
        }

        function closeModal(id) {
            const modal = document.getElementById(id);
            const inner = modal.querySelector("div");
            inner.classList.add("scale-95", "opacity-0");
            setTimeout(() => {
                modal.classList.add("hidden");
            }, 200);
        }


        function openDeleteModal(bookingID) {
            document.getElementById('<%= hfDeleteBookingID.ClientID %>').value = bookingID;
            const modal = document.getElementById('deleteModal');
            modal.classList.remove('hidden');
            modal.classList.add('flex');
        }

        document.addEventListener("DOMContentLoaded", function () {
            const searchInput = document.getElementById("filter-search-input");
            const timeFilter = document.getElementById("time-filter-select");
            const startDateInput = document.querySelector('input[placeholder="Start Date"]');
            const endDateInput = document.querySelector('input[placeholder="End Date"]');
            const tableRows = document.querySelectorAll("tbody tr[data-status]"); // ✅ fixed selector

            function normalize(str) {
                return str ? str.toString().toLowerCase().trim() : "";
            }

            function isTimeInRange(showTime, range) {
                const match = showTime.match(/(\d+):(\d+) (\w+)/);
                if (!match) return true;
                const [_, hours, minutes, ampm] = match;
                let time24 = parseInt(hours);
                if (ampm.toLowerCase() === "pm" && time24 !== 12) time24 += 12;
                if (ampm.toLowerCase() === "am" && time24 === 12) time24 = 0;

                switch (range) {
                    case "morning": return time24 >= 8 && time24 < 12;
                    case "afternoon": return time24 >= 12 && time24 < 17;
                    case "evening": return time24 >= 17 && time24 < 21;
                    case "night": return time24 >= 21 && time24 <= 23;
                    default: return true;
                }
            }

            function isDateInRange(dateStr, start, end) {
                if (!start && !end) return true;
                const date = new Date(dateStr);
                if (isNaN(date)) return true;
                if (start && date < new Date(start)) return false;
                if (end && date > new Date(end)) return false;
                return true;
            }

            function applyFilters() {
                const searchValue = normalize(searchInput.value);
                const timeValue = timeFilter.value;
                const startDate = startDateInput.value;
                const endDate = endDateInput.value;

                tableRows.forEach(row => {
                    const cells = row.querySelectorAll("td");
                    if (cells.length === 0) return;

                    const bookingId = normalize(cells[0].innerText);
                    const customer = normalize(cells[1].innerText);
                    const movie = normalize(cells[2].innerText);
                    const showTime = cells[3].innerText.trim();
                    const bookingDate = cells[6].innerText.trim();

                    const matchesSearch = [bookingId, customer, movie].some(text => text.includes(searchValue));
                    const matchesTime = isTimeInRange(showTime, timeValue);
                    const matchesDate = isDateInRange(bookingDate, startDate, endDate);

                    if (matchesSearch && matchesTime && matchesDate) {
                        row.classList.remove("hidden");
                    } else {
                        row.classList.add("hidden");
                    }
                });
            }

            searchInput.addEventListener("input", applyFilters);
            timeFilter.addEventListener("change", applyFilters);
            startDateInput.addEventListener("change", applyFilters);
            endDateInput.addEventListener("change", applyFilters);
        });
    </script>
</asp:Content>
