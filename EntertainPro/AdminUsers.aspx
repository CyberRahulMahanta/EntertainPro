<%@ Page Title="" Language="C#" MasterPageFile="~/AdminSite.Master" AutoEventWireup="true" CodeFile="AdminUsers.aspx.cs" Inherits="EntertainPro.AdminUsers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <main class="flex-1 p-6 md:p-8">

        <!-- Header -->
        <div class="mb-6">
            <h1 class="text-3xl md:text-4xl font-extrabold text-gray-900 mb-2 flex items-center gap-3">
                <svg class="w-10 h-10 text-red-500 animate-bounce" xmlns="http://www.w3.org/2000/svg" fill="none"
                    viewBox="0 0 24 24" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                        d="M17 20h5v-2a4 4 0 00-3-3.87M9 20H4v-2a4 4 0 013-3.87M12 12a4 4 0 100-8 4 4 0 000 8z" />
                </svg>
                <span class="bg-gradient-to-r from-red-500 via-pink-500 to-purple-500 bg-clip-text text-transparent">User Management</span>
            </h1>
            <p class="text-gray-500 text-sm md:text-base">
                Manage users, roles, and permissions in your system
            </p>
        </div>

        <!-- Container -->
        <div class="bg-white rounded-xl shadow-lg border border-slate-200 overflow-hidden">

            <!-- Search Bar -->
            <div class="px-6 py-4 border-b border-slate-200 flex flex-col sm:flex-row items-center justify-between">
                <div class="relative w-full sm:w-64">
                    <input type="text" placeholder="Search users or email..."
                        class="w-full pl-10 pr-4 py-2 border border-slate-300 rounded-lg text-sm 
                        focus:ring-2 focus:ring-red-500 focus:border-red-500 transition-shadow"
                        id="userSearchInput"
                        style="outline: none;">

                    <svg class="absolute left-3 top-1/2 transform -translate-y-1/2 w-4 h-4 text-slate-400" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z" />
                    </svg>
                </div>
                <!-- Total Users -->
                <div class="text-sm font-medium text-gray-700">
                    Total Users: <span id="totalUsers" runat="server">0</span>
                </div>
            </div>

            <!-- User Table -->
            <div class="overflow-x-auto mt-0">
                <table id="userTable" class="min-w-full divide-y divide-slate-200">
                    <thead class="bg-slate-50">
                        <tr>
                            <th class="text-left py-3 px-6 text-xs font-semibold text-slate-600 uppercase tracking-wider">User</th>
                            <th class="text-left py-3 px-6 text-xs font-semibold text-slate-600 uppercase tracking-wider">Email</th>
                            <th class="text-left py-3 px-6 text-xs font-semibold text-slate-600 uppercase tracking-wider">Join Date</th>
                            <th class="text-left py-3 px-6 text-xs font-semibold text-slate-600 uppercase tracking-wider">Bookings</th>
                            <th class="text-left py-3 px-6 text-xs font-semibold text-slate-600 uppercase tracking-wider">Actions</th>
                        </tr>
                    </thead>
                    <tbody class="divide-y divide-slate-200">
                        <asp:Repeater ID="UserRepeater" runat="server">
                            <ItemTemplate>
                                <tr class="hover:bg-red-50/50 transition-colors">
                                    <td data-col="user" class="py-4 px-6 whitespace-nowrap">
                                        <div class="flex items-center space-x-3">
                                            <img src='<%# Eval("ImagePath") %>'
                                                alt='<%# Eval("Username") %>'
                                                class="w-10 h-10 rounded-full object-cover border-2 border-red-500 shadow-sm" />

                                            <div>
                                                <p class="font-medium text-slate-900"><%# Eval("Username") %></p>
                                                <p class="text-sm text-slate-500">#USER<%# Eval("UserID") %></p>
                                            </div>
                                        </div>
                                    </td>
                                    <td data-col="email" class="py-4 px-6 text-sm text-slate-600 whitespace-nowrap"><%# Eval("Email") %></td>
                                    <td class="py-4 px-6 text-sm text-slate-600 whitespace-nowrap"><%# Eval("CreatedAt", "{0:MMM dd, yyyy}") %></td>
                                    <td class="py-4 px-6 text-sm font-medium text-slate-800 whitespace-nowrap"><%# Eval("Bookings") %></td>
                                    <td class="py-4 px-6 whitespace-nowrap space-x-2">
                                        <button type="button"
                                            class="bg-blue-500 hover:bg-blue-600 text-white px-3 py-1 rounded-md text-xs shadow"
                                            data-username='<%# Eval("Username") %>'
                                            data-dob='<%# Eval("DOB", "{0:MMM dd, yyyy}") %>'
                                            data-phone='<%# Eval("Phone") %>'
                                            data-joined='<%# Eval("CreatedAt", "{0:MMM dd, yyyy}") %>'
                                            data-role='<%# Eval("Role") %>'
                                            data-gender='<%# Eval("Gender") %>'
                                            data-image='<%# Eval("ImagePath") %>'
                                            data-email='<%# Eval("Email") %>'
                                            onclick="openProfileModal(this)">
                                            View Profile
                                        </button>


                                        <button
                                            type="button"
                                            class="bg-red-500 hover:bg-red-600 text-white px-3 py-1 rounded-md text-xs shadow"
                                            data-userid='<%# Eval("UserID") %>'
                                            data-username='<%# Eval("Username") %>'
                                            onclick="openDeleteModal(this)">
                                            Delete
                                        </button>

                                    </td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                    </tbody>
                </table>

            </div>

            <!-- Pagination -->
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

            <!-- Modal -->
            <div id="profileModal" class="fixed inset-0 bg-black bg-opacity-50 hidden flex items-center justify-center z-50">
                <div class="bg-white rounded-xl w-full max-w-md p-6 relative shadow-2xl transform transition-all duration-300 scale-95 opacity-0">
                    <!-- Close button -->
                    <button onclick="closeProfileModal()" class="absolute top-4 right-4 text-gray-400 hover:text-gray-700 text-xl font-semibold">
                        ✕
                    </button>

                    <!-- Profile Header -->
                    <div class="flex flex-col items-center text-center mb-6">
                        <div class="w-24 h-24 rounded-full border-2 border-red-500 overflow-hidden mb-3 shadow-md">
                            <img id="profileImage" src="" alt="User Image" class="w-full h-full object-cover">
                        </div>
                        <h2 id="profileUsername" class="text-2xl font-bold text-gray-900">Username</h2>
                        <p id="profileRole" class="text-sm text-gray-500 mt-1">Role</p>
                    </div>

                    <!-- Profile Details -->
                    <div class="grid grid-cols-2 gap-4 text-sm text-gray-700">
                        <div>
                            <p class="font-semibold">Date of Birth:</p>
                            <p id="profileDOB">-</p>
                        </div>
                        <div>
                            <p class="font-semibold">Phone:</p>
                            <p id="profilePhone">-</p>
                        </div>
                        <div>
                            <p class="font-semibold">Joined At:</p>
                            <p id="profileJoinedAt">-</p>
                        </div>
                        <div>
                            <p class="font-semibold">Gender:</p>
                            <p id="profileGender">-</p>
                        </div>
                    </div>

                    <!-- Action Buttons -->
                    <div class="mt-6 flex justify-center space-x-3">
                        <button type="button"
                            class="px-4 py-2 bg-red-600 text-white rounded-lg hover:bg-red-700 transition-colors"
                            onclick="openMessageModal('<%# Eval("Email") %>')">
                            Send Message
                        </button>

                        <button class="px-4 py-2 border border-gray-300 rounded-lg hover:bg-gray-100 transition-colors" onclick="closeProfileModal()">Close</button>
                    </div>
                </div>
            </div>

            <!-- Send Message Modal -->
            <div id="messageModal" class="fixed inset-0 bg-black bg-opacity-50 hidden items-center justify-center z-50 px-4">
                <div class="bg-white rounded-xl w-full max-w-md p-6 relative shadow-2xl transform transition-transform scale-95 opacity-0 duration-300">
                    <!-- Close button -->
                    <button onclick="closeMessageModal()" class="absolute top-4 right-4 text-gray-400 hover:text-gray-700 text-xl font-semibold">
                        ✕
                    </button>

                    <h2 class="text-xl font-bold mb-4">Send Message</h2>

                    <div class="flex flex-col gap-4">
                        <div>
                            <label for="messageTo" class="font-semibold text-gray-700">To:</label>
                            <input type="text" id="messageTo" class="w-full border border-gray-300 rounded-lg px-3 py-2" readonly>
                        </div>
                        <div>
                            <label for="messageContent" class="font-semibold text-gray-700">Message:</label>
                            <textarea id="messageContent" rows="5" class="w-full border border-gray-300 rounded-lg px-3 py-2" placeholder="Type your message here..."></textarea>
                        </div>
                        <div class="flex justify-end gap-3">
                            <button onclick="closeMessageModal()" class="px-4 py-2 border border-gray-300 rounded-lg hover:bg-gray-100 transition-colors">Cancel</button>
                            <button onclick="sendMessage()" class="px-4 py-2 bg-red-600 text-white rounded-lg hover:bg-red-700 transition-colors">Send</button>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Delete Confirmation Modal -->
            <div id="deleteModal" class="hidden fixed inset-0 bg-black/50 flex items-center justify-center z-50">
                <div class="bg-white rounded-2xl shadow-xl w-96 p-6">
                    <h3 class="text-lg font-semibold text-slate-800 mb-4">Confirm Delete</h3>
                    <p id="deleteMessage" class="text-slate-600 mb-6">
                        Are you sure you want to delete this user?
                    </p>

                    <div class="flex justify-end space-x-3">
                        <button type="button"
                            onclick="closeDeleteModal()"
                            class="px-4 py-2 text-sm bg-slate-200 hover:bg-slate-300 rounded-lg transition">
                            Cancel
                        </button>

                        <asp:Button ID="ConfirmDeleteBtn" runat="server"
                            Text="Delete"
                            CssClass="px-4 py-2 text-sm bg-red-600 text-white hover:bg-red-700 rounded-lg transition"
                            OnClick="ConfirmDeleteBtn_Click" />
                    </div>

                    <!-- Hidden field to store UserID -->
                    <asp:HiddenField ID="HiddenUserID" runat="server" />
                </div>
            </div>



        </div>
    </main>

    <script>

        // User Profile Modal js code

        function openProfileModal(button) {
            const modal = document.getElementById('profileModal');
            const modalContent = modal.querySelector('div');

            document.getElementById('profileImage').src = button.dataset.image || 'default.png';
            document.getElementById('profileUsername').innerText = button.dataset.username;
            document.getElementById('profileRole').innerText = button.dataset.role;
            document.getElementById('profileDOB').innerText = button.dataset.dob;
            document.getElementById('profilePhone').innerText = button.dataset.phone;
            document.getElementById('profileJoinedAt').innerText = button.dataset.joined;
            document.getElementById('profileGender').innerText = button.dataset.gender;

            // Pass email to Send Message button dynamically
            const sendBtn = modal.querySelector('button[onclick^="openMessageModal"]');
            sendBtn.setAttribute('onclick', `openMessageModal('${button.dataset.email}')`);

            modal.classList.remove('hidden');

            // Trigger animation
            setTimeout(() => {
                modalContent.classList.remove('scale-95', 'opacity-0');
                modalContent.classList.add('scale-100', 'opacity-100');
            }, 10);
        }


        function closeProfileModal() {
            const modal = document.getElementById('profileModal');
            const modalContent = modal.querySelector('div');

            modalContent.classList.add('scale-95', 'opacity-0');
            setTimeout(() => modal.classList.add('hidden'), 200);
        }

        // USer messaging MOdal js code 
        function openMessageModal(userEmail) {
            document.getElementById('messageTo').value = userEmail;

            const modal = document.getElementById('messageModal');
            modal.classList.remove('hidden');
            const modalContent = modal.querySelector('div');
            setTimeout(() => {
                modalContent.classList.remove('scale-95', 'opacity-0');
                modalContent.classList.add('scale-100', 'opacity-100');
            }, 10);
        }

        function closeMessageModal() {
            const modal = document.getElementById('messageModal');
            const modalContent = modal.querySelector('div');
            modalContent.classList.add('scale-95', 'opacity-0');
            setTimeout(() => modal.classList.add('hidden'), 200);
        }

        function sendMessage() {
            const to = document.getElementById('messageTo').value;
            const message = document.getElementById('messageContent').value;

            if (!message) {
                alert("Please type a message.");
                return;
            }

            // Here you can call your ASP.NET backend via AJAX to send the message
            console.log("Message sent to:", to, "Content:", message);

            // Close modal after sending
            closeMessageModal();
        }

        // user deleting modal

        function openDeleteModal(button) {
            const userId = button.getAttribute('data-userid');
            const username = button.getAttribute('data-username');

            document.getElementById('<%= HiddenUserID.ClientID %>').value = userId;
            document.getElementById("deleteMessage").textContent =
                `Are you sure you want to delete user "${username}"?`;

            document.getElementById("deleteModal").classList.remove("hidden");
        }

        function closeDeleteModal() {
            document.getElementById("deleteModal").classList.add("hidden");
        }


        document.addEventListener('DOMContentLoaded', function () {
            const searchInput = document.getElementById('userSearchInput');
            const tableBody = document.querySelector('#userTable tbody');
            const rows = tableBody.querySelectorAll('tr');
            searchInput.addEventListener('keyup', applyFilters);

            function applyFilters() {
                const searchTerm = searchInput.value.toLowerCase().trim();
                const statusTerm = '';

                rows.forEach(row => {
                    const userNameCell = row.querySelector('[data-col="user"] p.font-medium');
                    const emailCell = row.querySelector('[data-col="email"]');
                    if (!userNameCell || !emailCell) return;

                    const userName = userNameCell.textContent.toLowerCase();
                    const email = emailCell.textContent.toLowerCase();

                    const passesSearch = (userName.includes(searchTerm) || email.includes(searchTerm));

                    const passesStatus = (statusTerm === ''); // Always true

                    if (passesSearch && passesStatus) {
                        row.style.display = '';
                    } else {
                        row.style.display = 'none';
                    }
                });
            }

        });
    </script>
</asp:Content>
