<%@ Page Title="" Language="C#" MasterPageFile="~/AdminSite.Master" AutoEventWireup="true" CodeFile="AdminBookings.aspx.cs" Inherits="EntertainPro.AdminBookings" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
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


                        <!-- Status Filter -->
                        <select id="status-filter-select" title="Filter by status"
                            class="bg-red-50 border border-red-300 rounded-lg px-4 py-2 text-sm font-medium text-red-700 hover:bg-red-100 focus:ring-2 focus:ring-red-500 focus:outline-none transition-shadow duration-150">
                            <option value="all" class="bg-white text-slate-700">All Status</option>
                            <option value="confirmed" class="bg-white text-emerald-700">Confirmed</option>
                            <option value="pending" class="bg-white text-amber-700">Pending</option>
                            <option value="cancelled" class="bg-white text-red-700">Cancelled</option>
                        </select>
                    </div>
                </div>
            </div>

            <div class="overflow-x-auto">
                <table class="w-full">
                    <thead class="bg-slate-50/70 border-b border-slate-100">
                        <tr>
                            <th class="text-left py-4 px-6 font-semibold text-slate-700 text-sm tracking-wider">Booking ID</th>
                            <th class="text-left py-4 px-6 font-semibold text-slate-700 text-sm tracking-wider">Customer</th>
                            <th class="text-left py-4 px-6 font-semibold text-slate-700 text-sm tracking-wider">Movie</th>
                            <th class="text-left py-4 px-6 font-semibold text-slate-700 text-sm tracking-wider">Show Time</th>
                            <th class="text-left py-4 px-6 font-semibold text-slate-700 text-sm tracking-wider">Seats</th>
                            <th class="text-left py-4 px-6 font-semibold text-slate-700 text-sm tracking-wider">Amount</th>
                            <th class="text-left py-4 px-6 font-semibold text-slate-700 text-sm tracking-wider">Status</th>
                        </tr>
                    </thead>
                    <tbody class="divide-y divide-slate-100 text-slate-600">
                        <tr class="hover:bg-slate-50/50 transition-colors duration-150" data-status="confirmed">
                            <td class="py-4 px-6 font-semibold text-slate-800">#BK001</td>
                            <td class="py-4 px-6">John Smith</td>
                            <td class="py-4 px-6">Starlight Rebellion</td>
                            <td class="py-4 px-6" data-show-date="2025-10-11">Today, 7:30 PM</td>
                            <td class="py-4 px-6">A1, A2</td>
                            <td class="py-4 px-6 font-semibold text-green-700">$24.00</td>
                            <td class="py-4 px-6">
                                <span
                                    class="inline-flex items-center px-3 py-1 text-xs font-semibold rounded-full bg-emerald-100 text-emerald-700 ring-1 ring-emerald-200">Confirmed
                                </span>
                            </td>
                        </tr>
                        <tr class="hover:bg-slate-50/50 transition-colors duration-150" data-status="pending">
                            <td class="py-4 px-6 font-semibold text-slate-800">#BK002</td>
                            <td class="py-4 px-6">Emma Johnson</td>
                            <td class="py-4 px-6">Ocean's Mystery</td>
                            <td class="py-4 px-6" data-show-date="2025-10-12">Tomorrow, 9:00 PM</td>
                            <td class="py-4 px-6">B5, B6, B7</td>
                            <td class="py-4 px-6 font-semibold text-amber-700">$36.00</td>
                            <td class="py-4 px-6">
                                <span
                                    class="inline-flex items-center px-3 py-1 text-xs font-semibold rounded-full bg-amber-100 text-amber-700 ring-1 ring-amber-200">Pending
                                </span>
                            </td>
                        </tr>
                        <tr class="hover:bg-slate-50/50 transition-colors duration-150" data-status="cancelled">
                            <td class="py-4 px-6 font-semibold text-slate-800">#BK003</td>
                            <td class="py-4 px-6">Michael Brown</td>
                            <td class="py-4 px-6">Comedy Central</td>
                            <td class="py-4 px-6" data-show-date="2025-10-10">Yesterday, 5:15 PM</td>
                            <td class="py-4 px-6">C3, C4</td>
                            <td class="py-4 px-6 font-semibold text-red-700">$20.00</td>
                            <td class="py-4 px-6">
                                <span
                                    class="inline-flex items-center px-3 py-1 text-xs font-semibold rounded-full bg-red-100 text-red-700 ring-1 ring-red-200">Cancelled
                                </span>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </main>
</asp:Content>
