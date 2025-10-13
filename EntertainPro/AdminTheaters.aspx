<%@ Page Title="" Language="C#" MasterPageFile="~/AdminSite.Master" AutoEventWireup="true" CodeFile="AdminTheaters.aspx.cs" Inherits="EntertainPro.AdminTheaters" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <main class="flex-1 p-6 md:p-8">
        <div class="mb-8">
            <h1 class="text-3xl md:text-4xl font-extrabold text-gray-900 mb-4 flex items-center gap-3">
                <!-- Theater / Cinema Icon -->
                <svg class="w-10 h-10 text-red-500 animate-bounce" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 878.993 878.993" fill="currentColor">
                    <g>
                        <path d="M0,803.599v46.252h219.496v-46.252c0-31.548-13.316-59.981-34.628-80.001c-20.546,18.897-47.036,29.253-75.12,29.253 c-28.085,0-54.574-10.356-75.12-29.253C13.316,743.618,0,772.052,0,803.599z"></path>
                        <path d="M329.748,803.599v46.252h219.496v-46.252c0-31.548-13.316-59.981-34.628-80.001c-20.546,18.897-47.036,29.253-75.12,29.253 c-28.084,0-54.574-10.356-75.12-29.253C343.064,743.618,329.748,772.052,329.748,803.599z"></path>
                        <path d="M844.365,723.598c-20.546,18.897-47.036,29.253-75.12,29.253c-28.085,0-54.574-10.356-75.12-29.253 c-21.312,20.02-34.628,48.454-34.628,80.001v46.252h219.496v-46.252C878.993,772.052,865.677,743.618,844.365,723.598z"></path>
                        <path d="M0,29.588v515.101c85.009-18.819,249.504-31.575,438.496-31.575c190.485,0,356.085,12.958,440.496,32.022V29.141 c-84.411,19.064-250.011,32.022-440.496,32.022C249.504,61.163,85.009,48.408,0,29.588z"></path>
                        <path d="M65.065,703.335c12.549,9.122,27.982,14.516,44.683,14.516s32.134-5.394,44.683-14.516 c19.029-13.832,31.412-36.254,31.412-61.579c0-42.026-34.069-76.095-76.095-76.095s-76.095,34.069-76.095,76.095 C33.653,667.081,46.035,689.503,65.065,703.335z"></path>
                        <path d="M394.813,703.335c12.549,9.122,27.982,14.516,44.683,14.516s32.134-5.394,44.683-14.516 c19.029-13.832,31.412-36.254,31.412-61.579c0-42.026-34.069-76.095-76.096-76.095c-42.026,0-76.095,34.069-76.095,76.095 C363.401,667.081,375.783,689.503,394.813,703.335z"></path>
                        <path d="M724.561,703.335c12.549,9.122,27.982,14.516,44.683,14.516c16.701,0,32.134-5.394,44.683-14.516 c19.029-13.832,31.412-36.254,31.412-61.579c0-42.026-34.069-76.095-76.096-76.095s-76.096,34.069-76.096,76.095 C693.149,667.081,705.532,689.503,724.561,703.335z"></path>
                    </g>
                </svg>

                <span class="bg-gradient-to-r from-red-500 via-pink-500 to-purple-500 bg-clip-text text-transparent">Theaters
                </span>
            </h1>

            <p class="text-gray-500 text-sm md:text-base">
                Manage your theater halls and seating arrangements.
            </p>
        </div>


        <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
            <div class="bg-white rounded-xl shadow-sm border border-slate-200 p-6">
                <div class="flex items-center justify-between mb-4">
                    <h3 class="text-lg font-semibold">Theater Hall 1</h3>
                    <span
                        class="inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium bg-green-100 text-green-800">Active</span>
                </div>
                <div class="space-y-2 text-sm text-slate-600">
                    <p><span class="font-medium">Capacity:</span> 150 seats</p>
                    <p><span class="font-medium">Screen Type:</span> IMAX</p>
                    <p><span class="font-medium">Sound System:</span> Dolby Atmos</p>
                    <p><span class="font-medium">Current Movie:</span> Starlight Rebellion</p>
                </div>
                <button
                    class="mt-4 bg-red-600 text-white hover:bg-red-700 transition-colors rounded-lg px-4 py-2 text-sm font-semibold w-full">
                    Manage</button>
            </div>

            <div class="bg-white rounded-xl shadow-sm border border-slate-200 p-6">
                <div class="flex items-center justify-between mb-4">
                    <h3 class="text-lg font-semibold">Theater Hall 2</h3>
                    <span
                        class="inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium bg-green-100 text-green-800">Active</span>
                </div>
                <div class="space-y-2 text-sm text-slate-600">
                    <p><span class="font-medium">Capacity:</span> 120 seats</p>
                    <p><span class="font-medium">Screen Type:</span> Standard</p>
                    <p><span class="font-medium">Sound System:</span> 7.1 Surround</p>
                    <p><span class="font-medium">Current Movie:</span> Ocean's Mystery</p>
                </div>
                <button
                    class="mt-4 bg-red-600 text-white hover:bg-red-700 transition-colors rounded-lg px-4 py-2 text-sm font-semibold w-full">
                    Manage</button>
            </div>
        </div>
    </main>
</asp:Content>
