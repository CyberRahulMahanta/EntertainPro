<%@ Page Title="" Language="C#" MasterPageFile="~/AdminSite.Master" AutoEventWireup="true" CodeFile="AdminDashboard.aspx.cs" Inherits="EntertainPro.AdminDashboard" %>

<%@ Import Namespace="System.Data" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <title>Users - EntertainPro Admin Dashboard</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <main class="flex-1 p-6 md:p-8">
        <div class="mb-8">
            <div class="mb-8">
                <h1 class="text-3xl md:text-4xl font-extrabold text-gray-900 mb-4 flex items-center gap-3">
                    <!-- Modern Dashboard/Analytics SVG -->
                    <svg class="w-10 h-10 text-red-500 animate-bounce" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg" fill="currentColor">
                        <path d="M6.95 8.653A7.338 7.338 0 0 0 5.147 13H7v1H5.149a7.324 7.324 0 0 0 1.81 4.346l1.29-1.29.707.708C7.22 19.5 7.633 19.079 6.963 19.777a8.373 8.373 0 1 1 11.398-12.26l-.71.71A7.353 7.353 0 0 0 13 6.147V8h-1V6.146a7.338 7.338 0 0 0-4.342 1.8L8.973 9.26l-.707.707zm13.16 1.358l-.76.76a7.303 7.303 0 0 1-1.301 7.565L16.75 17.04l-.707.707 1.993 2.031a8.339 8.339 0 0 0 2.073-9.766zM3 13.5a9.492 9.492 0 0 1 16.15-6.772l.711-.71a10.493 10.493 0 1 0-14.364 15.29l.694-.725A9.469 9.469 0 0 1 3 13.5zm17.947-4.326a9.442 9.442 0 0 1-2.138 11.41l.694.724a10.473 10.473 0 0 0 2.19-12.88zm1.578-4.406l.707.707-8.648 8.649a2.507 2.507 0 1 1-.707-.707zM14 15.5a1.5 1.5 0 1 0-1.5 1.5 1.502 1.502 0 0 0 1.5-1.5z"></path>
                    </svg>

                    <!-- Gradient text -->
                    <span class="bg-gradient-to-r from-red-500 via-pink-500 to-purple-500 bg-clip-text text-transparent">Dashboard
                    </span>
                </h1>

                <p class="text-gray-500 text-sm md:text-base">
                    Welcome back! Here's what's happening with your movie theater.
                </p>
            </div>
        </div>

        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6 mb-8">

            <!-- Total Revenue -->
            <div class="bg-white rounded-xl p-6 shadow-sm border border-slate-200">
                <div class="flex items-center justify-between">
                    <div>
                        <p class="text-sm font-medium text-slate-600">Total Revenue</p>
                        <p class="text-2xl font-bold text-slate-900">
                            <asp:Label ID="lblTotalRevenue" runat="server" Text="Rs.0"></asp:Label>
                        </p>
                    </div>
                    <div class="w-12 h-12 bg-green-100 rounded-lg flex items-center justify-center">
                        <svg class="w-6 h-6 text-green-600" xmlns="http://www.w3.org/2000/svg" fill="none"
                            viewBox="0 0 24 24" stroke="currentColor" stroke-width="2" stroke-linecap="round"
                            stroke-linejoin="round" aria-hidden="true">
                            <line x1="12" y1="1" x2="12" y2="23" />
                            <path d="M17 5H9.5a3.5 3.5 0 0 0 0 7h5a3.5 3.5 0 0 1 0 7H6" />
                        </svg>
                    </div>
                </div>
                <p class="text-xs text-green-600 mt-2">+<asp:Label ID="lblRevenueChange" runat="server" Text="0"></asp:Label>% from last month</p>
            </div>

            <!-- Tickets Sold -->
            <div class="bg-white rounded-xl p-6 shadow-sm border border-slate-200">
                <div class="flex items-center justify-between">
                    <div>
                        <p class="text-sm font-medium text-slate-600">Tickets Sold</p>
                        <p class="text-2xl font-bold text-slate-900">
                            <asp:Label ID="lblTicketsSold" runat="server" Text="0"></asp:Label>
                        </p>
                    </div>
                    <div class="w-12 h-12 bg-blue-100 rounded-lg flex items-center justify-center">
                        <svg class="w-6 h-6 text-blue-600" xmlns="http://www.w3.org/2000/svg" fill="none"
                            viewBox="0 0 24 24" stroke="currentColor" stroke-width="2" stroke-linecap="round"
                            stroke-linejoin="round" aria-hidden="true">
                            <path d="M20 12V8a2 2 0 0 0-2-2H6a2 2 0 0 0-2 2v4" />
                            <path d="M4 12v6a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2v-6" />
                            <path d="M12 12h.01" />
                        </svg>
                    </div>
                </div>
                <p class="text-xs text-blue-600 mt-2">+<asp:Label ID="lblTicketsChange" runat="server" Text="0"></asp:Label>% from last week</p>
            </div>

            <!-- Active Users -->
            <div class="bg-white rounded-xl p-6 shadow-sm border border-slate-200">
                <div class="flex items-center justify-between">
                    <div>
                        <p class="text-sm font-medium text-slate-600">Active Users</p>
                        <p class="text-2xl font-bold text-slate-900">
                            <asp:Label ID="lblActiveUsers" runat="server" Text="0"></asp:Label>
                        </p>
                    </div>
                    <div class="w-12 h-12 bg-purple-100 rounded-lg flex items-center justify-center">
                        <svg class="w-6 h-6 text-purple-600" xmlns="http://www.w3.org/2000/svg" fill="none"
                            viewBox="0 0 24 24" stroke="currentColor" stroke-width="2" stroke-linecap="round"
                            stroke-linejoin="round" aria-hidden="true">
                            <path d="M16 21v-2a4 4 0 0 0-4-4H6a4 4 0 0 0-4 4v2" />
                            <circle cx="9" cy="7" r="4" />
                            <path d="M22 21v-2a4 4 0 0 0-3-3.87" />
                            <path d="M16 3.13a4 4 0 0 1 0 7.75" />
                        </svg>
                    </div>
                </div>
                <p class="text-xs text-purple-600 mt-2">+<asp:Label ID="lblUsersChange" runat="server" Text="0"></asp:Label>% from last month</p>
            </div>

            <!-- Movies Playing -->
            <div class="bg-white rounded-xl p-6 shadow-sm border border-slate-200">
                <div class="flex items-center justify-between">
                    <div>
                        <p class="text-sm font-medium text-slate-600">Movies Playing</p>
                        <p class="text-2xl font-bold text-slate-900">
                            <asp:Label ID="lblMoviesPlaying" runat="server" Text="0"></asp:Label>
                        </p>
                    </div>
                    <div class="w-12 h-12 bg-red-100 rounded-lg flex items-center justify-center">
                        <svg class="w-6 h-6 text-red-600" xmlns="http://www.w3.org/2000/svg" fill="none"
                            viewBox="0 0 24 24" stroke="currentColor" stroke-width="2" stroke-linecap="round"
                            stroke-linejoin="round" aria-hidden="true">
                            <path d="M14.5 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V7.5L14.5 2z" />
                            <polyline points="14 2 14 8 20 8" />
                            <path d="m10 14 4-2-4-2v4Z" />
                        </svg>
                    </div>
                </div>
                <p class="text-xs text-red-600 mt-2">
                    +<asp:Label ID="lblMoviesChange" runat="server" Text="0"></asp:Label>
                    new releases
                </p>
            </div>

        </div>

        <div class="grid grid-cols-1 lg:grid-cols-2 gap-8">
            <div class="bg-white rounded-xl p-6 shadow-sm border border-slate-200">
                <h3 class="text-lg font-semibold mb-4">Ticket Sales Trend (This Week)</h3>
                <div class="chart-container">
                    <canvas id="ticketSalesChart"></canvas>
                </div>
            </div>


            <div class="bg-white rounded-xl p-6 shadow-sm border border-slate-200">
                <h3 class="text-lg font-semibold mb-4">Top Movies This Week</h3>
                <div class="space-y-4">
                    <% 
                        int rank = 0;
                        foreach (DataRow row in TopMoviesData.Rows)
                        {
                            string rankColor = GetRankColor(rank);
                    %>
                    <div class="flex items-center justify-between p-3 bg-slate-50 rounded-lg">
                        <div class="flex items-center space-x-3">
                            <div class="w-10 h-10 <%= rankColor %> rounded-lg flex items-center justify-center text-white font-bold">
                                <%= rank + 1 %>
                            </div>
                            <div>
                                <p class="font-medium"><%= row["Title"] %></p>
                                <p class="text-sm text-slate-600"><%= row["Genre"] %> • <%= row["Duration"] %></p>
                            </div>
                        </div>
                        <div class="text-right">
                            <p class="font-semibold"><%= row["TicketsSold"] %></p>
                            <p class="text-sm text-slate-600">tickets</p>
                        </div>
                    </div>
                    <%
                            rank++;
                        }
                    %>
                </div>
            </div>


            <div class="lg:col-span-2 bg-white rounded-xl p-6 shadow-sm border border-slate-200">
                <div class="flex items-center justify-between mb-4">
                    <h3 class="text-lg font-semibold">Recent Bookings</h3>
                    <a href="AdminBookings.aspx" class="text-sm font-medium text-red-600 hover:text-red-700">View All</a>
                </div>

                <div class="overflow-x-auto">
                    <table class="min-w-full divide-y divide-slate-200">
                        <thead class="bg-slate-50">
                            <tr>
                                <th class="px-6 py-3 text-left text-xs font-medium text-slate-500 uppercase tracking-wider">Booking ID</th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-slate-500 uppercase tracking-wider">Movie / Time</th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-slate-500 uppercase tracking-wider">Seats</th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-slate-500 uppercase tracking-wider">Amount</th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-slate-500 uppercase tracking-wider">Status</th>
                            </tr>
                        </thead>
                        <tbody class="divide-y divide-slate-200">
                            <asp:Repeater ID="rptRecentBookings" runat="server">
                                <itemtemplate>
                                    <tr class="hover:bg-slate-50 transition-colors">
                                        <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-slate-900">#<%# Eval("BookingID") %>
                                        </td>
                                        <td class="px-6 py-4 whitespace-nowrap text-sm text-slate-800">
                                            <span class="font-medium"><%# Eval("Title") %></span>
                                            <p class="text-xs text-slate-500">
                                                <%# Eval("Genre") %> • <%# Eval("Duration") %>

                                            </p>


                                        </td>
                                        <td class="px-6 py-4 whitespace-nowrap text-sm text-slate-600">
                                            <%# Eval("SeatNumber") %>
                                        </td>
                                        <td class="px-6 py-4 whitespace-nowrap text-sm font-semibold <%# GetAmountClass(Eval("PaymentStatus").ToString()) %>">Rs.<%# Eval("TicketPrice") %>
                                        </td>
                                        <td class="px-6 py-4 whitespace-nowrap">
                                            <span class="px-2 inline-flex text-xs leading-5 font-semibold rounded-full <%# GetStatusClass(Eval("PaymentStatus").ToString()) %>">
                                                <%# Eval("PaymentStatus") %>
                                            </span>
                                        </td>
                                    </tr>
                                </itemtemplate>
                            </asp:Repeater>
                        </tbody>
                    </table>
                </div>

            </div>

        </div>
    </main>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js@4.4.2/dist/chart.umd.min.js"></script>
    

</asp:Content>


