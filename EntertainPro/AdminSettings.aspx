<%@ Page Title="" Language="C#" MasterPageFile="~/AdminSite.Master" AutoEventWireup="true" CodeFile="AdminSettings.aspx.cs" Inherits="EntertainPro.AdminSettings" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <main class="flex-1 p-6 md:p-8">
        <div class="mb-8">
            <h1 class="text-3xl md:text-4xl font-extrabold text-gray-900 mb-4 flex items-center gap-3">
                <!-- New Gear Icon SVG with same color + bounce animation -->
                <svg class="w-10 h-10 text-red-500 animate-bounce" viewBox="0 0 24 24" fill="none"
                    xmlns="http://www.w3.org/2000/svg">
                    <g id="style=linear">
                        <g id="setting">
                            <path d="M12 15C13.6569 15 15 13.6569 15 12C15 10.3431 13.6569 9 12 9C10.3431 9 9 10.3431 9 12C9 13.6569 10.3431 15 12 15Z"
                                stroke="currentColor" stroke-width="1.5" stroke-miterlimit="10" stroke-linecap="round"
                                stroke-linejoin="round">
                            </path>
                            <path
                                d="M2 12.88V11.12C2 10.08 2.85 9.22 3.9 9.22C5.71 9.22 6.45 7.94 5.54 6.37C5.02 5.47 5.33 4.3 6.24 3.78L7.97 2.79C8.76 2.32 9.78 2.6 10.25 3.39L10.36 3.58C11.26 5.15 12.74 5.15 13.65 3.58L13.76 3.39C14.23 2.6 15.25 2.32 16.04 2.79L17.77 3.78C18.68 4.3 18.99 5.47 18.47 6.37C17.56 7.94 18.3 9.22 20.11 9.22C21.15 9.22 22.01 10.07 22.01 11.12V12.88C22.01 13.92 21.16 14.78 20.11 14.78C18.3 14.78 17.56 16.06 18.47 17.63C18.99 18.54 18.68 19.7 17.77 20.22L16.04 21.21C15.25 21.68 14.23 21.4 13.76 20.61L13.65 20.42C12.75 18.85 11.27 18.85 10.36 20.42L10.25 20.61C9.78 21.4 8.76 21.68 7.97 21.21L6.24 20.22C5.33 19.7 5.02 18.53 5.54 17.63C6.45 16.06 5.71 14.78 3.9 14.78C2.85 14.78 2 13.92 2 12.88Z"
                                stroke="currentColor" stroke-width="1.5" stroke-miterlimit="10" stroke-linecap="round"
                                stroke-linejoin="round">
                            </path>
                        </g>
                    </g>
                </svg>

                <span
                    class="bg-gradient-to-r from-red-500 via-pink-500 to-purple-500 bg-clip-text text-transparent">Settings
                </span>
            </h1>

            <p class="text-gray-500 text-sm md:text-base">
                Configure your application preferences and system settings.
            </p>
        </div>
        <div class="grid grid-cols-1 lg:grid-cols-2 gap-8">
            <div class="bg-white rounded-xl shadow-sm border border-slate-200 p-6">
                <h3 class="text-lg font-semibold mb-4">General Settings</h3>
                <div class="space-y-4">
                    <div>
                        <label class="block text-sm font-medium mb-1">Theater Name</label>
                        <input type="text" value="EntertainPro Cinema" title="Theater Name"
                            class="w-full bg-slate-100 border-transparent rounded-lg px-4 py-2 focus:ring-2 focus:ring-red-500 focus:outline-none">
                    </div>
                    <div>
                        <label class="block text-sm font-medium mb-1">Contact Email</label>
                        <input type="email" value="admin@entertainpro.com" title="Contact Email"
                            class="w-full bg-slate-100 border-transparent rounded-lg px-4 py-2 focus:ring-2 focus:ring-red-500 focus:outline-none">
                    </div>
                    <div>
                        <label class="block text-sm font-medium mb-1">Phone Number</label>
                        <input type="tel" value="+1 (555) 123-4567" title="Phone Number"
                            class="w-full bg-slate-100 border-transparent rounded-lg px-4 py-2 focus:ring-2 focus:ring-red-500 focus:outline-none">
                    </div>
                </div>
            </div>

            <div class="bg-white rounded-xl shadow-sm border border-slate-200 p-6">
                <h3 class="text-lg font-semibold mb-4">Pricing Settings</h3>
                <div class="space-y-4">
                    <div>
                        <label class="block text-sm font-medium mb-1">Standard Ticket Price</label>
                        <input type="number" value="12.00" step="0.01" title="Standard Ticket Price"
                            class="w-full bg-slate-100 border-transparent rounded-lg px-4 py-2 focus:ring-2 focus:ring-red-500 focus:outline-none">
                    </div>
                    <div>
                        <label class="block text-sm font-medium mb-1">Premium Ticket Price</label>
                        <input type="number" value="15.00" step="0.01" title="Premium Ticket Price"
                            class="w-full bg-slate-100 border-transparent rounded-lg px-4 py-2 focus:ring-2 focus:ring-red-500 focus:outline-none">
                    </div>
                    <div>
                        <label class="block text-sm font-medium mb-1">Child Discount (%)</label>
                        <input type="number" value="20" title="Child Discount"
                            class="w-full bg-slate-100 border-transparent rounded-lg px-4 py-2 focus:ring-2 focus:ring-red-500 focus:outline-none">
                    </div>
                </div>
            </div>
        </div>

        <div class="mt-8 flex justify-end">
            <button
                class="bg-red-600 text-white hover:bg-red-700 transition-colors rounded-lg px-6 py-3 font-semibold">
                Save Settings</button>
        </div>
    </main>
</asp:Content>
