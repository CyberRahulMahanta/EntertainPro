<%@ Page Title="" Language="C#" MasterPageFile="~/AdminSite.Master" AutoEventWireup="true" CodeBehind="AdminShowingMoviesDetails.aspx.cs" Inherits="EntertainPro.AdminShowingMoviesDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <main class="flex-1 p-6 md:p-8">
        <div class="mb-8">
            <h1 class="text-3xl md:text-4xl font-extrabold text-gray-900 mb-4 flex items-center gap-3">
                <svg class="w-12 h-12 text-red-500 animate-bounce" viewBox="0 0 24 24" fill="none"
                    xmlns="http://www.w3.org/2000/svg">
                    <g id="SVGRepo_iconCarrier">
                        <path d="M7 21L12 17L17 21M7.8 17H16.2C17.8802 17 18.7202 17 19.362 16.673C19.9265 16.3854 20.3854 15.9265 20.673 15.362C21 14.7202 21 13.8802 21 12.2V7.8C21 6.11984 21 5.27976 20.673 4.63803C20.3854 4.07354 19.9265 3.6146 19.362 3.32698C18.7202 3 17.8802 3 16.2 3H7.8C6.11984 3 5.27976 3 4.63803 3.32698C4.07354 3.6146 3.6146 4.07354 3.32698 4.63803C3 5.27976 3 6.11984 3 7.8V12.2C3 13.8802 3 14.7202 3.32698 15.362C3.6146 15.9265 4.07354 16.3854 4.63803 16.673C5.27976 17 6.11984 17 7.8 17Z"
                            stroke="#ef4444" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" />
                    </g>
                </svg>

                <span class="bg-gradient-to-r from-red-500 via-pink-500 to-purple-500 bg-clip-text text-transparent">Showing Movies
                </span>
            </h1>

            <p class="text-gray-500 text-sm md:text-base">
                View, edit, and organize movies available in your theaters.
            </p>
        </div>
        <div class="bg-white rounded-xl shadow-lg border border-slate-100 overflow-hidden">
            <div class="p-6 border-b border-slate-100">
                <div class="flex flex-col sm:flex-row sm:items-center justify-between gap-4">
                </div>
            </div>
            <div class="overflow-x-auto">
                <table id="movieTable" class="w-full">
                    <thead class="bg-slate-50/70 border-b border-slate-100">
                        <tr>
                            <th class="text-left py-4 px-5 font-semibold text-slate-700 text-sm">Movie</th>
                            <th class="text-center py-4 px-5 font-semibold text-slate-700 text-sm">Screen</th>
                            <th class="text-center py-4 px-5 font-semibold text-slate-700 text-sm">Date</th>
                            <th class="text-center py-4 px-5 font-semibold text-slate-700 text-sm">Time</th>
                            <th class="text-center py-4 px-5 font-semibold text-slate-700 text-sm">Language</th>
                            <th class="text-center py-4 px-5 font-semibold text-slate-700 text-sm">Status</th>
                            <th class="text-center py-4 px-5 font-semibold text-slate-700 text-sm">Actions</th>
                        </tr>
                    </thead>
                    <tbody class="divide-y divide-slate-100 text-slate-600">
                        <asp:Repeater ID="rptShowings" runat="server" OnItemCommand="rptShowings_ItemCommand">
                            <ItemTemplate>
                                <tr>
                                    <td class="py-4 px-5 font-medium text-slate-800"><%# Eval("Title") %></td>
                                    <td class="text-center py-4 px-5"><%# Eval("ScreenName") %></td>
                                    <td class="text-center py-4 px-5"><%# Eval("ShowDate", "{0:dd-MMM-yyyy}") %></td>
                                    <td class="text-center py-4 px-5">
                                        <%# Eval("ShowTime") == DBNull.Value || Eval("ShowTime") == null
                                        ? "N/A"
                                        : DateTime.Today.Add((TimeSpan)Eval("ShowTime")).ToString("h:mm tt") %>
                                    </td>
                                    <td class="text-center py-4 px-5"><%# Eval("Language") %></td>

                                    <td class="text-center py-4 px-5 font-semibold">
                                        <span class='<%# Eval("Status").ToString().ToLower() == "active" ? "text-green-600" : "text-red-600" %>'>
                                            <%# Eval("Status").ToString().ToLower() == "active" ? "🟢 Active" : "🔴 Inactive" %>
                                        </span>
                                    </td>

                                    <td class="text-center py-4 px-5 flex items-center justify-center gap-2">
                                        <asp:LinkButton ID="btnEdit" runat="server" CommandName="EditShow"
                                            CommandArgument='<%# Eval("ShowingID") %>'
                                            CssClass="bg-blue-500 hover:bg-blue-600 text-white px-3 py-1 rounded-md text-xs shadow transition">
                                            Edit
                                        </asp:LinkButton>

                                        <%# Eval("Status").ToString().ToLower() == "active"
                                            ? "<a href='AdminShowingMoviesDetails.aspx?movieid=" + Eval("MovieID") + "&deactivate=" + Eval("ShowingID") + "' class=\"bg-yellow-500 hover:bg-yellow-600 text-white px-3 py-1 rounded-md text-xs shadow transition\">Deactivate</a>"
                                            : "<a href='AdminShowingMoviesDetails.aspx?movieid=" + Eval("MovieID") + "&activate=" + Eval("ShowingID") + "' class=\"bg-green-500 hover:bg-green-600 text-white px-3 py-1 rounded-md text-xs shadow transition\">Activate</a>"
                                        %>

                                        <a href="javascript:void(0);" onclick="confirmDelete('<%# Eval("MovieID") %>', '<%# Eval("ShowingID") %>')"
                                            class="bg-red-500 hover:bg-red-600 text-white px-3 py-1 rounded-md text-xs shadow transition">Delete
                                        </a>
                                    </td>

                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                    </tbody>
                </table>
            </div>
        </div>

        <!-- Edit Modal -->
        <div id="editModal" class="fixed inset-0 bg-black/40 backdrop-blur-sm hidden items-center justify-center z-50">
            <div class="bg-white rounded-2xl shadow-2xl w-full max-w-lg mx-4 p-8 relative">
                <button type="button" onclick="closeModal()" class="absolute top-4 right-5 text-gray-500 hover:text-gray-700 text-2xl">&times;</button>

                <h2 class="text-2xl font-bold mb-6 text-center text-gray-800">Edit Showing</h2>

                <asp:HiddenField ID="hfShowingID" runat="server" />

                <div class="mb-4">
                    <label class="block mb-2 font-semibold text-gray-700">Show Date</label>
                    <asp:TextBox ID="txtShowDate" runat="server" CssClass="border rounded-md w-full p-2" TextMode="Date"></asp:TextBox>
                </div>

                <div class="mb-4">
                    <label class="block mb-2 font-semibold text-gray-700">Show Time</label>
                    <asp:TextBox ID="txtShowTime" runat="server" CssClass="border rounded-md w-full p-2" TextMode="Time"></asp:TextBox>
                </div>

                <div class="mb-4">
                    <label class="block mb-2 font-semibold text-gray-700">Language</label>
                    <asp:TextBox ID="txtLanguage" runat="server" CssClass="border rounded-md w-full p-2"></asp:TextBox>
                </div>

                <div class="mb-6">
                    <label class="block mb-2 font-semibold text-gray-700">Status</label>
                    <asp:DropDownList ID="ddlStatus" runat="server" CssClass="border rounded-md w-full p-2">
                        <asp:ListItem Text="Active" Value="Active" />
                        <asp:ListItem Text="Inactive" Value="Inactive" />
                    </asp:DropDownList>
                </div>

                <div class="flex justify-end gap-3">
                    <asp:Button ID="btnUpdate" runat="server" Text="Update" CssClass="bg-red-500 hover:bg-red-600 text-white px-4 py-2 rounded-md"
                        OnClick="btnUpdate_Click" />
                    <button type="button" onclick="closeModal()" class="bg-gray-400 hover:bg-gray-500 text-white px-4 py-2 rounded-md">Cancel</button>
                </div>
            </div>
        </div>

        <!-- Delete Confirmation Modal -->
        <div id="deleteModal" class="fixed inset-0 bg-black bg-opacity-50 hidden flex items-center justify-center z-50">
            <div class="bg-white rounded-xl shadow-2xl p-6 w-full max-w-md text-center transform transition-all duration-300 scale-100">
                <h2 class="text-2xl font-bold text-gray-800 mb-4">Confirm Delete</h2>
                <p class="text-gray-600 mb-6">Are you sure you want to delete this showing?</p>
                <asp:HiddenField ID="hfMovieID" runat="server" />
                <asp:HiddenField ID="HiddenField1" runat="server" />
                <div class="flex justify-center gap-4">
                    <asp:Button ID="btnConfirmDelete" runat="server" Text="Yes, Delete"
                        CssClass="bg-red-600 hover:bg-red-700 text-white px-5 py-2 rounded-lg"
                        OnClick="btnConfirmDelete_Click" />
                    <button type="button" id="cancelDeleteBtn"
                        class="bg-gray-300 hover:bg-gray-400 text-gray-800 px-5 py-2 rounded-lg">
                        Cancel
                    </button>
                </div>
            </div>
        </div>


        <div id="toast" class="fixed top-14 right-5 z-[99999] text-white px-4 py-3 rounded-lg shadow-lg hidden transition-all duration-500 ease-in-out transform translate-y-5 opacity-0">
        </div>



        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

        <script type="text/javascript">
            function showModal() {
                document.getElementById('editModal').classList.remove('hidden');
                document.getElementById('editModal').classList.add('flex');
            }

            function closeModal() {
                document.getElementById('editModal').classList.remove('flex');
                document.getElementById('editModal').classList.add('hidden');
            }

            function showToast(message, type) {
                const toast = document.getElementById('toast');
                if (!toast) return;

                const bgColor = type === 'success' ? '#16a34a' : '#dc2626'; // green / red
                toast.style.backgroundColor = bgColor;

                toast.textContent = message;
                toast.classList.remove('hidden');
                toast.style.opacity = '1';
                toast.style.transform = 'translateY(0)';

                setTimeout(() => {
                    toast.style.opacity = '0';
                    toast.style.transform = 'translateY(20px)';
                    setTimeout(() => toast.classList.add('hidden'), 500);
                }, 3000);
            }

            window.addEventListener('DOMContentLoaded', () => {
                const params = new URLSearchParams(window.location.search);

                if (params.get('updated') === 'true') {
                    showToast('Showing updated successfully!', 'success');
                }

                if (params.get('deleted') === 'true') {
                    showToast('Showing deleted successfully!', 'success');
                }

                if (params.get('updated') === 'true' || params.get('deleted') === 'true') {
                    // ✅ Wait before removing from URL
                    setTimeout(() => {
                        params.delete('updated');
                        params.delete('deleted');
                        const newUrl = window.location.pathname + (params.toString() ? '?' + params.toString() : '');
                        window.history.replaceState({}, document.title, newUrl);
                    }, 500);
                }
            });


            function confirmDelete(movieId, showingId) {
                document.getElementById('<%= hfMovieID.ClientID %>').value = movieId;
                document.getElementById('<%= hfShowingID.ClientID %>').value = showingId;
                document.getElementById('deleteModal').classList.remove('hidden');
            }

            document.getElementById('cancelDeleteBtn').addEventListener('click', function () {
                document.getElementById('deleteModal').classList.add('hidden');
            });
        </script>



    </main>
</asp:Content>
