<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="SeatLayout.aspx.cs" Inherits="EntertainPro.SeatLayout" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="css/SeatLayout.css"/>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div class="seat-layout-page-wrapper">
        <div class="seat-map-container">
            <div class="screen-display">
                <div class="screen-curve"></div>
                <p>SCREEN</p>
            </div>

            <div class="legend">
                <div class="legend-item">
                    <div class="seat-legend available"></div>
                    Available
                </div>
                <div class="legend-item">
                    <div class="seat-legend selected"></div>
                    Selected
                </div>
                <div class="legend-item">
                    <div class="seat-legend occupied"></div>
                    Occupied
                </div>
            </div>

            <%-- The C# code-behind will generate and insert the seat map HTML here. --%>
            <asp:Literal ID="ltlSeatMap" runat="server"></asp:Literal>

        </div>

        <div class="booking-summary-container">
            <div class="summary-box">
                <div class="summary-section header">
                    <h2>Booking Summary</h2>
                </div>
                <div class="summary-section movie-info">
                    <%-- DYNAMIC MOVIE INFO --%>
                    <img src="<%= MovieImageUrl %>" alt="Movie Poster" />
                    <div>
                        <h3><%= MovieTitle %></h3>
                        <p><%= MovieRating %> • <%= MovieGenre %> • Hindi</p>
                        <p><%= ShowDayDateTime %></p>
                    </div>
                </div>
                <div class="summary-section">
                    <div class="summary-section-header">
                        <p class="section-title">SEAT INFO</p>
                        <p class="screen-type"><%= ScreenType %></p>
                    </div>
                    <span id="selected-seats" class="info-tag">No seat selected</span>
                </div>
                <div class="summary-section">
                    <p class="section-title">TICKETS</p>
                    <div class="summary-line-item">
                        <p id="ticket-count">0 Tickets</p>
                        <p id="ticket-total">₹ 0.00</p>
                    </div>
                </div>
                <div class="summary-section">
                    <p class="section-title">PAYMENT DETAILS</p>
                    <div class="summary-line-item">
                        <p>Sub Total</p>
                        <p id="subtotal">₹ 0.00</p>
                    </div>
                    <div class="summary-line-item secondary">
                        <p>Convenience Fee</p>
                        <p id="convenience-fee">₹ 0.00</p>
                    </div>
                    <div class="summary-line-item secondary">
                        <p>GST</p>
                        <p id="gst-fee">₹ 0.00</p>
                    </div>
                </div>
                <div class="summary-section total">
                    <div class="summary-line-item">
                        <p>Grand Total</p>
                        <p id="grand-total">₹ 0.00</p>
                    </div>
                </div>
                <div class="summary-section proceed-button-wrapper">
                    <button type="button" class="proceed-button">Proceed</button>
                </div>
            </div>
        </div>
    </div>

    <div id="limitModal" class="modal-overlay">
        <div class="modal-content">
            <h2>Alert</h2>
            <p>You can select a maximum of 10 seats.</p>
            <button id="closeModal" class="modal-button">OK</button>
        </div>
    </div>

    <script>
        document.addEventListener("DOMContentLoaded", () => {
            // --- These variables are populated dynamically by C# ---
            const seatPrices = <%= GetSeatPricesJson() %>;
            const categories = <%= GetSeatCategoriesJson() %>;

            // --- Configuration ---
            const maxSeats = 10;
            const CONVENIENCE_FEE = 19.00;
            const GST_FEE = 3.42;

            // --- State Variable ---
            let currentCategory = null;
            let rawGrandTotal = 0;

            // --- Element References ---
            const selectedSeatsEl = document.getElementById("selected-seats");
            const ticketCountEl = document.getElementById("ticket-count");
            const ticketTotalEl = document.getElementById("ticket-total");
            const subtotalEl = document.getElementById("subtotal");
            const grandTotalEl = document.getElementById("grand-total");
            const modal = document.getElementById("limitModal");
            const closeModalBtn = document.getElementById("closeModal");
            const convenienceFeeEl = document.getElementById("convenience-fee");
            const gstFeeEl = document.getElementById("gst-fee");
            const proceedBtn = document.querySelector(".proceed-button");
            const seatMapContainer = document.querySelector('.seat-map-container');

            function showModal(message) {
                modal.querySelector("p").textContent = message;
                modal.classList.add("visible");
            }

            function hideModal() {
                modal.classList.remove("visible");
            }
            if (closeModalBtn) {
                closeModalBtn.addEventListener("click", hideModal);
            }

            function getCategory(row) {
                if (categories.classic.includes(row)) return 'classic';
                if (categories.prime.includes(row)) return 'prime';
                if (categories.recliner.includes(row)) return 'recliner';
                return null;
            }

            function updateSummary() {
                const selected = [...document.querySelectorAll(".seat.selected")];
                const seats = selected.map(s => s.dataset.seat);
                let total = 0;
                seats.forEach(seat => total += seatPrices[seat.charAt(0)]);

                selectedSeatsEl.textContent = seats.length ? seats.join(", ") : "No seat selected";
                selectedSeatsEl.classList.toggle("has-selection", seats.length > 0);

                ticketCountEl.textContent = seats.length + " Tickets";
                ticketTotalEl.textContent = "₹ " + total.toFixed(2);
                subtotalEl.textContent = "₹ " + total.toFixed(2);

                let grand = total;

                if (seats.length > 0) {
                    convenienceFeeEl.textContent = "₹ " + CONVENIENCE_FEE.toFixed(2);
                    gstFeeEl.textContent = "₹ " + GST_FEE.toFixed(2);
                    grand += CONVENIENCE_FEE + GST_FEE;
                    proceedBtn.disabled = false;
                } else {
                    convenienceFeeEl.textContent = "₹ 0.00";
                    gstFeeEl.textContent = "₹ 0.00";
                    proceedBtn.disabled = true;
                }

                rawGrandTotal = grand;
                grandTotalEl.textContent = "₹ " + grand.toFixed(2);

                if (selected.length === 0) {
                    currentCategory = null;
                }
            }

            seatMapContainer.addEventListener('click', (e) => {
                const seat = e.target.closest('.seat');
                if (!seat || seat.classList.contains("occupied")) return;

                const seatRow = seat.dataset.seat[0];
                const seatCat = getCategory(seatRow);
                const isSelected = seat.classList.contains("selected");
                const currentlySelectedCount = document.querySelectorAll(".seat.selected").length;

                if (!isSelected && currentlySelectedCount >= maxSeats) {
                    showModal(`You can select a maximum of ${maxSeats} seats.`);
                    return;
                }

                if (!isSelected && currentCategory && seatCat !== currentCategory) {
                    showModal(`You can only select seats from the same category.`);
                    return;
                }

                seat.classList.toggle("selected");

                const newSelectedCount = document.querySelectorAll(".seat.selected").length;
                if (newSelectedCount > 0) {
                    if (!currentCategory) currentCategory = seatCat;
                } else {
                    currentCategory = null;
                }
                updateSummary();
            });

            proceedBtn.addEventListener('click', () => {
                const selected = [...document.querySelectorAll(".seat.selected")];
                if (selected.length === 0) return;

                const selectedSeatsString = selected.map(s => s.dataset.seat).join(",");
                const urlParams = new URLSearchParams(window.location.search);
                const showingId = urlParams.get('showingId');
                const amountInPaise = Math.round(rawGrandTotal * 100);
                const paymentUrl = `Payment.aspx?showingId=${showingId}&seats=${encodeURIComponent(selectedSeatsString)}&amount=${amountInPaise}`;
                window.location.href = paymentUrl;
            });

            updateSummary();
        });
    </script>
</asp:Content>
