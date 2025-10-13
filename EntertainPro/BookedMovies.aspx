<%@ Page Title="My Bookings" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="BookedMovies.aspx.cs" Inherits="EntertainPro.BookedMovies" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="css/BookedMovies.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>

    <style>
        /* Small style addition for the navigation section */
        .ticket-navigation {
            display: flex;
            justify-content: space-between;
            align-items: center;
            max-width: 800px;
            margin: 0 auto 20px auto;
            padding: 0 10px;
        }

        .ticket-counter {
            font-weight: 600;
            font-size: 1.1em;
            color: #555;
        }

        .action-button {
            display: inline-block; /* instead of block or width:100% */
            width: auto;
            background-color: #e63946;
            color: white;
            padding: 10px 20px;
            border-radius: 5px;
            text-decoration: none;
            transition: background 0.3s;
        }

            .action-button:hover {
                background-color: #d62828;
            }
    </style>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <asp:DataList ID="dlBookings" runat="server" RepeatDirection="Vertical" Width="100%">
        <ItemTemplate>
            <div class="ticket-card">
                <header class="ticket-header">
                    <div id="toastMessage" style="display: none; position: fixed; top: 100px; right: 20px; padding: 15px 25px; color: #fff; border-radius: 5px; font-weight: bold; z-index: 9999;"></div>


                    <div class="ticket-logo">
                        <img src="favicon_io/android-chrome-512x512.png" alt="Entertain Logo" class="logo-img">
                        <span class="logo-text">Entertain<span class="logo-pro-container"><i class="fa fa-video-camera logo-icon"></i><span class="logo-pro-text">Pro</span></span></span>
                    </div>
                    <div class="ticket-notice">
                        <div class="notice-text-wrapper">
                            <span class="notice-text">THIS IS</span><div class="notice-highlight"><span class="highlight-bg"></span><span class="highlight-text">NOT</span></div>
                            <span class="notice-text">YOUR TICKET</span>
                        </div>
                        <p class="notice-subtext">Exchange this at the box office for your ticket.</p>
                    </div>
                </header>
                <main class="ticket-body">
                    <div class="greeting-header">
                        <p class="greeting">Dear <%# Eval("FullName") %>,</p>
                        <div class="header-actions">
                            <asp:LinkButton ID="btnDownload" CommandName="Download" CommandArgument='<%# Eval("PaymentID") %>' runat="server" OnClick="btnDownload_Click" CssClass="action-button" title="Download Ticket">
                                        <i class="fa-solid fa-download"></i> <span>Download</span>
                            </asp:LinkButton>
                            <div class="information-icon js-open-modal" title="Information">
                                <i class="fa-solid fa-circle-info icon-large"></i>
                            </div>
                            <asp:LinkButton ID="btnNotify" runat="server" CssClass="notification-icon" OnClick="btnNotify_Click" title="Send Notification">
                                <i class="fa-solid fa-bell"></i>
                            </asp:LinkButton>

                        </div>
                    </div>
                    <div class="ticket-main-section">
                        <div class="ticket-cutout"></div>
                        <div class="ticket-top-info">
                            <div class="movie-and-ids">
                                <div class="movie-poster">
                                    <img src='<%# Eval("PosterUrl") %>' alt='<%# Eval("MovieTitle") %>' class="poster-img" />
                                </div>
                                <div class="ticket-ids">
                                    <div class="info-line">
                                        <svg xmlns="http://www.w3.org/2000/svg" class="icon" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                                            <path stroke-linecap="round" stroke-linejoin="round" d="M15 5v2m0 4v2m0 4v2M5 5a2 2 0 00-2 2v3a2 2 0 110 4v3a2 2 0 002 2h14a2 2 0 002-2v-3a2 2 0 110-4V7a2 2 0 00-2-2H5z" />
                                        </svg>
                                        <span class="info-label">BOOKING ID:</span>
                                        <span class="info-value-mono"><%# Eval("PaymentID") %></span>
                                    </div>
                                    <div class="info-line">
                                        <svg xmlns="http://www.w3.org/2000/svg" class="icon" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                                            <path stroke-linecap="round" stroke-linejoin="round" d="M15 5v2m0 4v2m0 4v2M5 5a2 2 0 00-2 2v3a2 2 0 110 4v3a2 2 0 002 2h14a2 2 0 002-2v-3a2 2 0 110-4V7a2 2 0 00-2-2H5z" />
                                        </svg>
                                        <span class="info-label">TOTAL PRICE:</span>
                                        <span class="info-value-mono"><%# Eval("TotalPrice", "{0:C}") %></span>
                                    </div>
                                    <div class="info-line payment-status">
                                        <svg xmlns="http://www.w3.org/2000/svg" class="icon" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                                            <path stroke-linecap="round" stroke-linejoin="round" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z" />
                                        </svg>
                                        <span class="info-label">STATUS:</span>
                                        <%# GetStatusBadge(Eval("PaymentStatus")) %>
                                    </div>
                                </div>
                            </div>
                            <div class="qr-code">
                                <img src='<%# GetQrCodeUrl(Eval("QrCodeImage")) %>' alt="QR Code not found" heignt="180" width="180" />
                            </div>
                        </div>
                        <div class="ticket-bottom-details">
                            <div class="detail-box movie-info">
                                <div class="detail-line">
                                    <svg xmlns="http://www.w3.org/2000/svg" class="icon-large" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                                        <path stroke-linecap="round" stroke-linejoin="round" d="M15 5v2m0 4v2m0 4v2M5 5a2 2 0 00-2 2v3a2 2 0 110 4v3a2 2 0 002 2h14a2 2 0 002-2v-3a2 2 0 110-4V7a2 2 0 00-2-2H5z" />
                                    </svg>
                                    <div class="detail-title"><%# Eval("MovieTitle") %></div>
                                </div>
                                <div class="detail-line">
                                    <i class="fa-solid fa-desktop icon-large"></i>

                                    <div class="detail-text"><%# Eval("ScreenName") %></div>
                                </div>
                            </div>
                            <div class="detail-box">
                                <div class="detail-line detail-line-padded">
                                    <svg xmlns="http://www.w3.org/2000/svg" class="icon-large" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                                        <rect x="6" y="4" width="12" height="8" rx="2" ry="2"></rect><rect x="4" y="12" width="16" height="4" rx="1" ry="1"></rect><line x1="6" y1="16" x2="6" y2="20"></line><line x1="18" y1="16" x2="18" y2="20"></line></svg>
                                    <div class="detail-title">Seats: <%# Eval("AllSeats") %></div>
                                </div>
                                <div class="show-time">
                                    <div class="time-section">
                                        <svg xmlns="http://www.w3.org/2000/svg" class="icon-large" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                                            <path stroke-linecap="round" stroke-linejoin="round" d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z" />
                                        </svg>
                                        <div class="detail-text-semibold"><%# Convert.ToDateTime(Eval("FullShowTime")).ToString("ddd, dd MMM, yyyy") %></div>
                                    </div>
                                    <div class="time-section time-section-bordered">
                                        <svg xmlns="http://www.w3.org/2000/svg" class="icon-large" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                                            <path stroke-linecap="round" stroke-linejoin="round" d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z" />
                                        </svg>
                                        <div class="detail-text-semibold"><%# Convert.ToDateTime(Eval("FullShowTime")).ToString("h:mm tt") %></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
            </div>
        </ItemTemplate>
    </asp:DataList>

    <asp:Panel ID="ticket_navigation" runat="server" Visible="false">
        <div class="ticket-navigation">
            <asp:LinkButton ID="btnPrevious" runat="server" OnClick="btnPrevious_Click" CssClass="action-button nav-button">
                <i class="fa-solid fa-arrow-left"></i> <span>Previous Ticket</span>
            </asp:LinkButton>
            <asp:LinkButton ID="btnNext" runat="server" OnClick="btnNext_Click" CssClass="action-button nav-button">
                <span>Next Ticket</span> <i class="fa-solid fa-arrow-right"></i>
            </asp:LinkButton>
        </div>
    </asp:Panel>

    <asp:Panel ID="pnlNoBookings" runat="server" Visible="false">
        <div class="not-found-message">
            <h2>No Bookings Found</h2>
            <p>You haven't booked any movie tickets yet. Why not book one now?</p>
            <a href="index.aspx" class="action-button">Browse Movies</a>
        </div>
    </asp:Panel>

    <div class="modal-overlay js-modal">
        <div class="modal-content">
            <div class="modal-header-gradient">
                <h2>Important Information</h2>
                <span class="close-button js-close-modal">&times;</span>
            </div>
            <div class="modal-body-content">
                <p>Please review the following essential details regarding your booking:</p>
                <ul class="info-list">
                    <li><i class="fas fa-ticket-alt list-icon"></i>This confirmation must be shown at the box office to collect your physical tickets.</li>
                    <li><i class="fas fa-ban list-icon"></i>Tickets are non-refundable and non-cancellable once purchased.</li>
                    <li><i class="fas fa-utensils list-icon"></i>Outside food & beverages are strictly not permitted inside the cinema hall.</li>
                    <li><i class="fas fa-clock list-icon"></i>Please arrive at least <strong>20 minutes</strong> prior to the showtime for a smooth entry process.</li>
                    <li><i class="fas fa-headphones-alt list-icon"></i>For 3D movies, 3D glasses may require a separate purchase or rental.</li>
                </ul>
                <div class="modal-footer">
                    <button type="button" class="modal-button js-modal-got-it">Got It!</button>
                </div>
            </div>
        </div>
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', function () {
            // Simplified modal logic since there's only one modal on the page
            const modal = document.querySelector('.js-modal');
            const openBtn = document.querySelector('.js-open-modal');
            const closeBtns = document.querySelectorAll('.js-close-modal, .js-modal-got-it');

            function openModal() { if (modal) modal.classList.add('active'); }
            function closeModal() { if (modal) modal.classList.remove('active'); }

            if (openBtn) openBtn.addEventListener('click', openModal);
            closeBtns.forEach(btn => btn.addEventListener('click', closeModal));
            if (modal) modal.addEventListener('click', function (e) { if (e.target === this) closeModal(); });

            if (!sessionStorage.getItem('infoModalShown')) {
                // This logic will now correctly find the single modal on the page
                if (modal) {
                    openModal();
                    sessionStorage.setItem('infoModalShown', 'true');
                }
            }
        });
    </script>
</asp:Content>
