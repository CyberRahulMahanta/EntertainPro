<%@ Page Title="" Language="C#" MasterPageFile="~/AdminSite.Master" AutoEventWireup="true" CodeBehind="AdminMovieDetails.aspx.cs" Inherits="EntertainPro.AdminMovieDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        /* Hide the actual file input */
        .hidden-file-input {
            opacity: 0;
            position: absolute;
            z-index: -1;
            width: 0.1px;
            height: 0.1px;
            overflow: hidden;
            pointer-events: none;
            white-space: nowrap;
        }

        /* Style for your custom button/icon */
        .custom-file-upload-button {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            padding: 0.75rem 1.25rem;
            border-radius: 0.5rem;
            font-weight: 600;
            background-color: #EF4444; /* red-600 */
            color: #ffffff; /* Text white */
            box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1);
            transition: background-color 0.2s ease-in-out;
            border: 2px solid transparent; /* Added for focus styling */
        }

            .custom-file-upload-button:hover {
                background-color: #DC2626; /* red-700 */
            }

            .custom-file-upload-button:focus {
                outline: none;
                border-color: #FEF3F2; /* Optional: light red border on focus */
                box-shadow: 0 0 0 3px rgba(239, 68, 68, 0.5);
            }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <main class="flex-1 p-6 md:p-8">
        <div class="mb-8">
            <div class="mb-8 flex items-center justify-between">
                <div>
                    <h1 class="text-3xl md:text-4xl font-extrabold mb-2 flex items-center gap-3">
                        <svg class="w-10 h-10 text-red-500 animate-bounce" viewBox="0 0 24 24" fill="none"
                            xmlns="http://www.w3.org/2000/svg">
                            <g id="SVGRepo_bgCarrier" stroke-width="0"></g>
                            <g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g>
                            <g id="SVGRepo_iconCarrier">
                                <path
                                    d="M21.9998 12.6978C21.9983 14.1674 21.9871 15.4165 21.9036 16.4414C21.8067 17.6308 21.6081 18.6246 21.1636 19.45C20.9676 19.814 20.7267 20.1401 20.4334 20.4334C19.601 21.2657 18.5405 21.6428 17.1966 21.8235C15.8835 22 14.2007 22 12.0534 22H11.9466C9.79929 22 8.11646 22 6.80345 21.8235C5.45951 21.6428 4.39902 21.2657 3.56664 20.4334C2.82871 19.6954 2.44763 18.777 2.24498 17.6376C2.04591 16.5184 2.00949 15.1259 2.00192 13.3967C2 12.9569 2 12.4917 2 12.0009V11.9466C1.99999 9.79929 1.99998 8.11646 2.17651 6.80345C2.3572 5.45951 2.73426 4.39902 3.56664 3.56664C4.39902 2.73426 5.45951 2.3572 6.80345 2.17651C7.97111 2.01952 9.47346 2.00215 11.302 2.00024C11.6873 1.99983 12 2.31236 12 2.69767C12 3.08299 11.6872 3.3952 11.3019 3.39561C9.44749 3.39757 8.06751 3.41446 6.98937 3.55941C5.80016 3.7193 5.08321 4.02339 4.5533 4.5533C4.02339 5.08321 3.7193 5.80016 3.55941 6.98937C3.39683 8.19866 3.39535 9.7877 3.39535 12C3.39535 12.2702 3.39535 12.5314 3.39567 12.7844L4.32696 11.9696C5.17465 11.2278 6.45225 11.2704 7.24872 12.0668L11.2392 16.0573C11.8785 16.6966 12.8848 16.7837 13.6245 16.2639L13.9019 16.0689C14.9663 15.3209 16.4064 15.4076 17.3734 16.2779L20.0064 18.6476C20.2714 18.091 20.4288 17.3597 20.5128 16.3281C20.592 15.3561 20.6029 14.1755 20.6044 12.6979C20.6048 12.3126 20.917 12 21.3023 12C21.6876 12 22.0002 12.3125 21.9998 12.6978Z"
                                    fill="currentColor">
                                </path>
                                <path fill-rule="evenodd" clip-rule="evenodd"
                                    d="M17.5 11C15.3787 11 14.318 11 13.659 10.341C13 9.68198 13 8.62132 13 6.5C13 4.37868 13 3.31802 13.659 2.65901C14.318 2 15.3787 2 17.5 2C19.6213 2 20.682 2 21.341 2.65901C22 3.31802 22 4.37868 22 6.5C22 8.62132 22 9.68198 21.341 10.341C20.682 11 19.6213 11 17.5 11ZM19.7121 4.28794C20.096 4.67187 20.096 5.29434 19.7121 5.67826L19.6542 5.7361C19.5984 5.7919 19.5205 5.81718 19.4428 5.80324C19.3939 5.79447 19.3225 5.77822 19.2372 5.74864C19.0668 5.68949 18.843 5.5778 18.6326 5.36742C18.4222 5.15704 18.3105 4.93324 18.2514 4.76276C18.2218 4.67751 18.2055 4.60607 18.1968 4.55721C18.1828 4.47953 18.2081 4.40158 18.2639 4.34578L18.3217 4.28794C18.7057 3.90402 19.3281 3.90402 19.7121 4.28794ZM17.35 8.0403C17.2057 8.18459 17.1336 8.25673 17.054 8.31878C16.9602 8.39197 16.8587 8.45472 16.7512 8.50591C16.6602 8.54932 16.5634 8.58158 16.3698 8.64611L15.349 8.98639C15.2537 9.01814 15.1487 8.99335 15.0777 8.92234C15.0067 8.85134 14.9819 8.74631 15.0136 8.65104L15.3539 7.63021C15.4184 7.43662 15.4507 7.33983 15.4941 7.24876C15.5453 7.14133 15.608 7.0398 15.6812 6.94596C15.7433 6.86642 15.8154 6.79427 15.9597 6.65L17.7585 4.85116C17.802 4.80767 17.8769 4.82757 17.8971 4.88568C17.9707 5.09801 18.109 5.37421 18.3674 5.63258C18.6258 5.89095 18.902 6.02926 19.1143 6.10292C19.1724 6.12308 19.1923 6.19799 19.1488 6.24148L17.35 8.0403Z"
                                    fill="currentColor">
                                </path>
                            </g>
                        </svg>

                        <span
                            class="bg-gradient-to-r from-red-500 via-pink-500 to-purple-500 bg-clip-text text-transparent">Editing Movies Details</span>
                    </h1>
                    <p class="text-gray-500 text-sm md:text-base">
                        Editing and updating movie information.
                    </p>
                </div>
                <div>
                    <button type="button" id="btnEditSave"
                        onclick="toggleEditMode()"
                        class="flex items-center gap-2 px-5 py-2.5 bg-red-600 text-white font-semibold rounded-lg shadow-md hover:bg-red-700 focus:ring-2 focus:ring-red-400 focus:outline-none transition duration-200">

                        <svg class="w-5 h-5" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <path d="M4 5L15 5" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"></path>
                            <path d="M4 8H15" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"></path>
                            <path d="M4 11H11" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"></path>
                            <path d="M18.4563 13.5423L13.9268 18.0719C13.6476 18.3511 13.292 18.5414 12.9048 18.6188L10.8153 19.0367L11.2332 16.9472C11.3106 16.5601 11.5009 16.2045 11.7801 15.9253L16.3096 11.3957M18.4563 13.5423L19.585 12.4135C19.9755 12.023 19.9755 11.3898 19.585 10.9993L18.8526 10.2669C18.4621 9.8764 17.8289 9.8764 17.4384 10.2669L16.3096 11.3957M18.4563 13.5423L16.3096 11.3957" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"></path>
                        </svg>
                        <span id="buttonText">Edit Details</span>
                    </button>
                </div>
            </div>
        </div>

        <div class="max-w-4xl mx-auto">
            <asp:Label ID="lblTitle" runat="server" class="text-3xl font-bold text-gray-900 mb-6 block text-center"></asp:Label>

            <div class="flex flex-col md:flex-row gap-6">

                <div class="flex-shrink-0 -ml-8 -mt-6 relative" style="width: 270px; height: 380px;">
                    <asp:Image ID="imgPoster" runat="server" CssClass="rounded-xl object-cover w-full h-full" />

                    <div id="imageEditOverlay" class="absolute inset-0 flex items-center justify-center bg-black bg-opacity-50 rounded-xl hidden movie-edit-mode">
                        <div class="text-white p-4 text-center">

                            <asp:FileUpload ID="filePoster" runat="server" CssClass="hidden-file-input" />

                            <label for="<%= filePoster.ClientID %>" class="custom-file-upload-button">
                                <svg class="w-6 h-6" fill="currentColor" viewBox="0 0 16 16" xmlns="http://www.w3.org/2000/svg">
                                    <g id="SVGRepo_bgCarriers" stroke-width="0"></g>
                                    <g id="SVGRepo_tracerCarriers" stroke-linecap="round" stroke-linejoin="round"></g>
                                    <g id="SVGRepo_iconCarriers">
                                        <path d="M9 3.793V9H7V3.864L5.914 4.95 4.5 3.536 8.036 0l.707.707.707.707 2.121 2.122-1.414 1.414L9 3.793zM16 11v5H0v-5h2v3h12v-3h2z" fill-rule="evenodd"></path>
                                    </g>
                                </svg>
                                <span class="ml-2">Upload Image</span>
                            </label>

                            <asp:Label ID="lblFileName" runat="server" CssClass="block text-sm mt-2"></asp:Label>
                        </div>
                    </div>
                </div>

                <div class="flex-1 space-y-3 text-gray-700">

                    <div class="flex items-center">
                        <span class="font-semibold text-sm uppercase tracking-wide text-gray-500 mr-6 w-24">Genre:</span>
                        <asp:Label ID="lblGenre" runat="server" class="text-base movie-display-mode"></asp:Label>
                        <asp:TextBox ID="txtGenre" runat="server" class="text-base hidden movie-edit-mode border rounded-md p-1 flex-1"></asp:TextBox>
                    </div>

                    <div class="flex items-center">
                        <span class="font-semibold text-sm uppercase tracking-wide text-gray-500 mr-6 w-24">Category:</span>

                        <asp:Label ID="lblCategory" runat="server" class="text-base movie-display-mode"></asp:Label>

                        <div class="hidden movie-edit-mode flex-1">
                            <asp:DropDownList ID="ddlCategory" runat="server"
                                CssClass="w-full px-3 py-2 border-2 border-gray-200 rounded-lg focus:ring-4 focus:ring-red-300 focus:border-red-500 text-sm bg-white">
                                <asp:ListItem Text="Select Category" Value=""></asp:ListItem>
                                <asp:ListItem Text="Upcoming" Value="Upcoming"></asp:ListItem>
                                <asp:ListItem Text="Showing" Value="Showing"></asp:ListItem>
                                <asp:ListItem Text="Top" Value="Top"></asp:ListItem>
                                <asp:ListItem Text="Popular" Value="Popular"></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>

                    <div class="flex items-center">
                        <span class="font-semibold text-sm uppercase tracking-wide text-gray-500 mr-6 w-24">Subcategory:</span>

                        <asp:Label ID="lblSubCategory" runat="server" class="text-base movie-display-mode"></asp:Label>

                        <div class="hidden movie-edit-mode flex-1">
                            <asp:DropDownList ID="ddlSubCategory" runat="server"
                                CssClass="w-full px-3 py-2 border-2 border-gray-200 rounded-lg focus:ring-4 focus:ring-red-300 focus:border-red-500 text-sm bg-white">
                                <asp:ListItem Text="Select SubCategory" Value=""></asp:ListItem>
                                <asp:ListItem Text="Showing" Value="Showing"></asp:ListItem>
                                <asp:ListItem Text="Upcoming" Value="Upcoming"></asp:ListItem>
                                <asp:ListItem Text="Released" Value="Released"></asp:ListItem>
                                <asp:ListItem Text="Best of Library" Value="Best of Library"></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>

                    <div class="flex items-center">
                        <span class="font-semibold text-sm uppercase tracking-wide text-gray-500 mr-6 w-24">Rating:</span>
                        <asp:Label ID="lblRating" runat="server" class="text-base movie-display-mode"></asp:Label>
                        <asp:TextBox ID="txtRating" runat="server" class="text-base hidden movie-edit-mode border rounded-md p-1 flex-1"></asp:TextBox>
                    </div>

                    <div class="flex items-center">
                        <span class="font-semibold text-sm uppercase tracking-wide text-gray-500 mr-6 w-24">Language:</span>
                        <asp:Label ID="lblLanguage" runat="server" class="text-base movie-display-mode"></asp:Label>
                        <asp:TextBox ID="txtLanguage" runat="server" class="text-base hidden movie-edit-mode border rounded-md p-1 flex-1"></asp:TextBox>
                    </div>

                    <div class="flex items-center">
                        <span class="font-semibold text-sm uppercase tracking-wide text-gray-500 mr-6 w-24">Duration:</span>
                        <asp:Label ID="lblDuration" runat="server" class="text-base movie-display-mode"></asp:Label>
                        <asp:TextBox ID="txtDuration" runat="server" class="text-base hidden movie-edit-mode border rounded-md p-1 flex-1"></asp:TextBox>
                    </div>

                    <div class="flex items-center">
                        <span class="font-semibold text-sm uppercase tracking-wide text-gray-500 mr-6 w-24">Release Date:</span>
                        <asp:Label ID="lblReleaseDate" runat="server" class="text-base movie-display-mode"></asp:Label>
                        <asp:TextBox ID="txtReleaseDate" runat="server" TextMode="Date" class="text-base hidden movie-edit-mode border rounded-md p-1 flex-1"></asp:TextBox>
                    </div>

                    <div class="flex items-center">
                        <span class="font-semibold text-sm uppercase tracking-wide text-gray-500 mr-6 w-24">Trailer:</span>
                        <asp:Label ID="lblTrailer" runat="server" class="text-base text-blue-600 hover:text-blue-800 underline movie-display-mode"></asp:Label>
                        <asp:TextBox ID="txtTrailer" runat="server" class="text-base hidden movie-edit-mode border rounded-md p-1 flex-1"></asp:TextBox>
                    </div>

                </div>
            </div>
        </div>

        <asp:ScriptManager runat="server"></asp:ScriptManager>

        <div id="toastMessage"
            class="fixed top-16 right-5 bg-green-600 text-white px-4 py-2 rounded-lg shadow-lg hidden z-50">
        </div>


        <script type="text/javascript">
            function toggleEditMode() {
                var buttonText = document.getElementById('buttonText');
                var form = document.getElementById('form1');
                var currentText = buttonText.innerText.trim();

                if (currentText === "Save Details") {
                    var hiddenField = document.createElement('input');
                    hiddenField.type = 'hidden';
                    hiddenField.name = 'action';
                    hiddenField.value = 'save';
                    form.appendChild(hiddenField);
                    form.submit();
                } else {
                    buttonText.innerText = "Save Details";
                    var displayElements = document.querySelectorAll('.movie-display-mode');
                    var editElements = document.querySelectorAll('.movie-edit-mode');

                    displayElements.forEach(function (el) {
                        el.classList.add('hidden');
                    });
                    editElements.forEach(function (el) {
                        el.classList.remove('hidden');
                    });
                }
            }
            document.addEventListener('DOMContentLoaded', function () {
                var fileInput = document.getElementById('<%= filePoster.ClientID %>');
                var fileNameLabel = document.getElementById('<%= lblFileName.ClientID %>');
                var imageOverlay = document.getElementById('imageEditOverlay');
                var textContainer = imageOverlay.querySelector('.text-white.p-4.text-center');

                if (fileInput && fileNameLabel && imageOverlay) {

                    if (textContainer) {
                        textContainer.style.backgroundColor = 'rgba(0, 0, 0, 0.5)';
                        textContainer.style.borderRadius = '0.5rem';
                        textContainer.style.padding = '1rem';
                    }


                    fileInput.addEventListener('change', function (e) {
                        if (fileInput.files.length > 0) {
                            var file = fileInput.files[0];
                            fileNameLabel.innerText = file.name;
                            var reader = new FileReader();

                            reader.onload = function (e) {
                                imageOverlay.style.backgroundImage = 'url(' + e.target.result + ')';

                                imageOverlay.style.backgroundSize = 'cover';
                                imageOverlay.style.backgroundPosition = 'center';
                                imageOverlay.style.backgroundRepeat = 'no-repeat';
                            };

                            reader.readAsDataURL(file);

                        } else {
                            fileNameLabel.innerText = '';
                            imageOverlay.style.backgroundImage = 'none';
                        }
                    });
                }
            });
            function showToast(message, bgColor = "bg-green-600") {
                const toast = document.getElementById("toastMessage");
                toast.textContent = message;
                toast.className = `fixed top-16 right-5 bg-green-600 text-white px-4 py-2 rounded-lg shadow-lg hidden z-50 ${bgColor}`;
                toast.classList.remove("hidden");

                setTimeout(() => {
                    toast.classList.add("hidden");
                }, 3000);
            }
        </script>
    </main>
</asp:Content>
