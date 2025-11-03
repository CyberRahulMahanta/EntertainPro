<%@ Page Title="" Language="C#" MasterPageFile="~/AdminSite.Master" AutoEventWireup="true" CodeFile="AdminTheaters.aspx.cs" Inherits="EntertainPro.AdminTheaters" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <main class="flex-1 p-6 md:p-8">
        <div class="mb-8">
            <div class="flex items-center justify-between">
                <h1 class="text-3xl md:text-4xl font-extrabold text-gray-900 mb-4 flex items-center gap-3">
                    <svg class="w-10 h-10 text-red-500 animate-bounce" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 878.993 878.993" fill="currentColor">
                        <g>
                            <path d="M0,803.599v46.252h219.496v-46.252c0-31.548-13.316-59.981-34.628-80.001c-20.546,18.897-47.036,29.253-75.12,29.253
                        c-28.085,0-54.574-10.356-75.12-29.253C13.316,743.618,0,772.052,0,803.599z">
                            </path>
                            <path d="M329.748,803.599v46.252h219.496v-46.252c0-31.548-13.316-59.981-34.628-80.001c-20.546,18.897-47.036,29.253-75.12,29.253
                        c-28.084,0-54.574-10.356-75.12-29.253C343.064,743.618,329.748,772.052,329.748,803.599z">
                            </path>
                            <path d="M844.365,723.598c-20.546,18.897-47.036,29.253-75.12,29.253c-28.085,0-54.574-10.356-75.12-29.253
                        c-21.312,20.02-34.628,48.454-34.628,80.001v46.252h219.496v-46.252C878.993,772.052,865.677,743.618,844.365,723.598z">
                            </path>
                            <path d="M0,29.588v515.101c85.009-18.819,249.504-31.575,438.496-31.575c190.485,0,356.085,12.958,440.496,32.022V29.141
                        c-84.411,19.064-250.011,32.022-440.496,32.022C249.504,61.163,85.009,48.408,0,29.588z">
                            </path>
                            <path d="M65.065,703.335c12.549,9.122,27.982,14.516,44.683,14.516s32.134-5.394,44.683-14.516
                        c19.029-13.832,31.412-36.254,31.412-61.579c0-42.026-34.069-76.095-76.095-76.095s-76.095,34.069-76.095,76.095
                        C33.653,667.081,46.035,689.503,65.065,703.335z">
                            </path>
                            <path d="M394.813,703.335c12.549,9.122,27.982,14.516,44.683,14.516s32.134-5.394,44.683-14.516
                        c19.029-13.832,31.412-36.254,31.412-61.579c0-42.026-34.069-76.095-76.096-76.095c-42.026,0-76.095,34.069-76.095,76.095
                        C363.401,667.081,375.783,689.503,394.813,703.335z">
                            </path>
                            <path d="M724.561,703.335c12.549,9.122,27.982,14.516,44.683,14.516c16.701,0,32.134-5.394,44.683-14.516
                        c19.029-13.832,31.412-36.254,31.412-61.579c0-42.026-34.069-76.095-76.096-76.095s-76.096,34.069-76.096,76.095
                        C693.149,667.081,705.532,689.503,724.561,703.335z">
                            </path>
                        </g>
                    </svg>

                    <span class="bg-gradient-to-r from-red-500 via-pink-500 to-purple-500 bg-clip-text text-transparent">Theater Screens
                    </span>
                </h1>

                <!-- Add Screen Button -->
                <button type="button" id="openModalBtn" class="bg-red-500 hover:bg-red-600 text-white font-semibold px-5 py-2.5 rounded-xl shadow-md transition-all duration-200">
                    + Add Screen
                </button>
            </div>

            <p class="text-gray-500 text-sm md:text-base">
                Manage your theater screens and seating arrangements.
            </p>
        </div>


        <div class="mb-6 flex flex-col sm:flex-row gap-4">
            <input type="text" id="searchInput" onkeyup="filterScreens()" placeholder="Search by Screen Name or Movie..."
                class="flex-1 p-3 border border-slate-300 rounded-lg shadow-sm focus:ring focus:ring-red-500 focus:border-red-500 transition duration-150" />

            <select id="typeFilter" onchange="filterScreens()"
                class="p-3 border border-slate-300 rounded-lg shadow-sm focus:ring-red-500 focus:border-red-500 bg-white">
                <option value="All">Filter by Type: All</option>
                <option value="Standard">Standard</option>
                <option value="IMAX">IMAX</option>
                <option value="3D">3D</option>
                <option value="VIP">VIP</option>
                <option value="DolbyCinema">DolbyCinema</option>
            </select>
        </div>
        <div id="screensContainer" class="grid grid-cols-1 md:grid-cols-2 gap-6">
            <asp:Repeater ID="rptScreens" runat="server">
                <ItemTemplate>

                    <div class="screen-item bg-white rounded-2xl shadow-md border border-slate-200 p-6 hover:shadow-lg transition-all duration-300"
                        data-screen-type="<%# Eval("ScreenType") %>">

                        <div class="flex items-center justify-between mb-4">
                            <div class="flex items-center gap-2">
                                <svg class="w-7 h-7 text-red-600" viewBox="0 0 512 512" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                    <path d="M443.724,166.599c27.038-2.293,47.087-26.07,44.786-53.125c-2.292-27.038-26.078-47.087-53.115-44.795
                c-27.038,2.301-47.078,26.088-44.776,53.124C392.91,148.85,416.677,168.9,443.724,166.599z">
                                    </path>
                                    <path d="M431.752,346.544l30.541-114.485c5.068-19.305-6.466-39.075-25.78-44.144
                c-19.304-5.077-39.075,6.448-44.152,25.771v-0.018L365.052,315.64l-78.755-13.276c-17.218-4.304-34.696,5.786-39.578,22.864
                l-33.317,133.445c-3.82,13.342,3.913,27.28,17.274,31.1c13.37,3.81,27.298-3.923,31.128-17.283l39.392-98.638l61.286,16.155
                C398.863,400.125,421.633,382.927,431.752,346.544z">
                                    </path>
                                    <path d="M498.349,286.311c-10.1-2.999-20.721,2.749-23.722,12.858l-27.876,93.848
                c-2.096,6.606-4.536,11.777-7.146,15.746c-3.987,5.944-8.002,9.373-13.854,12.093c-5.842,2.664-14.031,4.379-25.416,4.37
                c-3.009,0.008-6.215-0.113-9.634-0.355l-54.009-3.363c-10.519-0.661-19.575,7.341-20.227,17.861
                c-0.662,10.518,7.342,19.574,17.86,20.226l53.73,3.345c4.211,0.298,8.31,0.448,12.28,0.456c10.072-0.009,19.5-0.988,28.369-3.289
                c13.268-3.392,25.315-10.127,34.501-19.892c9.251-9.736,15.531-21.885,19.91-35.609l0.074-0.214l28.015-94.362
                C514.206,299.923,508.447,289.302,498.349,286.311z">
                                    </path>
                                    <path d="M248.974,81.219L0,21.256v15.14v281.228l248.974-59.962V81.219z M225.123,238.87L23.851,287.355V51.536
                l201.272,48.466V238.87z">
                                    </path>
                                    <polygon points="204.989,115.189 47.991,84.937 47.991,253.953 204.989,223.692 "></polygon>
                                </svg>
                                <h3 class="screen-name text-xl font-semibold text-slate-800"><%# Eval("ScreenName") %></h3>
                            </div>
                            <div class="flex items-center gap-2">
                                <asp:LinkButton
                                    ID="btnDelete"
                                    runat="server"
                                    CommandName="DeleteScreen"
                                    CommandArgument='<%# Eval("ScreenID") %>'
                                    CssClass="p-2 rounded-full bg-red-100 hover:bg-red-200 transition"
                                    UseSubmitBehavior="false"
                                    OnClientClick='<%# "openDeleteModal(\"" + Eval("ScreenID") + "\"); return false;" %>'>
    <svg viewBox="0 0 1024 1024" fill="#dc2626" class="w-4 h-4" xmlns="http://www.w3.org/2000/svg">
        <path d="M32 241.6c-11.2 0-20-8.8-20-20s8.8-20 20-20l940 1.6c11.2 0 20 8.8 20 20s-8.8 20-20 20L32 241.6zM186.4 282.4c0-11.2 8.8-20 20-20s20 8.8 20 20v688.8l585.6-6.4V289.6c0-11.2 8.8-20 20-20s20 8.8 20 20v716.8l-666.4 7.2V282.4z"></path>
        <path d="M682.4 867.2c-11.2 0-20-8.8-20-20V372c0-11.2 8.8-20 20-20s20 8.8 20 20v475.2c0.8 11.2-8.8 20-20 20zM367.2 867.2c-11.2 0-20-8.8-20-20V372c0-11.2 8.8-20 20-20s20 8.8 20 20v475.2c0.8 11.2-8.8 20-20 20zM524.8 867.2c-11.2 0-20-8.8-20-20V372c0-11.2 8.8-20 20-20s20 8.8 20 20v475.2c0.8 11.2-8.8 20-20 20zM655.2 213.6v-48.8c0-17.6-14.4-32-32-32H418.4c-18.4 0-32 14.4-32 32.8V208h-40v-42.4c0-40 32.8-72.8 72.8-72.8H624c40 0 72.8 32.8 72.8 72.8v48.8h-41.6z"></path>
    </svg>
                                </asp:LinkButton>




                                <span class="screen-type text-xs bg-blue-100 text-blue-700 font-medium px-3 py-1 rounded-full">
                                    <%# Eval("ScreenType") %>
                                </span>
                            </div>
                        </div>

                        <div class="space-y-3 text-sm text-slate-600">
                            <div class="flex justify-between">
                                <span class="font-medium text-slate-700">Capacity:</span>
                                <span><%# Eval("Capacity") %> seats</span>
                            </div>

                            <div class="mt-3 bg-slate-50 border border-slate-200 rounded-lg p-3">
                                <p class="flex items-center gap-2 font-medium text-slate-700">
                                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"
                                        class="w-5 h-5 text-red-600 fill-current">
                                        <path
                                            d="M343.656,451.109C410,411.438,454.422,338.906,454.422,256c0-125.484-101.719-227.219-227.203-227.219
                    C101.719,28.781,0,130.516,0,256s101.719,227.219,227.219,227.219H512v-32.109H343.656z M318.484,145.875
                    c23.547-13.594,53.641-5.531,67.234,18.016s5.531,53.656-18.016,67.25c-23.547,13.578-53.641,5.516-67.234-18.016
                    C286.859,189.563,294.938,159.469,318.484,145.875z M300.453,297.688c13.609-23.547,43.703-31.609,67.25-18.016
                    c23.547,13.609,31.609,43.703,18.016,67.25s-43.688,31.609-67.25,18.016C294.938,351.344,286.859,321.234,300.453,297.688z
                    M227.219,72.375c27.188,0,49.219,22.031,49.219,49.219s-22.031,49.25-49.219,49.25s-49.25-22.063-49.25-49.25
                    S200.031,72.375,227.219,72.375z M249.938,256c0,12.563-10.172,22.719-22.719,22.719c-12.563,0-22.719-10.156-22.719-22.719
                    s10.156-22.719,22.719-22.719C239.766,233.281,249.938,243.438,249.938,256z M68.703,163.891
                    c13.594-23.547,43.703-31.609,67.25-18.016s31.609,43.688,18.016,67.25c-13.594,23.531-43.703,31.609-67.25,18.016
                    C63.188,217.547,55.109,187.438,68.703,163.891z M135.969,364.938c-23.563,13.594-53.656,5.531-67.266-18.016
                    c-13.578-23.547-5.516-53.656,18.016-67.266c23.547-13.594,53.656-5.516,67.25,18.031S159.5,351.344,135.969,364.938z
                    M177.969,389.203c0-27.188,22.063-49.234,49.25-49.234s49.219,22.047,49.219,49.234s-22.031,49.234-49.219,49.234
                    S177.969,416.391,177.969,389.203z" />
                                    </svg>
                                    Current Movie:
                                </p>
                                <p class="current-movie ml-7 text-slate-700 font-semibold"><%# Eval("CurrentMovie") %></p>
                            </div>

                            <div class="mt-3">
                                <p class="text-slate-500 text-xs uppercase font-semibold mb-1">Description</p>
                                <p class="text-slate-700 leading-relaxed"><%# Eval("Description") %></p>
                            </div>

                            <div class="mt-3">
                                <p class="text-slate-500 text-xs uppercase font-semibold mb-1">Seat Distribution</p>
                                <div class="bg-slate-50 border border-slate-200 rounded-lg p-3 space-y-2 text-slate-700">
                                    <div class="flex justify-between"><span>Classic Seats Price:</span><span class="font-bold"><%# Eval("ClassicSeat") %></span></div>
                                    <div class="flex justify-between"><span>Prime Seats Price:</span><span class="font-bold"><%# Eval("PrimeSeat") %></span></div>
                                    <div class="flex justify-between"><span>Recliner Seats Price:</span><span class="font-bold"><%# Eval("ReclinerSeat") %></span></div>
                                </div>
                            </div>
                        </div>

                        <button class="mt-6 bg-gradient-to-r from-red-600 to-red-700 text-white hover:from-red-700 hover:to-red-800 transition-all rounded-lg px-4 py-2 text-sm font-semibold w-full shadow">
                            Manage
                        </button>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>

        <!-- Loader -->
        <div id="loader" class="hidden fixed inset-0 flex items-center justify-center bg-white bg-opacity-70 z-50">
            <div class="flex flex-col items-center">
                <div class="w-10 h-10 border-4 border-red-300 border-t-red-600 rounded-full animate-spin"></div>
                <p class="mt-3 text-sm text-slate-600 font-medium">Searching screens...</p>
            </div>
        </div>


        <div id="noResults" class="hidden">
            <div class="flex flex-col items-center justify-center py-12 bg-red-50 rounded-lg mt-6">
                <svg class="w-12 h-12 text-red-400 mb-3" fill="none" stroke="currentColor" stroke-width="1.5" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round"
                        d="M12 9v3.75m0 3.75h.007v.008H12v-.008zm9-3.75A9 9 0 1 1 3 12a9 9 0 0 1 18 0z" />
                </svg>
                <p class="text-lg text-slate-700 font-semibold mt-2 tracking-wide transition-all duration-300 ease-in-out">
                    😕 No matching screens found..!
                </p>

            </div>
        </div>

        <div id="toastMessage"
            class="fixed top-5 right-5 hidden px-5 py-3 rounded-lg shadow-lg text-white font-medium z-50 transition-all duration-500">
        </div>

        <asp:ScriptManager runat="server"></asp:ScriptManager>

        <div id="addScreenModal" class="fixed inset-0 bg-black bg-opacity-50 hidden items-center justify-center z-50">
            <div class="bg-white rounded-2xl shadow-2xl w-full max-w-4xl mx-4 p-8 relative">
                <button type="button" id="closeModalBtn" class="absolute top-4 right-5 text-gray-500 hover:text-gray-700 text-2xl font-bold">
                    ✕
                </button>

                <h2 class="text-3xl font-extrabold text-gray-800 mb-6 text-center">Add New Screen</h2>

                <div id="addScreenForm" runat="server" class="grid grid-cols-1 md:grid-cols-2 gap-6">
                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-1">Screen Name</label>
                        <asp:TextBox ID="txtScreenName" runat="server" CssClass="w-full border border-gray-300 rounded-lg px-3 py-2 focus:ring-2 focus:ring-red-400 outline-none" placeholder="Enter screen name"></asp:TextBox>
                    </div>

                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-1">Screen Type</label>
                        <asp:DropDownList ID="ddlScreenType" runat="server" CssClass="w-full border border-gray-300 rounded-lg px-3 py-2 focus:ring-2 focus:ring-red-400 outline-none">
                            <asp:ListItem Value="">Select Type</asp:ListItem>
                            <asp:ListItem Value="Standard">Standard</asp:ListItem>
                            <asp:ListItem Value="IMAX">IMAX</asp:ListItem>
                            <asp:ListItem Value="3D">3D</asp:ListItem>
                            <asp:ListItem Value="VIP">VIP</asp:ListItem>
                            <asp:ListItem Value="DolbyCinema">DolbyCinema</asp:ListItem>
                        </asp:DropDownList>
                    </div>

                    <div class="md:col-span-2">
                        <label class="block text-sm font-medium text-gray-700 mb-1">Capacity</label>
                        <div class="flex flex-wrap items-center gap-3">
                            <asp:TextBox ID="txtCapacity" runat="server" TextMode="Number"
                                CssClass="border border-gray-300 rounded-lg px-3 py-2 focus:ring-2 focus:ring-red-400 outline-none flex-grow"
                                placeholder="Enter total seat capacity"></asp:TextBox>

                            <!-- Validation Label -->
                            <asp:Label ID="lblValidation" runat="server"
                                CssClass="hidden text-sm font-medium text-red-700 bg-red-100 border border-red-300 rounded-md px-3 py-1"
                                Text=""></asp:Label>
                        </div>
                    </div>



                    <div class="md:col-span-2">
                        <label class="block text-sm font-medium text-gray-700 mb-1">Description</label>
                        <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine" Rows="2" CssClass="w-full border border-gray-300 rounded-lg px-3 py-2 focus:ring-2 focus:ring-red-400 outline-none resize-none" placeholder="Enter screen description"></asp:TextBox>
                    </div>

                    <div class="md:col-span-2 border-t pt-4">
                        <h3 class="text-lg font-semibold text-gray-800 mb-2">Seat Prices</h3>
                        <div class="grid grid-cols-1 md:grid-cols-3 gap-6">
                            <div>
                                <label class="block text-sm font-medium text-gray-700 mb-1">Classic Seat Price</label>
                                <asp:TextBox ID="txtClassic" runat="server" TextMode="Number" CssClass="w-full border border-gray-300 rounded-lg px-3 py-2 focus:ring-2 focus:ring-red-400 outline-none" placeholder="e.g. 150"></asp:TextBox>
                            </div>

                            <div>
                                <label class="block text-sm font-medium text-gray-700 mb-1">Prime Seat Price</label>
                                <asp:TextBox ID="txtPrime" runat="server" TextMode="Number" CssClass="w-full border border-gray-300 rounded-lg px-3 py-2 focus:ring-2 focus:ring-red-400 outline-none" placeholder="e.g. 250"></asp:TextBox>
                            </div>

                            <div>
                                <label class="block text-sm font-medium text-gray-700 mb-1">Recliner Seat Price</label>
                                <asp:TextBox ID="txtRecliner" runat="server" TextMode="Number" CssClass="w-full border border-gray-300 rounded-lg px-3 py-2 focus:ring-2 focus:ring-red-400 outline-none" placeholder="e.g. 400"></asp:TextBox>
                            </div>
                        </div>
                    </div>

                    <div class="md:col-span-2 flex justify-center mt-6">
                        <asp:Button ID="btnSaveScreen" runat="server" Text="Save Screen" CssClass="bg-red-500 hover:bg-red-600 text-white font-semibold px-10 py-2.5 rounded-lg shadow-md transition-all duration-200" OnClick="btnSaveScreen_Click" />
                    </div>
                </div>
            </div>
        </div>

        <asp:HiddenField ID="hiddenDeleteId" runat="server" />

        <div id="deleteModal" class="fixed inset-0 bg-black bg-opacity-50 hidden items-center justify-center z-50">
            <div class="bg-white rounded-2xl shadow-2xl w-full max-w-sm p-6 text-center transform transition-all scale-95">
                <h2 class="text-xl font-semibold text-gray-800 mb-3">Delete Screen?</h2>
                <p class="text-gray-600 mb-6">Are you sure you want to delete this screen? This action cannot be undone.</p>
                <div class="flex justify-center gap-3">
                    <button id="cancelDeleteBtn"
                        class="bg-gray-200 hover:bg-gray-300 text-gray-800 px-4 py-2 rounded-lg font-medium transition">
                        Cancel
                    </button>
                    <asp:Button ID="btnConfirmDelete" runat="server"
                        Text="Delete"
                        CssClass="bg-red-600 hover:bg-red-700 text-white px-4 py-2 rounded-lg font-medium transition"
                        OnClick="btnConfirmDelete_Click" />
                </div>
            </div>
        </div>


        <script type="text/javascript">
            function filterScreens() {
                const searchInput = document.getElementById('searchInput');
                const filterDropdown = document.getElementById('typeFilter');
                const screensContainer = document.getElementById('screensContainer');
                const screenItems = screensContainer.getElementsByClassName('screen-item');
                const loader = document.getElementById('loader');
                const noResults = document.getElementById('noResults');

                loader.classList.remove('hidden');
                noResults.classList.add('hidden');

                setTimeout(() => {
                    const searchTerm = searchInput.value.toLowerCase();
                    const selectedType = filterDropdown.value;
                    let visibleCount = 0;

                    for (let i = 0; i < screenItems.length; i++) {
                        const item = screenItems[i];
                        const screenName = item.querySelector('.screen-name').textContent.toLowerCase();
                        const currentMovieElement = item.querySelector('.current-movie');
                        const currentMovie = currentMovieElement ? currentMovieElement.textContent.toLowerCase() : "";
                        const screenType = item.getAttribute('data-screen-type');

                        const matchesSearch = (searchTerm === "" || screenName.includes(searchTerm) || currentMovie.includes(searchTerm));
                        const matchesFilter = (selectedType === "All" || screenType === selectedType);

                        if (matchesSearch && matchesFilter) {
                            item.style.display = '';
                            visibleCount++;
                        } else {
                            item.style.display = 'none';
                        }
                    }

                    loader.classList.add('hidden');
                    noResults.classList.toggle('hidden', visibleCount !== 0);
                }, 800);
            }

            // 🔹 Reusable function to open modal (used by JS + C#)
            function showModal() {
                const addScreenModal = document.getElementById('addScreenModal');
                addScreenModal.classList.remove('hidden');
                addScreenModal.classList.add('flex');
                document.body.classList.add('overflow-hidden'); // prevent background scroll

                // Re-center (important after ASP.NET postback)
                setTimeout(() => {
                    addScreenModal.classList.add('items-center', 'justify-center');
                }, 50);
            }

            // 🔹 Reusable function to close modal
            function closeModal() {
                const addScreenModal = document.getElementById('addScreenModal');
                addScreenModal.classList.add('hidden');
                addScreenModal.classList.remove('flex');
                document.body.classList.remove('overflow-hidden');
            }

            // --- Event listeners for open/close buttons ---
            const openModalBtn = document.getElementById('openModalBtn');
            const closeModalBtn = document.getElementById('closeModalBtn');
            const addScreenModal = document.getElementById('addScreenModal');

            openModalBtn.addEventListener('click', showModal);
            closeModalBtn.addEventListener('click', closeModal);

            addScreenModal.addEventListener('click', (e) => {
                if (e.target === addScreenModal) {
                    closeModal();
                }
            });

            // --- Toast function ---
            function showToast(message, type = 'success') {
                const toast = document.getElementById('toastMessage');
                toast.innerText = message;

                // Set background color based on type
                const bgColor = type === 'error' ? 'bg-red-600' : 'bg-green-600';

                toast.className = `fixed top-16 right-5 px-5 py-3 rounded-lg shadow-lg text-white font-medium z-50 transition-all duration-500 ${bgColor}`;
                toast.style.opacity = '1';
                toast.style.transform = 'scale(1)';
                toast.style.display = 'block';

                setTimeout(() => {
                    toast.style.opacity = '0';
                    toast.style.transform = 'scale(0.95)';
                    setTimeout(() => {
                        toast.style.display = 'none';

                        // ✅ remove ?deleted=1 (or any flag) from URL so toast doesn't reappear on refresh
                        const url = new URL(window.location);
                        url.search = ''; // clears query parameters entirely
                        window.history.replaceState({}, '', url);
                    }, 500);
                }, 3000);
            }


            let screenIdToDelete = null;

            // Open Modal
            function openDeleteModal(screenId) {
                screenIdToDelete = screenId;
                const modal = document.getElementById('deleteModal');
                modal.classList.remove('hidden');
                modal.classList.add('flex');
                return false;
            }

            // Cancel button closes modal
            document.getElementById('cancelDeleteBtn').addEventListener('click', () => {
                const modal = document.getElementById('deleteModal');
                modal.classList.add('hidden');
                modal.classList.remove('flex');
                screenIdToDelete = null;
            });

            // Set hidden field before delete
            document.getElementById('<%= btnConfirmDelete.ClientID %>').addEventListener('click', function () {
                if (screenIdToDelete) {
                    document.getElementById('<%= hiddenDeleteId.ClientID %>').value = screenIdToDelete;
                }
            });

        </script>

    </main>
</asp:Content>
