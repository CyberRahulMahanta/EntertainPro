<%@ Page Title="" Language="C#" MasterPageFile="~/AdminSite.Master" AutoEventWireup="true" CodeFile="AdminUsers.aspx.cs" Inherits="EntertainPro.AdminUsers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <main class="flex-1 p-6 md:p-8">
        <div class="mb-8">
            <h1 class="text-3xl md:text-4xl font-extrabold text-gray-900 mb-4 flex items-center gap-3">
                <svg class="w-10 h-10 text-red-500 animate-bounce" xmlns="http://www.w3.org/2000/svg" fill="none"
                    viewBox="0 0 24 24" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                        d="M17 20h5v-2a4 4 0 00-3-3.87M9 20H4v-2a4 4 0 013-3.87M12 12a4 4 0 100-8 4 4 0 000 8z" />
                </svg>

                <span class="bg-gradient-to-r from-red-500 via-pink-500 to-purple-500 bg-clip-text text-transparent">User Management
                </span>
            </h1>

            <p class="text-gray-500 text-sm md:text-base">
                Manage users, roles, and permissions in your system
           
            </p>
        </div>

        <div class="bg-white rounded-xl shadow-lg border border-slate-200 overflow-hidden">

            <div class="p-6 border-b border-slate-200 flex flex-col sm:flex-row items-center justify-between gap-4">

                <div class="relative w-full sm:w-64 order-1 sm:order-none">
                    <input type="text" placeholder="Search users or email..."
                        class="w-full pl-10 pr-4 py-2 border border-slate-300 rounded-lg text-sm focus:ring-red-500 focus:border-red-500 transition-shadow"
                        id="userSearchInput">
                    <svg class="absolute left-3 top-1/2 transform -translate-y-1/2 w-4 h-4 text-slate-400" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z" />
                    </svg>
                </div>

                <div class="flex flex-wrap items-center justify-end gap-3 order-2 sm:order-none">

                    <div class="flex items-center gap-2 relative">
                        <label for="statusFilter" class="sr-only sm:not-sr-only text-sm font-medium text-slate-700 whitespace-nowrap">Status:</label>
                        <select id="statusFilter" class="pr-8 pl-3 py-2 border border-slate-300 rounded-lg text-sm text-slate-700 focus:ring-red-500 focus:border-red-500 appearance-none bg-white">
                            <option value="">All Statuses</option>
                            <option value="Active">Active</option>
                            <option value="Suspended">Suspended</option>
                            <option value="Pending">Pending</option>
                        </select>
                        <svg class="absolute right-2 top-1/2 transform -translate-y-1/2 w-4 h-4 text-slate-400 pointer-events-none" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                            <path stroke-linecap="round" stroke-linejoin="round" d="M19 9l-7 7-7-7" />
                        </svg>
                    </div>
                </div>
            </div>


            <div class="overflow-x-auto">
                <table class="min-w-full divide-y divide-slate-200" id="userTable">
                    <thead class="bg-slate-50">
                        <tr>
                            <th scope="col" class="text-left py-3 px-6 text-xs font-semibold text-slate-600 uppercase tracking-wider">User</th>
                            <th scope="col" class="text-left py-3 px-6 text-xs font-semibold text-slate-600 uppercase tracking-wider">Email</th>
                            <th scope="col" class="text-left py-3 px-6 text-xs font-semibold text-slate-600 uppercase tracking-wider">Join Date</th>
                            <th scope="col" class="text-left py-3 px-6 text-xs font-semibold text-slate-600 uppercase tracking-wider">Bookings</th>
                            <th scope="col" class="text-left py-3 px-6 text-xs font-semibold text-slate-600 uppercase tracking-wider">Status</th>
                            <th scope="col" class="text-left py-3 px-6 text-xs font-semibold text-slate-600 uppercase tracking-wider">Actions</th>
                        </tr>
                    </thead>
                    <tbody class="divide-y divide-slate-200">
                        <tr class="hover:bg-red-50/50 transition-colors">
                            <td class="py-4 px-6 whitespace-nowrap" data-col="user">
                                <div class="flex items-center space-x-3">
                                    <img src="https://placehold.co/40x40/3b82f6/ffffff?text=JS" alt="John Smith"
                                        class="w-10 h-10 rounded-full object-cover">
                                    <div>
                                        <p class="font-medium text-slate-900">John Smith</p>
                                        <p class="text-sm text-slate-500">#USER001</p>
                                    </div>
                                </div>
                            </td>
                            <td class="py-4 px-6 text-sm text-slate-600 whitespace-nowrap" data-col="email">john.smith@email.com</td>
                            <td class="py-4 px-6 text-sm text-slate-600 whitespace-nowrap">Jan 15, 2024</td>
                            <td class="py-4 px-6 text-sm font-medium text-slate-800 whitespace-nowrap">12</td>
                            <td class="py-4 px-6 whitespace-nowrap" data-col="status">
                                <span
                                    class="inline-flex items-center px-3 py-1 rounded-full text-xs font-semibold bg-green-100 text-green-700">Active</span>
                            </td>
                            <td class="py-4 px-6 whitespace-nowrap space-x-2">
                                <button title="Edit User"
                                    class="text-red-600 hover:text-red-800 text-sm font-medium transition-colors p-1">
                                    Edit</button>
                                <button title="Block User"
                                    class="text-slate-500 hover:text-slate-800 text-sm font-medium transition-colors p-1">
                                    Block</button>
                            </td>
                        </tr>

                        <tr class="hover:bg-red-50/50 transition-colors">
                            <td class="py-4 px-6 whitespace-nowrap" data-col="user">
                                <div class="flex items-center space-x-3">
                                    <img src="https://placehold.co/40x40/ec4899/ffffff?text=EJ"
                                        alt="Emma Johnson" class="w-10 h-10 rounded-full object-cover">
                                    <div>
                                        <p class="font-medium text-slate-900">Emma Johnson</p>
                                        <p class="text-sm text-slate-500">#USER002</p>
                                    </div>
                                </div>
                            </td>
                            <td class="py-4 px-6 text-sm text-slate-600 whitespace-nowrap" data-col="email">emma.johnson@email.com</td>
                            <td class="py-4 px-6 text-sm text-slate-600 whitespace-nowrap">Jan 20, 2024</td>
                            <td class="py-4 px-6 text-sm font-medium text-slate-800 whitespace-nowrap">8</td>
                            <td class="py-4 px-6 whitespace-nowrap" data-col="status">
                                <span
                                    class="inline-flex items-center px-3 py-1 rounded-full text-xs font-semibold bg-green-100 text-green-700">Active</span>
                            </td>
                            <td class="py-4 px-6 whitespace-nowrap space-x-2">
                                <button title="Edit User"
                                    class="text-red-600 hover:text-red-800 text-sm font-medium transition-colors p-1">
                                    Edit</button>
                                <button title="Block User"
                                    class="text-slate-500 hover:text-slate-800 text-sm font-medium transition-colors p-1">
                                    Block</button>
                            </td>
                        </tr>

                        <tr class="hover:bg-red-50/50 transition-colors">
                            <td class="py-4 px-6 whitespace-nowrap" data-col="user">
                                <div class="flex items-center space-x-3">
                                    <img src="https://placehold.co/40x40/10b981/ffffff?text=MB"
                                        alt="Michael Brown" class="w-10 h-10 rounded-full object-cover">
                                    <div>
                                        <p class="font-medium text-slate-900">Michael Brown</p>
                                        <p class="text-sm text-slate-500">#USER003</p>
                                    </div>
                                </div>
                            </td>
                            <td class="py-4 px-6 text-sm text-slate-600 whitespace-nowrap" data-col="email">michael.brown@email.com</td>
                            <td class="py-4 px-6 text-sm text-slate-600 whitespace-nowrap">Feb 2, 2024</td>
                            <td class="py-4 px-6 text-sm font-medium text-slate-800 whitespace-nowrap">15</td>
                            <td class="py-4 px-6 whitespace-nowrap" data-col="status">
                                <span
                                    class="inline-flex items-center px-3 py-1 rounded-full text-xs font-semibold bg-red-100 text-red-700">Suspended</span>
                            </td>
                            <td class="py-4 px-6 whitespace-nowrap space-x-2">
                                <button title="Edit User"
                                    class="text-red-600 hover:text-red-800 text-sm font-medium transition-colors p-1">
                                    Edit</button>
                                <button title="Activate User"
                                    class="text-green-600 hover:text-green-800 text-sm font-medium transition-colors p-1">
                                    Activate</button>
                            </td>
                        </tr>

                        <tr class="hover:bg-red-50/50 transition-colors">
                            <td class="py-4 px-6 whitespace-nowrap" data-col="user">
                                <div class="flex items-center space-x-3">
                                    <img src="https://placehold.co/40x40/f97316/ffffff?text=LA"
                                        alt="Laura Adams" class="w-10 h-10 rounded-full object-cover">
                                    <div>
                                        <p class="font-medium text-slate-900">Laura Adams</p>
                                        <p class="text-sm text-slate-500">#USER004</p>
                                    </div>
                                </div>
                            </td>
                            <td class="py-4 px-6 text-sm text-slate-600 whitespace-nowrap" data-col="email">laura.adams@email.com</td>
                            <td class="py-4 px-6 text-sm text-slate-600 whitespace-nowrap">Mar 10, 2024</td>
                            <td class="py-4 px-6 text-sm font-medium text-slate-800 whitespace-nowrap">3</td>
                            <td class="py-4 px-6 whitespace-nowrap" data-col="status">
                                <span
                                    class="inline-flex items-center px-3 py-1 rounded-full text-xs font-semibold bg-yellow-100 text-yellow-700">Pending</span>
                            </td>
                            <td class="py-4 px-6 whitespace-nowrap space-x-2">
                                <button title="Edit User"
                                    class="text-red-600 hover:text-red-800 text-sm font-medium transition-colors p-1">
                                    Edit</button>
                                <button title="Delete User"
                                    class="text-red-500 hover:text-red-700 text-sm font-medium transition-colors p-1">
                                    Delete</button>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <div class="p-4 border-t border-slate-200 flex items-center justify-between text-sm">
                <p class="text-slate-600">Showing <span class="font-semibold">1</span> to <span class="font-semibold">10</span> of <span class="font-semibold">150</span> results</p>
                <div class="flex space-x-1">
                    <button class="px-3 py-1 rounded-lg bg-slate-100 text-slate-500 cursor-not-allowed border border-slate-300">Previous</button>
                    <button class="px-3 py-1 rounded-lg bg-red-600 text-white font-semibold">1</button>
                    <button class="px-3 py-1 rounded-lg hover:bg-slate-200 text-slate-700 border border-slate-300 transition-colors">2</button>
                    <button class="px-3 py-1 rounded-lg hover:bg-slate-200 text-slate-700 border border-slate-300 transition-colors">3</button>
                    <button class="px-3 py-1 rounded-lg bg-white hover:bg-red-50 text-red-600 border border-red-300 transition-colors">Next</button>
                </div>
            </div>
        </div>
    </main>

    <script>
        document.addEventListener('DOMContentLoaded', function () {
            const searchInput = document.getElementById('userSearchInput');
            const statusFilter = document.getElementById('statusFilter');
            const tableBody = document.querySelector('#userTable tbody');
            const rows = tableBody.querySelectorAll('tr');

            // Attach the same filter function to both events
            searchInput.addEventListener('keyup', applyFilters);
            statusFilter.addEventListener('change', applyFilters);

            function applyFilters() {
                const searchTerm = searchInput.value.toLowerCase().trim();
                const statusTerm = statusFilter.value; // 'Active', 'Suspended', 'Pending', or '' (for All)

                rows.forEach(row => {
                    // Using the added 'data-col' attributes to reliably find the content
                    const userNameCell = row.querySelector('[data-col="user"] p.font-medium');
                    const emailCell = row.querySelector('[data-col="email"]');
                    const statusCell = row.querySelector('[data-col="status"] span');

                    if (!userNameCell || !emailCell || !statusCell) return;

                    const userName = userNameCell.textContent.toLowerCase();
                    const email = emailCell.textContent.toLowerCase();
                    const currentStatus = statusCell.textContent;

                    // 1. Search Filter Logic: Check if the search term is in the user name OR email
                    const passesSearch = (userName.includes(searchTerm) || email.includes(searchTerm));

                    // 2. Status Filter Logic: Check if the current status matches the selected status
                    const passesStatus = (statusTerm === '' || currentStatus === statusTerm);

                    // Show the row only if it passes BOTH filters
                    if (passesSearch && passesStatus) {
                        row.style.display = ''; // Show the row
                    } else {
                        row.style.display = 'none'; // Hide the row
                    }
                });
            }
        });
    </script>
</asp:Content>
