<%@ Page Title="" Language="C#" MasterPageFile="~/AdminSite.Master" AutoEventWireup="true" CodeFile="AdminMovies.aspx.cs" Inherits="EntertainPro.AdminMovies" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <main class="flex-1 p-6 md:p-8">
        <div class="mb-8">
            <div class="mb-8">
                <h1 class="text-3xl md:text-4xl font-extrabold mb-4 flex items-center gap-3">
                    <!-- Movie/Film SVG icon -->
                    <svg class="w-10 h-10 text-red-500 animate-bounce" viewBox="0 0 24 24" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                        <path d="M19.7286477,3.91709009 L19.7796475,4.07673953 L20.3309222,5.99926292 C20.4355805,6.36424991 20.2508505,6.74366136 19.9126449,6.89230405 L19.8167039,6.92693721 L9.08979429,10.0020329 L20.2488588,10.0029698 C20.6285546,10.0029698 20.9423498,10.2851237 20.9920122,10.6511993 L20.9988588,10.7529698 L20.9988588,19.2509821 C20.9988588,20.713514 19.8571542,21.9093864 18.4163811,21.9959633 L18.2488588,22.0009821 L5.75,22.0009821 C4.28746816,22.0009821 3.09159572,20.8592775 3.00501879,19.4185045 L3,19.2509821 L2.99979429,10.8590329 L2.47803395,9.03789737 C2.07490554,7.63202154 2.84275532,6.16777873 4.20385145,5.68742476 L4.36350088,5.63642498 L16.3781751,2.19127259 C17.7840509,1.78814418 19.2482937,2.55599396 19.7286477,3.91709009 Z M19.498,11.502 L4.5,11.502 L4.5,19.2509821 C4.5,19.8550436 4.92847749,20.3590287 5.4980814,20.4755866 L5.62219476,20.4945285 L5.75,20.5009821 L18.2488588,20.5009821 C18.8960675,20.5009821 19.4283927,20.0091075 19.4924052,19.3787874 L19.4988588,19.2509821 L19.498,11.502 Z M6.27268011,6.6494258 L4.77695691,7.07831752 C4.15481999,7.25671241 3.7786565,7.8762725 3.89085867,8.49982068 L3.91988247,8.62445396 L4.26421826,9.82529556 L4.55930489,9.74043653 L6.27268011,6.6494258 Z M11.029003,5.28557216 L8.31151617,6.06479896 L6.59814094,9.15580969 L9.31562776,8.37658289 L11.029003,5.28557216 Z M15.7862871,3.92144289 L13.0688003,4.70066969 L11.3554251,7.79168042 L14.0719506,7.01272925 L15.7862871,3.92144289 Z M17.6334765,3.68788446 L16.1127092,6.42755115 L18.6812212,5.6912865 L18.3377549,4.49019556 C18.2305941,4.11648136 17.96425,3.83153666 17.6334765,3.68788446 Z"></path>
                    </svg>

                    <!-- Gradient text -->
                    <span class="bg-gradient-to-r from-red-500 via-pink-500 to-purple-500 bg-clip-text text-transparent">Movies
                    </span>
                </h1>

                <p class="text-gray-500 text-sm md:text-base">
                    Manage your movie catalog and showtimes.
                </p>
            </div>

        </div>

        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
            <div class="bg-white rounded-xl shadow-sm border border-slate-200 overflow-hidden">
                <img src="https://placehold.co/400x600/dc2626/ffffff?text=Starlight+Rebellion"
                    alt="Starlight Rebellion" class="w-full h-64 object-cover">
                <div class="p-6">
                    <h3 class="text-lg font-semibold mb-2">Starlight Rebellion</h3>
                    <p class="text-slate-600 text-sm mb-4">Sci-Fi • 2h 15m • PG-13</p>
                    <div class="flex items-center justify-between">
                        <span class="text-2xl font-bold text-slate-900">$12.00</span>
                        <button
                            class="bg-red-600 text-white hover:bg-red-700 transition-colors rounded-lg px-4 py-2 text-sm font-semibold">
                            Edit</button>
                    </div>
                </div>
            </div>

            <div class="bg-white rounded-xl shadow-sm border border-slate-200 overflow-hidden">
                <img src="https://placehold.co/400x600/1e40af/ffffff?text=Ocean's+Mystery" alt="Ocean's Mystery"
                    class="w-full h-64 object-cover">
                <div class="p-6">
                    <h3 class="text-lg font-semibold mb-2">Ocean's Mystery</h3>
                    <p class="text-slate-600 text-sm mb-4">Thriller • 1h 58m • R</p>
                    <div class="flex items-center justify-between">
                        <span class="text-2xl font-bold text-slate-900">$12.00</span>
                        <button
                            class="bg-red-600 text-white hover:bg-red-700 transition-colors rounded-lg px-4 py-2 text-sm font-semibold">
                            Edit</button>
                    </div>
                </div>
            </div>

            <div class="bg-white rounded-xl shadow-sm border border-slate-200 overflow-hidden">
                <img src="https://placehold.co/400x600/f59e0b/ffffff?text=Comedy+Central" alt="Comedy Central"
                    class="w-full h-64 object-cover">
                <div class="p-6">
                    <h3 class="text-lg font-semibold mb-2">Comedy Central</h3>
                    <p class="text-slate-600 text-sm mb-4">Comedy • 1h 42m • PG</p>
                    <div class="flex items-center justify-between">
                        <span class="text-2xl font-bold text-slate-900">$10.00</span>
                        <button
                            class="bg-red-600 text-white hover:bg-red-700 transition-colors rounded-lg px-4 py-2 text-sm font-semibold">
                            Edit</button>
                    </div>
                </div>
            </div>
        </div>
    </main>

    <div id="add-movie-modal"
        class="modal fixed inset-0 bg-black bg-opacity-50 z-40 flex items-center justify-center invisible opacity-0">
        <div class="modal-content bg-white rounded-2xl shadow-xl w-full max-w-md p-8 transform scale-95">
            <h3 class="text-xl font-bold mb-6">Add New Movie</h3>
            <div class="mb-4">
                <label for="movie-title" class="block text-sm font-medium mb-1">Movie Title</label>
                <input type="text" id="movie-title"
                    class="w-full bg-slate-100 border-transparent rounded-lg px-4 py-2 focus:ring-2 focus:ring-red-500 focus:outline-none"
                    placeholder="e.g., Starlight Rebellion">
            </div>
            <div class="mb-4">
                <label for="movie-genre" class="block text-sm font-medium mb-1">Genre</label>
                <input type="text" id="movie-genre"
                    class="w-full bg-slate-100 border-transparent rounded-lg px-4 py-2 focus:ring-2 focus:ring-red-500 focus:outline-none"
                    placeholder="e.g., Sci-Fi">
            </div>
            <div class="grid grid-cols-2 gap-4 mb-6">
                <div>
                    <label for="movie-duration" class="block text-sm font-medium mb-1">Duration (mins)</label>
                    <input type="number" id="movie-duration"
                        class="w-full bg-slate-100 border-transparent rounded-lg px-4 py-2 focus:ring-2 focus:ring-red-500 focus:outline-none"
                        placeholder="120">
                </div>
                <div>
                    <label for="movie-release" class="block text-sm font-medium mb-1">Release Date</label>
                    <input type="date" id="movie-release"
                        class="w-full bg-slate-100 border-transparent rounded-lg px-4 py-2 focus:ring-2 focus:ring-red-500 focus:outline-none">
                </div>
            </div>
            <div class="flex justify-end gap-4">
                <button type="button"
                    class="px-4 py-2 text-sm font-semibold rounded-lg bg-slate-200 hover:bg-slate-300">
                    Cancel</button>
                <button type="submit"
                    class="px-4 py-2 text-sm font-semibold rounded-lg bg-red-600 text-white hover:bg-red-700">
                    Add
                        Movie</button>
            </div>
        </div>
    </div>
</asp:Content>
