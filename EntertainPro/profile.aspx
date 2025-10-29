<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeFile="profile.aspx.cs" Inherits="EntertainPro.profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>EntertainPro Profile</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script>
        // Tailwind applies only to elements inside this container
        tailwind.config = {
            important: '#tailwind-container'
        }
    </script>
    <link rel="stylesheet" href="css/UserProfilePage.css" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div id="tailwind-container">
        <div class="w-full bg-white shadow-2xl flex flex-col lg:flex-row overflow-hidden">

            <div class="lg:w-1/5 p-6 sm:p-8 bg-gradient-to-br from-[#ff4444] to-red-600 text-white flex flex-col justify-start space-y-8 min-h-screen">

                <!-- User Info -->
                <div class="flex items-center space-x-3">
                    <!-- Profile picture or initials -->
                    <div id="profileContainer" runat="server"
                        class="w-8 h-8 rounded-full bg-red-100 flex items-center justify-center text-red-700 text-sm font-bold border-2 border-white flex-shrink-0 overflow-hidden">
                    </div>

                    <div>
                        <span class="text-sm font-medium opacity-80 block leading-none">Hello,</span>
                        <span id="userName" runat="server" class="text-xl font-extrabold leading-tight tracking-tight"></span>
                    </div>
                </div>

                <!-- Navigation -->
                <nav class="flex flex-col space-y-4 text-lg font-medium">
                    <a href="#" id="profile-link" class="text-white nav-active transition duration-200"
                        onclick="showContent('user-profile')">Your Profile
                    </a>
                    <a href="#" id="history-link" class="text-red-100 hover:text-white pl-3 py-1 transition duration-200"
                        onclick="showContent('booking-history')">Booking History
                    </a>
                    <a href="#" id="settings-link" class="text-red-100 hover:text-white pl-3 py-1 transition duration-200"
                        onclick="showContent('settings')">Settings
                    </a>
                    <a href="#" id="support-link" class="text-red-100 hover:text-white pl-3 py-1 transition duration-200"
                        onclick="showContent('help-support')">Help & Support
                    </a>
                </nav>
            </div>


            <div class="lg:w-4/5 p-6 sm:p-10 text-gray-800">

                <h1 class="text-3xl sm:text-4xl font-light mb-8 flex flex-wrap items-end">Welcome to
                <span class="font-extrabold ml-2">Entertain</span>
                    <span class="font-extrabold text-[#ff4444]">Pro</span>
                </h1>

                <hr class="mb-6 border-t border-gray-200">


                <div id="Div1">
                    <div class="mb-8">
                        <h2 class="text-xl font-semibold mb-3">Our signature loyalty program</h2>
                        <p class="text-gray-600 leading-relaxed text-sm sm:text-base">The program provides members exclusive access to special movie screenings, premieres as well as meet-and-greet with stars! <a href="#" class="text-[#ff4444] hover:text-red-600 font-medium ml-1">Know more</a> </p>
                    </div>
                    <div class="text-right mb-6 relative">
                        <asp:Button ID="btnEdit" runat="server" Text="Edit Profile"
                            CssClass="text-[#ff4444] hover:text-red-600 font-medium flex items-center justify-end absolute top-0 right-0"
                            OnClick="EditButton_Click" OnClientClick="toggleEditMode(); return false;" />

                        <asp:Button ID="btnSave" runat="server" Text="Save Changes"
                            CssClass="hidden px-4 py-1 bg-[#ff4444] text-white font-medium rounded-lg hover:bg-red-600 transition duration-200 shadow-md"
                            OnClick="SaveButton_Click" OnClientClick="toggleEditMode(); return false;" />
                    </div>

                    <div class="flex items-center space-x-6 mb-8 mt-4 sm:mt-0">
                        <div class="relative w-24 h-24">
                            <div id="profilePicContainer" runat="server"
                                class="w-full h-full rounded-full bg-gray-200 flex items-center justify-center text-gray-500 text-5xl font-bold overflow-hidden border-2 border-gray-300 cursor-pointer">
                                <!-- Initials or background image -->
                            </div>

                            <!-- Camera icon overlay -->
                            <div class="absolute bottom-0 right-0 bg-white rounded-full p-1 border border-gray-300">
                                <svg class="w-4 h-4 text-gray-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                        d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z">
                                    </path>
                                </svg>
                            </div>

                            <asp:FileUpload ID="fuProfilePic" runat="server" CssClass="hidden" onchange="previewImage(event);" />

                            <!-- Save Button -->
                            <asp:Button ID="btnSaveProfilePic" runat="server" Text="Save" CssClass="hidden mt-2 px-4 py-1 bg-[#ff4444] text-white font-medium rounded-lg hover:bg-red-600 transition duration-200 shadow-md" OnClick="btnSaveProfilePic_Click" />
                        </div>


                        <div>
                            <asp:Label ID="fullName" runat="server" CssClass="text-2xl font-bold text-gray-900"></asp:Label>
                            <p id="membership" class="text-gray-600">Premium Member</p>
                        </div>
                    </div>

                    <!-- Toast container -->
                    <div id="toast" class="fixed top-20 right-4 bg-green-500 text-white px-4 py-2 rounded shadow-lg hidden transition-all duration-300">
                        Success message
                    </div>

                    <div class="pt-6 sm:pt-4">
                        <div class="grid grid-cols-1 sm:grid-cols-2 gap-y-6 gap-x-12">

                            <div class="flex items-center space-x-3">
                                <span class="text-sm font-semibold text-gray-600 w-24 flex-shrink-0">First Name:</span>
                                <asp:TextBox ID="txtFirstName" runat="server" CssClass="hidden profile-input"></asp:TextBox>
                                <asp:Label ID="lblFirstName" runat="server" CssClass="profile-field-display font-medium"></asp:Label>
                            </div>

                            <div class="flex items-center space-x-3">
                                <span class="text-sm font-semibold text-gray-600 w-24 flex-shrink-0">Last Name:</span>
                                <asp:TextBox ID="txtLastName" runat="server" CssClass="hidden profile-input"></asp:TextBox>
                                <asp:Label ID="lblLastName" runat="server" CssClass="profile-field-display font-medium"></asp:Label>
                            </div>

                            <div class="flex items-center space-x-3">
                                <span class="text-sm font-semibold text-gray-600 w-24 flex-shrink-0">Email:</span>
                                <asp:Label ID="lblEmail" runat="server" CssClass="font-medium truncate"></asp:Label>
                            </div>

                            <div class="flex items-center space-x-3">
                                <span class="text-sm font-semibold text-gray-600 w-24 flex-shrink-0">DOB:</span>
                                <asp:TextBox ID="txtDOB" runat="server" CssClass="hidden profile-input" TextMode="Date"></asp:TextBox>
                                <asp:Label ID="lblDOB" runat="server" CssClass="profile-field-display font-medium"></asp:Label>
                            </div>

                            <div class="flex items-center space-x-3">
                                <span class="text-sm font-semibold text-gray-600 w-24 flex-shrink-0">Mobile:</span>
                                <asp:TextBox ID="txtMobile" runat="server" CssClass="hidden profile-input"></asp:TextBox>
                                <asp:Label ID="lblMobile" runat="server" CssClass="profile-field-display font-medium"></asp:Label>
                            </div>

                            <div class="flex items-center space-x-3">
                                <span class="text-sm font-semibold text-gray-600 w-24 flex-shrink-0">Gender:</span>
                                <asp:DropDownList ID="ddlGender" runat="server" CssClass="hidden profile-input">
                                    <asp:ListItem Text="Select" Value=""></asp:ListItem>
                                    <asp:ListItem Text="Male" Value="Male"></asp:ListItem>
                                    <asp:ListItem Text="Female" Value="Female"></asp:ListItem>
                                    <asp:ListItem Text="Other" Value="Other"></asp:ListItem>
                                </asp:DropDownList>
                                <asp:Label ID="lblGender" runat="server" CssClass="profile-field-display font-medium"></asp:Label>
                            </div>

                        </div>
                    </div>
                </div>
                <div id="booking-history-content" class="hidden">
                    <asp:Panel ID="pnlNoBookings" runat="server" CssClass="text-gray-500 text-sm" Visible="false">
                        No bookings found.
                    </asp:Panel>

                    <asp:DataList ID="dlBookings" runat="server" RepeatDirection="Horizontal"
                        RepeatLayout="Flow" CellPadding="10" CssClass="flex flex-wrap gap-6 justify-start">

                        <ItemTemplate>
                            <div class="ticket-card bg-white rounded-xl shadow-xl border border-gray-200 font-sans flex-shrink-0">
                                <div class="flex-grow flex flex-col justify-start">
                                    <div class="text-xs font-semibold text-[#ff4444] mb-1 uppercase tracking-wider">
                                        EntertainPro Ticket
                                    </div>
                                    <h3 class="text-xl font-extrabold text-gray-900 leading-tight mb-2 title-break">
                                        <%# Eval("MovieName") %>
                                    </h3>
                                    <p class="text-sm text-gray-600 mb-4">
                                        <%# Eval("ShowLanguage") %> | <%# Eval("ScreenType") %> | <%# Eval("MovieDuration") %>
                                    </p>

                                    <div class="grid grid-cols-2 gap-y-3 text-sm">
                                        <div>
                                            <p class="text-xs font-semibold text-gray-500">DATE</p>
                                            <p class="font-bold"><%# Convert.ToDateTime(Eval("ShowDate")).ToString("dd MMM") %></p>
                                        </div>
                                        <div>
                                            <p class="text-xs font-semibold text-gray-500">TIME</p>
                                            <p class="font-bold"><%# Eval("ShowTime") %></p>
                                        </div>
                                        <div>
                                            <p class="text-xs font-semibold text-gray-500">SCREEN</p>
                                            <p class="font-bold"><%# Eval("ScreenName") %></p>
                                        </div>
                                        <div>
                                            <p class="text-xs font-semibold text-gray-500">SEATS</p>
                                            <p class="font-bold"><%# Eval("SeatNumber") %></p>
                                        </div>
                                    </div>
                                </div>

                                <div class="dashed-divider"></div>

                                <div class="mt-auto text-center">
                                    <p class="text-xs font-semibold text-gray-500 mb-1">Total Paid</p>
                                    <p class="text-3xl font-extrabold text-[#ff4444] leading-none mb-3">Rs <%# Eval("TicketPrice") %></p>
                                    <p class="text-xs text-gray-500">Booking ID: <%# Eval("BookingID") %></p>
                                    <p class="text-xs text-gray-500">Payment Status: <%# Eval("PaymentStatus") %></p>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:DataList>
                </div>

                <div id="settings-content" class="hidden">
                    <h2 class="text-2xl font-semibold mb-6 text-gray-700">Account and Privacy Settings</h2>

                    <div class="space-y-6">
                        <div class="p-6 bg-gray-50 rounded-lg shadow-sm border border-gray-200">
                            <h3 class="text-lg font-bold text-gray-800 mb-3">Notification</h3>
                            <p class="text-sm text-gray-600 mb-4">Control which notifications updates you receive.</p>

                            <div class="space-y-4">
                                <div class="flex items-center justify-between">
                                    <span class="text-base font-medium text-gray-700">Receive Notifications emails</span>
                                    <label for="email-toggle" class="relative">
                                        <input type="checkbox" id="email-toggle" class="toggle-checkbox" checked
                                            title="Email message">
                                        <div class="toggle-label"></div>
                                    </label>
                                </div>

                                <div class="flex items-center justify-between">
                                    <span class="text-base font-medium text-gray-700">Receive Notifications Whatsapp
                                    message</span>
                                    <label for="whatsapp-toggle" class="relative">
                                        <input type="checkbox" id="whatsapp-toggle" class="toggle-checkbox" checked
                                            title="Whatsapp message">
                                        <div class="toggle-label"></div>
                                    </label>
                                </div>
                            </div>
                        </div>

                        <div class="p-6 bg-gray-50 rounded-lg shadow-sm border border-gray-200">
                            <h3 class="text-lg font-bold text-gray-800 mb-2">Change Password</h3>
                            <p class="text-sm text-gray-600 mb-4">
                                You will be logged out of all devices after changing your password.
                            </p>
                            <button id="openChangePasswordModal"
                                class="px-4 py-2 bg-[#ff4444] text-white font-medium rounded-lg hover:bg-red-600 transition duration-200 shadow-md"
                                onclick="openChangePasswordModal()">
                                Update Password
                            </button>
                        </div>


                        <div class="p-6 bg-yellow-50 rounded-lg shadow-sm border border-yellow-300">
                            <h3 class="text-lg font-bold text-gray-800 mb-2">Delete Account</h3>
                            <p class="text-sm text-gray-700 mb-4">This action is permanent and cannot be undone.</p>
                            <button
                                class="px-4 py-2 bg-red-500 text-white font-medium rounded-lg hover:bg-red-700 transition duration-200 shadow-md">
                                Permanently Delete Account
                            </button>
                        </div>
                    </div>

                </div>


                <!-- Change Password Modal -->
                <div id="changePasswordModal"
                    class="fixed inset-0 bg-black bg-opacity-40 flex items-center justify-center hidden z-50">
                    <div class="bg-white rounded-2xl shadow-xl w-full max-w-md p-6 relative">
                        <!-- Close Button -->
                        <asp:Button ID="btnCloseModal" runat="server" Text="�"
                            CssClass="absolute top-3 right-3 text-gray-500 hover:text-gray-700 text-xl font-bold"
                            OnClientClick="closeChangePasswordModal(); return false;" />

                        <h2 class="text-2xl font-semibold text-gray-800 mb-4">Change Password</h2>
                        <p class="text-sm text-gray-600 mb-6">Please enter your current password and set a new one.</p>

                        <asp:Panel ID="pnlChangePassword" runat="server" CssClass="space-y-4">
                            <div>
                                <asp:Label ID="lblCurrentPassword" runat="server" Text="Current Password"
                                    CssClass="block text-gray-700 font-medium mb-1" AssociatedControlID="txtCurrentPassword" />
                                <asp:TextBox ID="txtCurrentPassword" runat="server" TextMode="Password"
                                    CssClass="w-full border border-gray-300 rounded-lg px-3 py-2 focus:outline-none focus:ring-2 focus:ring-[#ff4444]"
                                    placeholder="Enter current password"/>
                            </div>

                            <div>
                                <asp:Label ID="lblNewPassword" runat="server" Text="New Password"
                                    CssClass="block text-gray-700 font-medium mb-1" AssociatedControlID="txtNewPassword" />
                                <asp:TextBox ID="txtNewPassword" runat="server" TextMode="Password"
                                    CssClass="w-full border border-gray-300 rounded-lg px-3 py-2 focus:outline-none focus:ring-2 focus:ring-[#ff4444]"
                                    placeholder="Enter new password"/>
                            </div>

                            <div>
                                <asp:Label ID="lblConfirmPassword" runat="server" Text="Confirm Password"
                                    CssClass="block text-gray-700 font-medium mb-1" AssociatedControlID="txtConfirmPassword" />
                                <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password"
                                    CssClass="w-full border border-gray-300 rounded-lg px-3 py-2 focus:outline-none focus:ring-2 focus:ring-[#ff4444]"
                                    placeholder="Confirm new password"/>
                            </div>

                            <div class="flex justify-end space-x-3 pt-4">
                                <asp:Button ID="btnCancelChangePassword" runat="server" Text="Cancel"
                                    CssClass="px-4 py-2 bg-gray-300 text-gray-800 rounded-lg hover:bg-gray-400 transition duration-200"
                                    OnClientClick="closeChangePasswordModal(); return false;" />

                                <asp:Button ID="btnSaveChangePassword" runat="server" Text="Save Changes"
                                    CssClass="px-4 py-2 bg-[#ff4444] text-white rounded-lg hover:bg-red-600 transition duration-200"
                                    />
                            </div>
                        </asp:Panel>
                    </div>
                </div>


                <div id="help-support-content" class="hidden">
                    <h2 class="text-2xl font-semibold mb-6 text-gray-700">Get Assistance</h2>

                    <div class="grid grid-cols-1 md:grid-cols-3 gap-6 mb-10">
                        <a href="#"
                            class="block p-6 bg-white rounded-lg shadow-lg border border-gray-200 hover:shadow-xl transition duration-200 group">
                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 28 28"
                                class="h-8 w-8 text-[#ff4444] group-hover:text-red-700 mb-3" fill="none">
                                <g id="SVGRepo_iconCarrier">
                                    <path
                                        d="M13.2516 6.87651C14.0444 6.75402 14.8568 6.84761 15.5999 7.14788C16.3432 7.44821 16.9902 7.94457 17.4673 8.58519C17.9446 9.22605 18.2327 9.98569 18.2968 10.7804C18.3609 11.5751 18.1983 12.3706 17.8286 13.0782C17.4592 13.7856 16.8982 14.3762 16.2107 14.7872C16.0284 14.8961 15.8303 14.9983 15.6708 15.0806C15.625 15.1043 15.5824 15.1263 15.5442 15.1463C15.349 15.2489 15.2222 15.3239 15.1283 15.3977C15.0435 15.4642 15.007 15.5137 14.986 15.5549C14.9658 15.5948 14.9331 15.68 14.9331 15.856V17.1095C14.9331 17.4409 14.6644 17.7095 14.3331 17.7095H13.5331C13.2017 17.7095 12.9331 17.4409 12.9331 17.1095V15.856C12.9331 15.4142 13.0194 15.0103 13.203 14.6489C13.386 14.2887 13.6383 14.0247 13.8932 13.8246C14.1388 13.6317 14.4023 13.487 14.6141 13.3758C14.6794 13.3415 14.7392 13.3106 14.795 13.2818C14.9406 13.2066 15.0606 13.1445 15.1844 13.0705C15.5592 12.8465 15.8598 12.5278 16.0559 12.1523C16.2519 11.777 16.3369 11.3581 16.3033 10.9412C16.2696 10.5242 16.1183 10.1222 15.8633 9.77982C15.6081 9.43718 15.2584 9.16698 14.8506 9.00221C14.4427 8.83738 13.9947 8.78543 13.557 8.85306C13.1193 8.92069 12.7119 9.10473 12.3791 9.38198C12.2046 9.52735 12.0544 9.69522 11.9317 9.87962C11.7482 10.1555 11.4141 10.3322 11.0997 10.2275L10.3407 9.97467C10.0263 9.86996 9.8527 9.5276 10.0006 9.23107C10.2652 8.7007 10.6389 8.22871 11.0989 7.84542C11.7135 7.33335 12.4587 6.99902 13.2516 6.87651Z"
                                        fill="currentColor">
                                    </path>
                                    <path
                                        d="M13.1111 19.8763C13.1111 19.6002 13.335 19.3763 13.6111 19.3763H14.2587C14.5348 19.3763 14.7587 19.6002 14.7587 19.8763V20.5239C14.7587 20.8 14.5348 21.0239 14.2587 21.0239H13.6111C13.335 21.0239 13.1111 20.8 13.1111 20.5239V19.8763Z"
                                        fill="currentColor">
                                    </path>
                                    <path clip-rule="evenodd"
                                        d="M14 1C6.8203 1 1 6.8203 1 14C1 21.1797 6.8203 27 14 27C21.1797 27 27 21.1797 27 14C27 6.8203 21.1797 1 14 1ZM3 14C3 7.92487 7.92487 3 14 3C20.0751 3 25 7.92487 25 14C25 20.0751 20.0751 25 14 25C7.92487 25 3 20.0751 3 14Z"
                                        fill="currentColor" fill-rule="evenodd">
                                    </path>
                                </g>
                            </svg>

                            <h3 class="text-xl font-bold text-gray-800 mb-1">FAQs</h3>
                            <p class="text-sm text-gray-600">
                                Find quick answers to common booking, refund, and account
                            issues.
                            </p>
                        </a>

                        <a href="#"
                            class="block p-6 bg-white rounded-lg shadow-lg border border-gray-200 hover:shadow-xl transition duration-200 group">
                            <svg xmlns="http://www.w3.org/2000/svg"
                                class="h-8 w-8 text-[#ff4444] group-hover:text-red-700 mb-3" fill="none" viewBox="0 0 24 24"
                                stroke="currentColor" stroke-width="2">
                                <path stroke-linecap="round" stroke-linejoin="round"
                                    d="M17 8h2a2 2 0 012 2v6a2 2 0 01-2 2h-2v4l-4-4H9a1.994 1.994 0 01-1.414-.586m6.707-8.293A1 1 0 0014 9H6.5a1 1 0 00-.707 1.707L8 13.596v1.404a1 1 0 102 0v-1.404l1.293-1.293a1 1 0 000-1.414z" />
                            </svg>
                            <h3 class="text-xl font-bold text-gray-800 mb-1">Live Chat</h3>
                            <p class="text-sm text-gray-600">
                                Connect with an agent for immediate assistance during service
                            hours.
                            </p>
                        </a>

                        <a href="#"
                            class="block p-6 bg-white rounded-lg shadow-lg border border-gray-200 hover:shadow-xl transition duration-200 group">
                            <svg xmlns="http://www.w3.org/2000/svg"
                                class="h-8 w-8 text-[#ff4444] group-hover:text-red-700 mb-3" fill="none" viewBox="0 0 24 24"
                                stroke="currentColor" stroke-width="2">
                                <path stroke-linecap="round" stroke-linejoin="round"
                                    d="M3 8l7.89 5.26a2 2 0 002.22 0L21 8M5 19h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z" />
                            </svg>
                            <h3 class="text-xl font-bold text-gray-800 mb-1">Email Us</h3>
                            <p class="text-sm text-gray-600">Send us a detailed query. We aim to reply within 24 hours.</p>
                        </a>
                    </div>


                </div>
            </div>
        </div>

        <div id="loader" class="fixed inset-0 bg-white bg-opacity-75 flex items-center justify-center z-50 hidden">
            <div class="loader"></div>
        </div>
    </div>

    <script src="js/UserProfilePage.js" type="text/javascript"></script>
    <script type="text/javascript">
        document.addEventListener('DOMContentLoaded', () => {
            const container = document.getElementById('<%= profilePicContainer.ClientID %>');
            const fileInput = document.getElementById('<%= fuProfilePic.ClientID %>');
            const saveBtn = document.getElementById('<%= btnSaveProfilePic.ClientID %>');

            if (container && fileInput) {
                // Click on container opens file picker
                container.addEventListener('click', () => {
                    fileInput.click();
                });

                // Preview image after selection
                fileInput.addEventListener('change', (event) => {
                    const file = event.target.files[0];
                    if (file) {
                        const reader = new FileReader();
                        reader.onload = (e) => {
                            container.style.backgroundImage = `url(${e.target.result})`;
                            container.style.backgroundSize = 'cover';
                            container.style.backgroundPosition = 'center';
                            container.style.color = 'transparent';
                            container.innerText = ''; // remove initials

                            // Show save button
                            if (saveBtn) saveBtn.classList.remove('hidden');
                        };
                        reader.readAsDataURL(file);
                    }
                });
            }


        });
    </script>

</asp:Content>
