<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="profile.aspx.cs" Inherits="EntertainPro.profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>EntertainPro Profile</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script>
        // Tailwind applies only to elements inside this container
        tailwind.config = {
            important: '#tailwind-container'
        }
    </script>
    <style>
        /* Ensures the active navigation link is easily visible */
        .nav-active {
            font-weight: bold;
            border-left-width: 4px;
            border-color: white;
            padding-left: 0.75rem;
            padding-top: 0.25rem;
            padding-bottom: 0.25rem;
            margin-left: -1.5rem;
            transition: all 200ms ease-in-out;
        }

        /* Custom styles for the fixed-size ticket card */
        .ticket-card {
            width: 270px;
            height: 400px;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            position: relative;
            overflow: hidden;
            padding: 1.25rem;
        }

        /* Dashed divider for the ticket stub look */
        .dashed-divider {
            border: none;
            border-top: 2px dashed #e5e7eb;
            /* gray-200 */
            margin: 0.75rem 0;
            position: relative;
        }

        /* Enforce word break for long titles */
        .title-break {
            word-break: break-word;
            overflow-wrap: break-word;
        }

        /* ------------------------------------- */
        /* Custom Toggle Switch Styles (Crucial) */
        /* ------------------------------------- */

        /* Hide the default checkbox input */
        .toggle-checkbox {
            height: 0;
            width: 0;
            opacity: 0;
            position: absolute;
        }

        /* Style the toggle track/background */
        .toggle-label {
            display: flex;
            align-items: center;
            cursor: pointer;
            width: 48px;
            height: 24px;
            background: #ccc;
            border-radius: 9999px;
            position: relative;
            transition: background-color 0.2s;
        }

            /* Style the toggle circle/thumb */
            .toggle-label:after {
                content: '';
                position: absolute;
                top: 2px;
                left: 2px;
                width: 20px;
                height: 20px;
                background: white;
                border-radius: 90px;
                box-shadow: 0 0 4px rgba(0, 0, 0, 0.3);
                transition: transform 0.2s;
            }

        /* State when checkbox is checked (ON state) */
        .toggle-checkbox:checked + .toggle-label {
            background: #ff4444;
            /* The EntertainPro Red */
        }

            /* Move the toggle thumb to the right when checked */
            .toggle-checkbox:checked + .toggle-label:after {
                transform: translateX(24px);
            }

        /* Style for the input fields when in edit mode */
        .profile-input {
            background-color: #f7f7f7;
            border: 1px solid #e0e0e0;
            padding: 0.25rem 0.5rem;
            border-radius: 0.375rem;
            font-weight: 500;
            width: 100%;
            /* Make inputs the same width as the span text space */
            flex-grow: 1;
        }

        /* Make the profile display span also take up the available width */
        .profile-field-display {
            flex-grow: 1;
        }

        /* Custom Loader Styles */
        .loader {
            width: 48px;
            height: 48px;
            border-radius: 50%;
            position: relative;
            animation: rotate 1s linear infinite;
        }

            .loader::before, .loader::after {
                content: "";
                box-sizing: border-box;
                position: absolute;
                inset: 0px;
                border-radius: 50%;
                border: 5px solid #000000;
                animation: prixClipFix 2s linear infinite;
            }

            .loader::after {
                border-color: #FF3D00;
                animation: prixClipFix 2s linear infinite, rotate 0.5s linear infinite reverse;
                inset: 6px;
            }

        @keyframes rotate {
            0% {
                transform: rotate(0deg);
            }

            100% {
                transform: rotate(360deg);
            }
        }

        @keyframes prixClipFix {
            0% {
                clip-path: polygon(50% 50%, 0 0, 0 0, 0 0, 0 0, 0 0);
            }

            25% {
                clip-path: polygon(50% 50%, 0 0, 100% 0, 100% 0, 100% 0, 100% 0);
            }

            50% {
                clip-path: polygon(50% 50%, 0 0, 100% 0, 100% 100%, 100% 100%, 100% 100%);
            }

            75% {
                clip-path: polygon(50% 50%, 0 0, 100% 0, 100% 100%, 0 100%, 0 100%);
            }

            100% {
                clip-path: polygon(50% 50%, 0 0, 100% 0, 100% 100%, 0 100%, 0 0);
            }
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <iv id="tailwind-container">
        <div class="w-full bg-white shadow-2xl flex flex-col lg:flex-row overflow-hidden">

            <div
                class="lg:w-1/5 p-6 sm:p-8 bg-gradient-to-br from-[#ff4444] to-red-600 text-white flex flex-col justify-start space-y-8 min-h-screen">

                <div class="flex items-center space-x-3">
                    <div
                        class="w-8 h-8 rounded-full bg-red-100 flex items-center justify-center text-red-700 text-sm font-bold border-2 border-white flex-shrink-0">
                        RK
                    </div>
                    <div>
                        <span class="text-sm font-medium opacity-80 block leading-none">Hello,</span>
                        <span class="text-xl font-extrabold leading-tight tracking-tight">Rahul Kumar</span>
                    </div>
                </div>

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


                <div id="user-profile-content">

                    <div class="mb-8">
                        <h2 class="text-xl font-semibold mb-3">Our signature loyalty program</h2>
                        <p class="text-gray-600 leading-relaxed text-sm sm:text-base">
                            The program provides members exclusive access to special movie screenings, premieres as well as
                        meet-and-greet with stars!
                        <a href="#" class="text-[#ff4444] hover:text-red-600 font-medium ml-1">Know more</a>
                        </p>
                    </div>

                    <div class="text-right mb-6 relative">
                        <button id="edit-button"
                            class="text-[#ff4444] hover:text-red-600 font-medium flex items-center justify-end absolute top-0 right-0"
                            onclick="toggleEditMode()">
                            <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4 mr-1" fill="none" viewBox="0 0 24 24"
                                stroke="currentColor" stroke-width="2">
                                <path stroke-linecap="round" stroke-linejoin="round"
                                    d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-7 1l-2 2m4-4l2-2m-4 4l-2 2m-2-2l-2 2m4-4l-2 2" />
                                <path stroke-linecap="round" stroke-linejoin="round"
                                    d="M15.232 5.232l3.536 3.536m-2.036-5.036a2.5 2.5 0 113.536 3.536L6.5 21.036H3v-3.572L16.732 3.732z" />
                            </svg>
                            Edit
                        </button>
                        <button id="save-button"
                            class="hidden px-4 py-1 bg-[#ff4444] text-white font-medium rounded-lg hover:bg-red-600 transition duration-200 shadow-md"
                            onclick="toggleEditMode(true)">
                            Save Changes
                        </button>
                    </div>
                    <div class="flex items-center space-x-6 mb-8 mt-4 sm:mt-0">
                        <div
                            class="relative w-24 h-24 rounded-full bg-gray-200 flex items-center justify-center text-gray-500 text-5xl font-bold overflow-hidden border-2 border-gray-300">
                            <span class="absolute">RK</span>
                        </div>
                        <div>
                            <h2 class="text-2xl font-bold text-gray-900">Rahul Kumar</h2>
                            <p class="text-gray-600">Premium Member</p>
                            <button class="text-[#ff4444] hover:text-red-600 font-medium text-sm mt-2">
                                Change
                            Picture</button>
                        </div>
                    </div>

                    <div class="pt-6 sm:pt-4">
                        <div class="grid grid-cols-1 sm:grid-cols-2 gap-y-6 gap-x-12">

                            <div class="flex items-center space-x-3">
                                <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 text-gray-500" fill="none"
                                    viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                                    <path stroke-linecap="round" stroke-linejoin="round"
                                        d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z" />
                                </svg>
                                <span class="text-sm font-semibold text-gray-600 w-24 flex-shrink-0">First Name:</span>
                                <span class="profile-field-display font-medium" data-field="firstName">RAHUL</span>
                                <input type="text" data-field="firstName" value="RAHUL" class="profile-input hidden"
                                    title="firstName">
                            </div>

                            <div class="flex items-center space-x-3">
                                <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 text-gray-500" fill="none"
                                    viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                                    <path stroke-linecap="round" stroke-linejoin="round"
                                        d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z" />
                                </svg>
                                <span class="text-sm font-semibold text-gray-600 w-24 flex-shrink-0">Last Name:</span>
                                <span class="profile-field-display font-medium" data-field="lastName">KUMAR</span>
                                <input type="text" data-field="lastName" value="KUMAR" class="profile-input hidden"
                                    title="lastName">
                            </div>

                            <div class="flex items-center space-x-3">
                                <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 text-gray-500" fill="none"
                                    viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                                    <path stroke-linecap="round" stroke-linejoin="round"
                                        d="M3 8l7.89 5.26a2 2 0 002.22 0L21 8M5 19h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z" />
                                </svg>
                                <span class="text-sm font-semibold text-gray-600 w-24 flex-shrink-0">Email:</span>
                                <span class="font-medium truncate">rmahanta175@rku.ac.in</span>
                            </div>

                            <div class="flex items-center space-x-3">
                                <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 text-gray-500" fill="none"
                                    viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                                    <path stroke-linecap="round" stroke-linejoin="round"
                                        d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z" />
                                </svg>
                                <span class="text-sm font-semibold text-gray-600 w-24 flex-shrink-0">DOB:</span>
                                <span class="profile-field-display font-medium" data-field="dob">17/10/2025</span>
                                <input type="date" data-field="dob" value="2025-10-17" class="profile-input hidden"
                                    title="DOB">
                            </div>

                            <div class="flex items-center space-x-3">
                                <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 text-gray-500" fill="none"
                                    viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                                    <path stroke-linecap="round" stroke-linejoin="round"
                                        d="M3 5a2 2 0 012-2h3.28a1 1 0 01.948.684l1.498 4.493a1 1 0 01-.502 1.21l-2.257 1.13a11.042 11.042 0 005.516 5.516l1.13-2.257a1 1 0 011.21-.502l4.493 1.498a1 1 0 01.684.949V19a2 2 0 01-2 2h-1C9.716 21 3 14.284 3 6V5z" />
                                </svg>
                                <span class="text-sm font-semibold text-gray-600 w-24 flex-shrink-0">Mobile:</span>
                                <span class="profile-field-display font-medium" data-field="mobile">8287547221</span>
                                <input type="text" data-field="mobile" value="8287547221" class="profile-input hidden"
                                    title="Contact No">
                            </div>

                            <div class="flex items-center space-x-3">
                                <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 text-gray-500" fill="none"
                                    viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                                    <path stroke-linecap="round" stroke-linejoin="round"
                                        d="M10 6H5a2 2 0 00-2 2v9a2 2 0 002 2h14a2 2 0 002-2V8a2 2 0 00-2-2h-5m-4 0V5a2 2 0 114 0v1" />
                                    <path stroke-linecap="round" stroke-linejoin="round"
                                        d="M12 15v3m-3-3l-2 2m4 2h.01M16 15v3m3-3l2 2m-4 2h.01" />
                                </svg>
                                <span class="text-sm font-semibold text-gray-600 w-24 flex-shrink-0">Gender:</span>
                                <span class="profile-field-display font-medium text-gray-400 italic" data-field="gender">Add
                                Gender</span>
                                <select data-field="gender" class="profile-input hidden" title="Gender">
                                    <option value="Add Gender" selected>Select</option>
                                    <option value="Male">Male</option>
                                    <option value="Female">Female</option>
                                    <option value="Other">Other</option>
                                </select>
                            </div>
                        </div>
                    </div>
                </div>

                <div id="booking-history-content" class="hidden">
                    <div class="flex flex-wrap gap-6 justify-start">
                        <div
                            class="ticket-card bg-white rounded-xl shadow-xl border border-gray-200 font-sans flex-shrink-0">
                            <div class="flex-grow flex flex-col justify-start">
                                <div class="text-xs font-semibold text-[#ff4444] mb-1 uppercase tracking-wider">
                                    EntertainPro
                                Ticket
                                </div>
                                <h3 class="text-xl font-extrabold text-gray-900 leading-tight mb-2 title-break">Mission: Impossible - Dead Part
                                </h3>
                                <p class="text-sm text-gray-600 mb-4">English | Standard 2D | 2h 43m</p>

                                <div class="grid grid-cols-2 gap-y-3 text-sm">
                                    <div>
                                        <p class="text-xs font-semibold text-gray-500">DATE</p>
                                        <p class="font-bold">15 OCT</p>
                                    </div>
                                    <div>
                                        <p class="text-xs font-semibold text-gray-500">TIME</p>
                                        <p class="font-bold">10:30 AM</p>
                                    </div>
                                    <div>
                                        <p class="text-xs font-semibold text-gray-500">SCREEN</p>
                                        <p class="font-bold">Screen 3</p>
                                    </div>
                                    <div>
                                        <p class="text-xs font-semibold text-gray-500">SEATS</p>
                                        <p class="font-bold">H12, H13</p>
                                    </div>
                                </div>
                            </div>

                            <div class="dashed-divider"></div>

                            <div class="mt-auto text-center">
                                <p class="text-xs font-semibold text-gray-500 mb-1">Total Paid</p>
                                <p class="text-3xl font-extrabold text-[#ff4444] leading-none mb-3">₹850</p>
                                <p class="text-xs text-gray-500">Booking ID: EP20251015A</p>
                            </div>
                        </div>

                        <div
                            class="ticket-card bg-white rounded-xl shadow-xl border border-gray-200 font-sans flex-shrink-0">
                            <div class="flex-grow flex flex-col justify-start">
                                <div class="text-xs font-semibold text-[#ff4444] mb-1 uppercase tracking-wider">
                                    EntertainPro
                                Ticket
                                </div>
                                <h3 class="text-2xl font-extrabold text-gray-900 leading-tight mb-2 title-break">Jawan
                                </h3>
                                <p class="text-sm text-gray-600 mb-4">Hindi | IMAX 3D | 2h 45m</p>

                                <div class="grid grid-cols-2 gap-y-3 text-sm">
                                    <div>
                                        <p class="text-xs font-semibold text-gray-500">DATE</p>
                                        <p class="font-bold">21 SEP</p>
                                    </div>
                                    <div>
                                        <p class="text-xs font-semibold text-gray-500">TIME</p>
                                        <p class="font-bold">07:00 PM</p>
                                    </div>
                                    <div>
                                        <p class="text-xs font-semibold text-gray-500">SCREEN</p>
                                        <p class="font-bold">IMAX 1</p>
                                    </div>
                                    <div>
                                        <p class="text-xs font-semibold text-gray-500">SEATS</p>
                                        <p class="font-bold">D05</p>
                                    </div>
                                </div>
                            </div>

                            <div class="dashed-divider"></div>

                            <div class="mt-auto text-center">
                                <p class="text-xs font-semibold text-gray-500 mb-1">Total Paid</p>
                                <p class="text-3xl font-extrabold text-[#ff4444] leading-none mb-3">₹600</p>
                                <p class="text-xs text-gray-500">Booking ID: EP20250921B</p>
                            </div>
                        </div>

                        <div
                            class="ticket-card bg-gray-50 rounded-xl shadow-inner border border-gray-300 font-sans flex-shrink-0 opacity-80">
                            <div class="flex-grow flex flex-col justify-start">
                                <div class="text-xs font-semibold text-gray-400 mb-1 uppercase tracking-wider">
                                    Advance
                                Booking
                                </div>
                                <h3 class="text-xl font-extrabold text-gray-600 leading-tight mb-2 title-break">Upcoming Movie Title (Tentative)
                                </h3>
                                <p class="text-sm text-gray-500 mb-4 italic">Genre: Action-Fantasy</p>

                                <div class="grid grid-cols-2 gap-y-3 text-sm">
                                    <div>
                                        <p class="text-xs font-semibold text-gray-400">DATE</p>
                                        <p class="font-bold text-gray-600">01 NOV</p>
                                    </div>
                                    <div>
                                        <p class="text-xs font-semibold text-gray-400">TIME</p>
                                        <p class="font-bold text-gray-600">TBD</p>
                                    </div>
                                    <div>
                                        <p class="text-xs font-semibold text-gray-400">SCREEN</p>
                                        <p class="font-bold text-gray-600">Any Screen</p>
                                    </div>
                                    <div>
                                        <p class="text-xs font-semibold text-gray-400">SEATS</p>
                                        <p class="font-bold text-gray-600">Any Available</p>
                                    </div>
                                    <div class="col-span-2 mt-2">
                                        <p class="text-xs font-semibold text-gray-400">STATUS</p>
                                        <p class="font-bold text-yellow-600">Pending Release</p>
                                    </div>
                                </div>
                            </div>

                            <div class="dashed-divider border-gray-300"></div>

                            <div class="mt-auto text-center">
                                <p class="text-xs font-semibold text-gray-500 mb-1">Advance Amount</p>
                                <p class="text-3xl font-extrabold text-gray-500 leading-none mb-3">₹200</p>
                                <p class="text-xs text-gray-400">Booking ID: EP20251101C</p>
                            </div>
                        </div>

                    </div>

                    <div class="w-full text-center pt-8">
                        <a href="#" class="text-[#ff4444] hover:text-red-600 font-semibold">View All History →</a>
                    </div>
                </div>

                <div id="settings-content" class="hidden">
                    <h2 class="text-2xl font-semibold mb-6 text-gray-700">Account and Privacy Settings</h2>

                    <div class="space-y-6">
                        <div class="p-6 bg-gray-50 rounded-lg shadow-sm border border-gray-200">
                            <h3 class="text-lg font-bold text-gray-800 mb-3">Notification</h3>
                            <p class="text-sm text-gray-600 mb-4">Control which promotional updates you receive.</p>

                            <div class="space-y-4">
                                <div class="flex items-center justify-between">
                                    <span class="text-base font-medium text-gray-700">Receive promotional emails</span>
                                    <label for="email-toggle" class="relative">
                                        <input type="checkbox" id="email-toggle" class="toggle-checkbox" checked
                                            title="Email message">
                                        <div class="toggle-label"></div>
                                    </label>
                                </div>

                                <div class="flex items-center justify-between">
                                    <span class="text-base font-medium text-gray-700">Receive promotional Whatsapp
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
                                You will be logged out of all devices after changing your
                            password.
                            </p>
                            <button
                                class="px-4 py-2 bg-[#ff4444] text-white font-medium rounded-lg hover:bg-red-600 transition duration-200 shadow-md">
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
                    <div class="p-6 bg-gray-50 rounded-lg shadow-lg border border-gray-200">
                        <h3 class="text-2xl font-bold text-gray-800 mb-4">Submit a New Request</h3>
                        <p class="text-sm text-gray-600 mb-6">
                            Can't find an answer? Use the form below for issues requiring
                        a booking ID or agent investigation.
                        </p>

                        <form action="#" method="POST" class="space-y-4">
                            <div>
                                <label for="issue-type" class="block text-sm font-medium text-gray-700 mb-1">
                                    Issue Type
                                <span class="text-[#ff4444]">*</span></label>
                                <select id="issue-type" name="issue-type" required
                                    class="mt-1 block w-full pl-3 pr-10 py-2 text-base border-gray-300 focus:outline-none focus:ring-[#ff4444] focus:border-[#ff4444] sm:text-sm rounded-md shadow-sm">
                                    <option>Select a category</option>
                                    <option>Cancellation/Refund Issue</option>
                                    <option>Payment Charged, Ticket Not Received</option>
                                    <option>Technical Bug or Website Error</option>
                                    <option>Loyalty Program Inquiry</option>
                                    <option>Other General Question</option>
                                </select>
                            </div>

                            <div>
                                <label for="booking-id" class="block text-sm font-medium text-gray-700 mb-1">
                                    Booking/Ticket
                                ID (If applicable)</label>
                                <input type="text" id="booking-id" name="booking-id" placeholder="EP20251015A"
                                    class="mt-1 block w-full border border-gray-300 rounded-md shadow-sm py-2 px-3 focus:outline-none focus:ring-[#ff4444] focus:border-[#ff4444] sm:text-sm">
                            </div>

                            <div>
                                <label for="description" class="block text-sm font-medium text-gray-700 mb-1">
                                    Detailed
                                Description <span class="text-[#ff4444]">*</span></label>
                                <textarea id="description" name="description" rows="4" required
                                    class="mt-1 block w-full border border-gray-300 rounded-md shadow-sm py-2 px-3 focus:outline-none focus:ring-[#ff4444] focus:border-[#ff4444] sm:text-sm"
                                    placeholder="Describe your issue in detail, including dates and times."></textarea>
                            </div>

                            <div class="pt-2">
                                <button type="submit"
                                    class="w-full justify-center inline-flex items-center px-4 py-2 border border-transparent text-base font-medium rounded-md shadow-sm text-white bg-[#ff4444] hover:bg-red-600 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-[#ff4444] transition duration-200">
                                    Submit Request
                                </button>
                            </div>
                        </form>
                    </div>

                </div>
            </div>
        </div>
    
    <!-- Loader Overlay -->
    <div id="loader" class="fixed inset-0 bg-white bg-opacity-75 flex items-center justify-center z-50 hidden">
        <div class="loader"></div>
    </div>
    </div>
    <script>
        // Loader functions
        function showLoader() {
            document.getElementById('loader').classList.remove('hidden');
        }

        function hideLoader() {
            document.getElementById('loader').classList.add('hidden');
        }

        /**
         * Function to toggle between different content sections
         * @param {string} contentId - 'user-profile', 'booking-history', 'settings', or 'help-support'
         */
        function showContent(contentId) {
            showLoader();
            setTimeout(() => {
                const contentElements = {
                    'user-profile': document.getElementById('user-profile-content'),
                    'booking-history': document.getElementById('booking-history-content'),
                    'settings': document.getElementById('settings-content'),
                    'help-support': document.getElementById('help-support-content')
                };

                const linkElements = {
                    'user-profile': document.getElementById('profile-link'),
                    'booking-history': document.getElementById('history-link'),
                    'settings': document.getElementById('settings-link'),
                    'help-support': document.getElementById('support-link')
                };

                const activeClass = 'nav-active';
                const inactiveClasses = ['text-red-100', 'hover:text-white', 'pl-3', 'py-1'];

                for (const id in contentElements) {
                    if (id === contentId) {
                        contentElements[id].classList.remove('hidden');
                        linkElements[id].classList.add(activeClass, 'text-white');
                        linkElements[id].classList.remove(...inactiveClasses);
                    } else {
                        contentElements[id].classList.add('hidden');
                        linkElements[id].classList.remove(activeClass, 'text-white');
                        linkElements[id].classList.add(...inactiveClasses);

                        // If switching away from profile, ensure edit mode is turned off
                        if (id !== 'user-profile' && document.getElementById('save-button').classList.contains('hidden') === false) {
                            toggleEditMode(true);
                        }
                    }
                }
                hideLoader();
            }, 1000);
        }

        /**
         * Toggles the display mode of profile fields between text (span) and input fields.
         * @param {boolean} isSaving - True if the user clicked Save, false if they clicked Edit.
         */
        function toggleEditMode(isSaving = false) {
            const displayElements = document.querySelectorAll('.profile-field-display');
            const inputElements = document.querySelectorAll('.profile-input');
            const editButton = document.getElementById('edit-button');
            const saveButton = document.getElementById('save-button');

            if (isSaving) {
                // 1. Logic for SAVING (Switching from Input back to Span)

                // Update the visible span text with the new input values
                inputElements.forEach(input => {
                    const fieldName = input.getAttribute('data-field');
                    const displaySpan = document.querySelector(`.profile-field-display[data-field="${fieldName}"]`);

                    if (displaySpan) {
                        if (input.tagName === 'SELECT') {
                            // Handle select (dropdown)
                            displaySpan.textContent = input.options[input.selectedIndex].text;
                            if (input.value !== 'Add Gender' && input.value !== 'Select') {
                                displaySpan.classList.remove('text-gray-400', 'italic');
                                displaySpan.classList.add('text-gray-800');
                            } else {
                                displaySpan.classList.add('text-gray-400', 'italic');
                                displaySpan.classList.remove('text-gray-800');
                            }
                        } else if (input.type === 'date') {
                            // Handle date input
                            const dateValue = input.value;
                            if (dateValue) {
                                // Convert YYYY-MM-DD to DD/MM/YYYY for display (simple format conversion)
                                const parts = dateValue.split('-');
                                displaySpan.textContent = `${parts[2]}/${parts[1]}/${parts[0]}`;
                            }
                        } else {
                            // Handle standard text input
                            // Use input value if it exists, otherwise keep old text
                            displaySpan.textContent = input.value || displaySpan.textContent;
                        }
                    }
                });

                // Show spans, hide inputs
                displayElements.forEach(el => el.classList.remove('hidden'));
                inputElements.forEach(el => el.classList.add('hidden'));

                // Switch buttons
                saveButton.classList.add('hidden');
                editButton.classList.remove('hidden');

                // In a real app, you would send this data to a server here.
                alert("Profile Updated!");

            } else {
                // 2. Logic for EDITING (Switching from Span to Input)

                // Show inputs, hide spans
                displayElements.forEach(el => el.classList.add('hidden'));
                inputElements.forEach(el => el.classList.remove('hidden'));

                // Switch buttons
                editButton.classList.add('hidden');
                saveButton.classList.remove('hidden');
            }
        }

        // Initialize the view when the page loads
        document.addEventListener('DOMContentLoaded', () => {
            showContent('user-profile');
        });
    </script>

</asp:Content>
