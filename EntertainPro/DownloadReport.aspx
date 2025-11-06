<%@ Page Title="Filtered Report" Language="C#" MasterPageFile="~/AdminSite.Master" AutoEventWireup="true" CodeBehind="DownloadReport.aspx.cs" Inherits="EntertainPro.DownloadReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- Tailwind CSS CDN -->
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet" />
    <style>
        :root {
            --primary-color: rgb(255, 68, 68);
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="min-h-screen flex flex-col items-center justify-center bg-gradient-to-br from-gray-50 via-white to-gray-100 py-10 px-4">
        
        <!-- Main Card -->
        <div class="w-full max-w-6xl bg-white rounded-2xl shadow-2xl border border-gray-200 p-8 transform transition-all duration-300 hover:scale-[1.01]">
            
            <!-- Header -->
            <div class="text-center mb-8">
                <h1 class="text-3xl font-extrabold mb-2" style="color: var(--primary-color);">
                    🎟️ Filtered Report Preview
                </h1>
                <p class="text-gray-500 text-sm">View and download your filtered event data in a beautifully formatted PDF.</p>
            </div>

            <!-- Info Label -->
            <div class="text-center mb-6">
                <asp:Label ID="lblInfo" runat="server" CssClass="font-medium text-lg" style="color: var(--primary-color);"></asp:Label>
            </div>

            <!-- GridView Section -->
            <div class="overflow-x-auto rounded-lg border border-gray-200 shadow-md">
                <asp:GridView ID="gvReportData" runat="server" AutoGenerateColumns="true"
                    CssClass="min-w-full border-collapse text-sm text-gray-700 text-center">
                    <HeaderStyle CssClass="text-white font-semibold" BackColor="#FF4444" />
                    <RowStyle CssClass="bg-white hover:bg-red-50 transition-colors duration-150 border-b border-gray-200" />
                    <AlternatingRowStyle CssClass="bg-gray-50 hover:bg-red-50 transition-colors duration-150 border-b border-gray-200" />
                </asp:GridView>
            </div>

            <!-- Download Button -->
            <div class="text-center mt-8">
                <asp:Button ID="btnDownloadCrystal" runat="server" Text="⬇️ Download as PDF"
                    CssClass="px-6 py-3 font-semibold rounded-full shadow-md transition duration-300 hover:shadow-lg text-white"
                    style="background-color: var(--primary-color);"
                    OnClick="btnDownloadCrystal_Click" />
            </div>

            <!-- Footer -->
            <div class="text-center mt-10 text-sm text-gray-400">
                <p>© <%= DateTime.Now.Year %> <span style="color: var(--primary-color);">EntertainPro</span>. All rights reserved.</p>
            </div>

        </div>
    </div>
</asp:Content>
