<%@ Page Title="" Language="C#" MasterPageFile="~/AdminSite.Master" AutoEventWireup="true" CodeFile="AdminMovies.aspx.cs" Inherits="EntertainPro.AdminMovies" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <main class="flex-1 p-6 md:p-8">
        <div class="mb-8">
            <div class="mb-8 flex items-center justify-between">
                <div>
                    <h1 class="text-3xl md:text-4xl font-extrabold mb-2 flex items-center gap-3">
                        <!-- Movie Icon -->
                        <svg class="w-10 h-10 text-red-500 animate-bounce" viewBox="0 0 24 24" fill="currentColor"
                            xmlns="http://www.w3.org/2000/svg">
                            <path
                                d="M19.7286477,3.91709009 L19.7796475,4.07673953 L20.3309222,5.99926292 C20.4355805,6.36424991 20.2508505,6.74366136 19.9126449,6.89230405 L19.8167039,6.92693721 L9.08979429,10.0020329 L20.2488588,10.0029698 C20.6285546,10.0029698 20.9423498,10.2851237 20.9920122,10.6511993 L20.9988588,10.7529698 L20.9988588,19.2509821 C20.9988588,20.713514 19.8571542,21.9093864 18.4163811,21.9959633 L18.2488588,22.0009821 L5.75,22.0009821 C4.28746816,22.0009821 3.09159572,20.8592775 3.00501879,19.4185045 L3,19.2509821 L2.99979429,10.8590329 L2.47803395,9.03789737 C2.07490554,7.63202154 2.84275532,6.16777873 4.20385145,5.68742476 L4.36350088,5.63642498 L16.3781751,2.19127259 C17.7840509,1.78814418 19.2482937,2.55599396 19.7286477,3.91709009 Z M19.498,11.502 L4.5,11.502 L4.5,19.2509821 C4.5,19.8550436 4.92847749,20.3590287 5.4980814,20.4755866 L5.62219476,20.4945285 L5.75,20.5009821 L18.2488588,20.5009821 C18.8960675,20.5009821 19.4283927,20.0091075 19.4924052,19.3787874 L19.4988588,19.2509821 L19.498,11.502 Z M6.27268011,6.6494258 L4.77695691,7.07831752 C4.15481999,7.25671241 3.7786565,7.8762725 3.89085867,8.49982068 L3.91988247,8.62445396 L4.26421826,9.82529556 L4.55930489,9.74043653 L6.27268011,6.6494258 Z M11.029003,5.28557216 L8.31151617,6.06479896 L6.59814094,9.15580969 L9.31562776,8.37658289 L11.029003,5.28557216 Z M15.7862871,3.92144289 L13.0688003,4.70066969 L11.3554251,7.79168042 L14.0719506,7.01272925 L15.7862871,3.92144289 Z M17.6334765,3.68788446 L16.1127092,6.42755115 L18.6812212,5.6912865 L18.3377549,4.49019556 C18.2305941,4.11648136 17.96425,3.83153666 17.6334765,3.68788446 Z">
                            </path>
                        </svg>

                        <span
                            class="bg-gradient-to-r from-red-500 via-pink-500 to-purple-500 bg-clip-text text-transparent">Movies</span>
                    </h1>
                    <p class="text-gray-500 text-sm md:text-base">
                        Manage your movie catalog and showtimes.
                    </p>
                </div>

                <!-- Add Movie Button -->
                <button type="button" id="openModalBtn"
                    class="flex items-center gap-2 px-5 py-2.5 bg-red-600 text-white font-semibold rounded-lg shadow-md hover:bg-red-700 focus:ring-2 focus:ring-red-400 focus:outline-none transition duration-200">
                    <svg xmlns="http://www.w3.org/2000/svg" class="w-5 h-5" fill="none" viewBox="0 0 24 24"
                        stroke="currentColor" stroke-width="2">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M12 4v16m8-8H4" />
                    </svg>
                    Add Movie
                </button>
            </div>

        </div>
        <div id="movieContainer" style="display: none;">

            <div class="bg-white rounded-xl shadow-lg border border-slate-200 overflow-hidden">

                <!-- Search & Filter Bar -->
                <div
                    class="px-6 py-4 border-b border-slate-200 flex flex-col sm:flex-row items-center justify-between gap-3">
                    <div class="relative w-full sm:w-64">
                        <input type="text" placeholder="Search movies..."
                            class="w-full pl-10 pr-4 py-2 border border-slate-300 rounded-lg text-sm 
                focus:ring-2 focus:ring-red-500 focus:border-red-500 transition-shadow"
                            style="outline: none;" id="movieSearchInput" onkeyup="filterMovies()">

                        <svg class="absolute left-3 top-1/2 transform -translate-y-1/2 w-4 h-4 text-slate-400"
                            xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24"
                            stroke="currentColor" stroke-width="2">
                            <path stroke-linecap="round" stroke-linejoin="round"
                                d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z" />
                        </svg>
                    </div>

                    <!-- Category Filter -->
                    <select id="categoryFilter"
                        class="border border-slate-300 rounded-lg px-4 py-2 text-sm text-slate-700 
                focus:ring-2 focus:ring-red-500 focus:outline-none"
                        onchange="filterMovies()">
                        <option value="all">All Categories</option>
                        <option value="upcoming">Upcoming</option>
                        <option value="popular">Popular</option>
                        <option value="top">Top</option>
                    </select>
                </div>

                <!-- Movie Table -->
                <div class="overflow-x-auto">
                    <table id="movieTable" class="min-w-full divide-y divide-slate-200">
                        <thead class="bg-slate-50">
                            <tr>
                                <th class="text-left py-3 px-6 text-xs font-semibold text-slate-600 uppercase tracking-wider">ID</th>
                                <th class="text-left py-3 px-6 text-xs font-semibold text-slate-600 uppercase tracking-wider">Poster</th>
                                <th class="text-left py-3 px-6 text-xs font-semibold text-slate-600 uppercase tracking-wider">Title</th>
                                <th class="text-left py-3 px-6 text-xs font-semibold text-slate-600 uppercase tracking-wider">Genre & Duration</th>
                                <th class="text-left py-3 px-6 text-xs font-semibold text-slate-600 uppercase tracking-wider">Category</th>
                                <th class="text-left py-3 px-6 text-xs font-semibold text-slate-600 uppercase tracking-wider">Actions</th>
                            </tr>
                        </thead>

                        <tbody class="divide-y divide-slate-200">
                            <asp:Repeater ID="rptMovies" runat="server" OnItemCommand="rptMovies_ItemCommand">
                                <itemtemplate>
                                    <tr class="hover:bg-red-50/50 transition-colors"
                                        data-title='<%# Eval("Title").ToString().ToLower() %>'
                                        data-genre='<%# Eval("Genre").ToString().ToLower() %>'
                                        data-category='<%# Eval("Category").ToString().ToLower() %>'>

                                        <td class="py-4 px-6 font-medium text-slate-700"><%# Eval("MovieID") %></td>
                                        <td class="py-4 px-6">
                                            <img src='<%# ResolveUrl(Eval("ImageUrl").ToString()) %>'
                                                alt='<%# Eval("Title") %>'
                                                class="w-14 h-20 rounded-lg object-cover border border-slate-200 shadow-sm" />
                                        </td>
                                        <td class="py-4 px-6 font-medium text-slate-900"><%# Eval("Title") %></td>
                                        <td class="py-4 px-6 text-slate-600 text-sm">
                                            <%# Eval("Genre") %> • <%# Eval("Duration") %>
                                        </td>
                                        <td class="py-4 px-6">
                                            <span class="bg-yellow-100 text-yellow-800 px-3 py-1 rounded-full text-xs font-semibold">
                                                <%# Eval("Category") %>
                                            </span>
                                        </td>
                                        <td class="py-4 px-6 space-x-4 whitespace-nowrap text-sm font-medium">
                                            <asp:LinkButton ID="lnkView" runat="server"
                                                CommandName="ViewDetails"
                                                CommandArgument='<%# Eval("MovieID") %>'
                                                CssClass="text-blue-600 hover:text-blue-800 transition-colors p-1">
                                                View Details
                                            </asp:LinkButton>

                                            <asp:LinkButton ID="lnkDelete" runat="server"
                                                OnClientClick='<%# "showDeleteModal(" + Eval("MovieID") + "); return false;" %>'
                                                CssClass="text-red-600 hover:text-red-800 transition-colors p-1">
                                                Delete
                                            </asp:LinkButton>
                                        </td>
                                    </tr>
                                </itemtemplate>
                            </asp:Repeater>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <!-- ✅ Plain HTML div for JS-based "no results" -->
        <div id="noMovieDiv" style="display: none;">
            <div class="flex flex-col items-center justify-center py-12 bg-red-50 rounded-lg mt-6">
                <svg class="w-12 h-12 text-red-400 mb-3" fill="none" stroke="currentColor" stroke-width="1.5"
                    viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round"
                        d="M12 9v3.75m0 3.75h.007v.008H12v-.008zm9-3.75A9 9 0 1 1 3 12a9 9 0 0 1 18 0z" />
                </svg>
                <h3 class="text-lg font-semibold text-red-700">No movies found</h3>
                <p class="text-sm text-slate-600 mt-1">Try a different title or category.</p>
            </div>
        </div>

        <!-- 🔄 Loader (hidden by default) -->
        <div id="movieLoader" class="flex flex-col items-center justify-center py-10">
            <div class="w-10 h-10 border-4 border-red-300 border-t-red-600 rounded-full animate-spin"></div>
            <p class="mt-3 text-sm text-slate-600 font-medium">Searching movies...</p>
        </div>

        <!-- Hidden field to store movie id -->
        <asp:HiddenField ID="hfMovieIdToDelete" runat="server" />

        <!-- Delete Confirmation Modal -->
        <div id="deleteModal"
            class="hidden fixed inset-0 flex items-center justify-center bg-black bg-opacity-50 z-50">
            <div class="bg-white rounded-xl p-6 shadow-lg w-80 text-center">
                <svg class="w-12 h-12 text-red-500 mx-auto mb-3" fill="none" stroke="currentColor" stroke-width="2"
                    viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round"
                        d="M12 9v3.75m0 3.75h.007v.008H12v-.008zm9-3.75A9 9 0 1 1 3 12a9 9 0 0 1 18 0z" />
                </svg>
                <h3 class="text-lg font-semibold text-slate-800 mb-2">Delete Movie?</h3>
                <p class="text-sm text-slate-500 mb-5">This action cannot be undone.</p>

                <div class="flex justify-center gap-3">
                    <button type="button" onclick="hideDeleteModal()"
                        class="px-4 py-2 bg-slate-200 rounded-lg text-slate-700 font-medium hover:bg-slate-300">
                        Cancel
                    </button>
                    <asp:Button ID="btnConfirmDelete" runat="server"
                        CssClass="px-4 py-2 bg-red-600 text-white rounded-lg font-medium hover:bg-red-700"
                        Text="Delete" OnClick="btnConfirmDelete_Click" />
                </div>
            </div>
        </div>

        <!-- Modal (hidden by default) -->
        <div id="addMovieModal"
            class="hidden fixed inset-0 flex items-center justify-center z-50 bg-black bg-opacity-40 backdrop-blur-sm transition-all duration-300">
            <div class="bg-white rounded-2xl shadow-2xl w-full max-w-4xl p-6 relative animate-fadeIn">
                <!-- Close Button -->
                <button id="closeModalBtn"
                    class="absolute top-4 right-4 text-gray-400 hover:text-red-500 text-3xl font-bold transition-colors duration-200">
                    ×
                </button>

                <!-- Header with Icon (Wider at top) -->
                <div class="text-center mb-4">
                    <h2 class="text-3xl font-bold text-gray-800 bg-gradient-to-r from-red-600 to-pink-600 bg-clip-text text-transparent">Add New Movie</h2>
                </div>

                <!-- enctype is important for file upload -->
                <form id="addMovieForm" class="space-y-4" method="post" enctype="multipart/form-data">

                    <!-- Top Section: Image on Left, 4 Labels on Right -->
                    <div class="grid grid-cols-1 md:grid-cols-2 gap-6 mb-6">
                        <!-- Left: Image Upload and Preview -->
                        <div class="flex flex-col items-center">
                            <label class="block text-sm font-semibold text-gray-700 mb-2">Movie Poster</label>
                            <input type="file" name="ImageFile" accept="image/*" id="imageInput"
                                class="hidden">
                            <label for="imageInput"
                                class="cursor-pointer inline-block px-4 py-2 bg-red-500 text-white font-semibold rounded-lg hover:bg-red-600 transition-all duration-300 text-sm mb-3">
                                Choose Poster
                            </label>
                            <!-- Image Preview -->
                            <div id="imagePreview" class="w-32 h-48 bg-gray-100 border-2 border-dashed border-gray-300 rounded-lg flex items-center justify-center overflow-hidden">
                                <span class="text-gray-500 text-xs">Preview will appear here</span>
                            </div>
                        </div>

                        <!-- Right: 4 Labels -->
                        <div class="space-y-4">
                            <!-- Title -->
                            <div>
                                <label class="block text-sm font-semibold text-gray-700 mb-1">Movie Title</label>
                                <input type="text" name="Title"
                                    class="w-full px-3 py-2 border-2 border-gray-200 rounded-lg focus:ring-4 focus:ring-red-300 focus:border-red-500 focus:outline-none transition-all duration-200 placeholder-gray-400 text-sm"
                                    placeholder="Enter movie title" required>
                            </div>

                            <!-- Genre -->
                            <div>
                                <label class="block text-sm font-semibold text-gray-700 mb-1">Genre</label>
                                <input type="text" name="Genre"
                                    class="w-full px-3 py-2 border-2 border-gray-200 rounded-lg focus:ring-4 focus:ring-red-300 focus:border-red-500 focus:outline-none transition-all duration-200 placeholder-gray-400 text-sm"
                                    placeholder="e.g. Action, Drama" required>
                            </div>

                            <!-- Rating -->
                            <div>
                                <label class="block text-sm font-semibold text-gray-700 mb-1">Rating</label>
                                <input type="number" name="Rating" min="1" max="5"
                                    class="w-full px-3 py-2 border-2 border-gray-200 rounded-lg focus:ring-4 focus:ring-red-300 focus:border-red-500 focus:outline-none transition-all duration-200 placeholder-gray-400 text-sm"
                                    placeholder="Enter rating (1–5)" required>
                            </div>

                            <!-- Trailer URL -->
                            <div>
                                <label class="block text-sm font-semibold text-gray-700 mb-1">Trailer URL</label>
                                <input type="url" name="TrailerUrl"
                                    class="w-full px-3 py-2 border-2 border-gray-200 rounded-lg focus:ring-4 focus:ring-red-300 focus:border-red-500 focus:outline-none transition-all duration-200 placeholder-gray-400 text-sm"
                                    placeholder="Enter YouTube link" required>
                            </div>
                        </div>
                    </div>

                    <!-- Bottom Section: 3 Labels on Left, 2 on Right -->
                    <div class="grid grid-cols-1 md:grid-cols-2 gap-4">

                        <!-- Left: 3 Labels -->
                        <div class="space-y-4">
                            <!-- Category -->
                            <div>
                                <label class="block text-sm font-semibold text-gray-700 mb-1">Category</label>
                                <select name="Category"
                                    class="w-full px-3 py-2 border-2 border-gray-200 rounded-lg focus:ring-4 focus:ring-red-300 focus:border-red-500 focus:outline-none transition-all duration-200 bg-white text-sm">
                                    <option>Upcoming</option>
                                    <option>Now Showing</option>
                                    <option>Top Rated</option>
                                </select>
                            </div>

                            <!-- SubCategory -->
                            <div>
                                <label class="block text-sm font-semibold text-gray-700 mb-1">SubCategory</label>
                                <input type="text" name="SubCategory"
                                    class="w-full px-3 py-2 border-2 border-gray-200 rounded-lg focus:ring-4 focus:ring-red-300 focus:border-red-500 focus:outline-none transition-all duration-200 placeholder-gray-400 text-sm"
                                    placeholder="e.g. Drama, Romance" required>
                            </div>

                            <!-- Duration -->
                            <div>
                                <label class="block text-sm font-semibold text-gray-700 mb-1">Duration</label>
                                <input type="text" name="Duration"
                                    class="w-full px-3 py-2 border-2 border-gray-200 rounded-lg focus:ring-4 focus:ring-red-300 focus:border-red-500 focus:outline-none transition-all duration-200 placeholder-gray-400 text-sm"
                                    placeholder="e.g. 2h 16min" required>
                            </div>
                        </div>

                        <!-- Right: 2 Labels -->
                        <div class="space-y-4">
                            <!-- Language -->
                            <div>
                                <label class="block text-sm font-semibold text-gray-700 mb-1">Language</label>
                                <input type="text" name="Language"
                                    class="w-full px-3 py-2 border-2 border-gray-200 rounded-lg focus:ring-4 focus:ring-red-300 focus:border-red-500 focus:outline-none transition-all duration-200 placeholder-gray-400 text-sm"
                                    placeholder="e.g. English, Hindi" required>
                            </div>

                            <!-- Release Date -->
                            <div>
                                <label class="block text-sm font-semibold text-gray-700 mb-1">Release Date</label>
                                <input type="date" name="ReleaseDate"
                                    class="w-full px-3 py-2 border-2 border-gray-200 rounded-lg focus:ring-4 focus:ring-red-300 focus:border-red-500 focus:outline-none transition-all duration-200 text-sm">
                            </div>
                        </div>
                    </div>

                    <!-- Submit -->
                    <div class="text-center mt-6">
                        <button type="submit"
                            class="w-full max-w-xs bg-red-500 text-white font-bold py-2 rounded-lg hover:bg-red-600 transition-all duration-300 transform hover:scale-105 shadow-lg text-sm">
                            Save Movie
                        </button>
                    </div>
                </form>
            </div>
        </div>



        <!-- JavaScript -->
        <script>
            let searchTimeout;

            // 🔹 Show loader on initial page load
            window.addEventListener("load", () => {
                const loader = document.getElementById("movieLoader");
                const container = document.getElementById("movieContainer");

                // Show loader first, hide movie table
                container.style.display = "none";
                loader.style.display = "flex";

                // Simulate short load delay before showing table
                setTimeout(() => {
                    loader.style.display = "none";
                    container.style.display = "block";
                }, 1000); // 1s delay for realistic load
            });

            // 🔹 Filter function with loader
            function filterMovies() {
                clearTimeout(searchTimeout);

                const loader = document.getElementById("movieLoader");
                const noMovieDiv = document.getElementById("noMovieDiv");
                const container = document.getElementById("movieContainer");
                const rows = document.querySelectorAll("#movieTable tbody tr");

                // Hide table, show loader
                container.style.opacity = "0.5";
                loader.style.display = "flex";
                noMovieDiv.style.display = "none";

                searchTimeout = setTimeout(() => {
                    const searchValue = document.getElementById("movieSearchInput").value.toLowerCase();
                    const categoryValue = document.getElementById("categoryFilter").value.toLowerCase();
                    let visibleCount = 0;

                    rows.forEach(row => {
                        const title = row.getAttribute("data-title") || "";
                        const genre = row.getAttribute("data-genre") || "";
                        const category = row.getAttribute("data-category") || "";

                        const matchesSearch = title.includes(searchValue) || genre.includes(searchValue);
                        const matchesCategory = categoryValue === "all" || category === categoryValue;

                        const isVisible = matchesSearch && matchesCategory;
                        row.style.display = isVisible ? "" : "none";
                        if (isVisible) visibleCount++;
                    });

                    // Hide loader and show results
                    loader.style.display = "none";
                    container.style.opacity = "1";

                    // Show "No movies found" if needed
                    noMovieDiv.style.display = visibleCount === 0 ? "block" : "none";
                }, 700);
            }
            function showDeleteModal(movieId) {
                document.getElementById('<%= hfMovieIdToDelete.ClientID %>').value = movieId;
                document.getElementById("deleteModal").classList.remove("hidden");
            }

            function hideDeleteModal() {
                document.getElementById("deleteModal").classList.add("hidden");
            }

            const openModalBtn = document.getElementById('openModalBtn');
            const closeModalBtn = document.getElementById('closeModalBtn');
            const modal = document.getElementById('addMovieModal');

            openModalBtn.addEventListener('click', () => {
                modal.classList.remove('hidden');
            });

            closeModalBtn.addEventListener('click', () => {
                modal.classList.add('hidden');
            });

            // Close modal when clicking outside the box
            window.addEventListener('click', (e) => {
                if (e.target === modal) {
                    modal.classList.add('hidden');
                }
            });

            document.getElementById('imageInput').addEventListener('change', function (event) {
                const file = event.target.files[0];
                if (file) {
                    const reader = new FileReader();
                    reader.onload = function (e) {
                        const preview = document.getElementById('imagePreview');
                        preview.innerHTML = `<img src="${e.target.result}" alt="Preview" class="w-full h-full object-cover rounded-lg">`;
                    };
                    reader.readAsDataURL(file);
                }
            });
        </script>

    </main>

</asp:Content>
