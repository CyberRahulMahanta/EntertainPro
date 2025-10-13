<%@ Page Title="" Language="C#" MasterPageFile="~/AdminSite.Master" AutoEventWireup="true" CodeFile="AdminSettings.aspx.cs" Inherits="EntertainPro.AdminSettings" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <main class="flex-1 p-6 md:p-8">
        <div class="mb-8">
            <h1 class="text-3xl md:text-4xl font-extrabold text-gray-900 mb-4 flex items-center gap-3">
                <!-- Star/Gear Icon SVG -->
                <svg class="w-10 h-10 text-red-500 animate-bounce" xmlns="http://www.w3.org/2000/svg" fill="currentColor"
                    viewBox="0 0 1024 1024">
                    <path d="M600.704 64a32 32 0 0 1 30.464 22.208l35.2 109.376c14.784 7.232 28.928 15.36 42.432 24.512l112.384-24.192a32 32 0 0 1 34.432 15.36L944.32 364.8a32 32 0 0 1-4.032 37.504l-77.12 85.12a357.12 357.12 0 0 1 0 49.024l77.12 85.248a32 32 0 0 1 4.032 37.504l-88.704 153.6a32 32 0 0 1-34.432 15.296L708.8 803.904c-13.44 9.088-27.648 17.28-42.368 24.512l-35.264 109.376A32 32 0 0 1 600.704 960H423.296a32 32 0 0 1-30.464-22.208L357.696 828.48a351.616 351.616 0 0 1-42.56-24.64l-112.32 24.256a32 32 0 0 1-34.432-15.36L79.68 659.2a32 32 0 0 1 4.032-37.504l77.12-85.248a357.12 357.12 0 0 1 0-48.896l-77.12-85.248A32 32 0 0 1 79.68 364.8l88.704-153.6a32 32 0 0 1 34.432-15.296l112.32 24.256c13.568-9.152 27.776-17.408 42.56-24.64l35.2-109.312A32 32 0 0 1 423.232 64H600.64zM512 320a192 192 0 1 1 0 384 192 192 0 0 1 0-384z" />
                </svg>

                <span class="bg-gradient-to-r from-red-500 via-pink-500 to-purple-500 bg-clip-text text-transparent">Settings
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
