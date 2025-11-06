let ticketSalesChart; // Declare globally so resizeChart() can access it

document.addEventListener('DOMContentLoaded', function () {
    if (typeof chartData === "undefined" || chartData.length === 0) {
        console.warn("No data for chart");
        return;
    }

    const labels = chartData.map(item => {
        const date = new Date(item.BookingDay);
        const shortDay = date.toLocaleDateString('en-US', { weekday: 'short' });
        const dayNumber = date.getDate();
        return `${shortDay} (${dayNumber})`;
    });

    const values = chartData.map(item => item.TotalTickets);

    const ctx = document.getElementById('ticketSalesChart');
    if (ctx) {
        // ✅ Assign chart instance to global variable
        ticketSalesChart = new Chart(ctx, {
            type: 'line',
            data: {
                labels: labels,
                datasets: [{
                    label: 'Tickets Sold',
                    data: values,
                    borderColor: '#dc2626',
                    backgroundColor: 'rgba(220,38,38,0.1)',
                    fill: true,
                    tension: 0.35
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                plugins: { legend: { display: false } },
                scales: {
                    x: { grid: { display: false } },
                    y: { grid: { color: '#e2e8f0' }, beginAtZero: true }
                }
            }
        });
    }
});

/**
 * ✅ Helper function to trigger chart resize after sidebar animation.
 */
const resizeChart = () => {
    if (ticketSalesChart) {
        setTimeout(() => {
            ticketSalesChart.resize();
        }, 350);
    }
};


// --- 2. Sidebar Resizing and Toggling Logic (Integrated with Chart Resize) ---

const sidebar = document.getElementById('sidebar');
const mainContent = document.getElementById('main-content');
const resizer = document.getElementById('sidebar-resizer');
const menuButton = document.getElementById('menu-button');
const sidebarOverlay = document.getElementById('sidebar-overlay');
const collapseToggleBtn = document.getElementById('collapse-toggle-btn');
const collapseIcon = document.getElementById('collapse-icon');

// NEW: Reference to the text element inside the button
const collapseText = collapseToggleBtn.querySelector('.nav-text');

const DEFAULT_WIDTH = 260;
const COLLAPSED_WIDTH = 80;
const MAX_WIDTH = 400;
const RESIZE_THRESHOLD = 120;
let currentWidth = DEFAULT_WIDTH;
let isResizing = false;

// Function to update CSS variables and element styles
function updateLayout(width) {
    currentWidth = Math.min(Math.max(COLLAPSED_WIDTH, width), MAX_WIDTH);
    document.documentElement.style.setProperty('--sidebar-width', `${currentWidth}px`);

    if (currentWidth <= RESIZE_THRESHOLD) {
        document.body.classList.add('sidebar-collapsed');
        document.documentElement.style.setProperty('--sidebar-width', `${COLLAPSED_WIDTH}px`);
        currentWidth = COLLAPSED_WIDTH;

        // COLLAPSED STATE: Icon and Text update
        // SVG for Expand (pointing right)
        collapseIcon.innerHTML = `<polyline points="9 17 4 12 9 7" /> <path d="M20 18v-2a4 4 0 0 0-4-4H4" />`;
        collapseText.textContent = '';
    } else {
        document.body.classList.remove('sidebar-collapsed');

        // EXPANDED STATE: Icon and Text update
        // SVG for Collapse (pointing left)
        collapseIcon.innerHTML = `<polyline points="15 17 20 12 15 7" /> <path d="M4 18v-2a4 4 0 0 1 4-4h12" />`;
        collapseText.textContent = 'Collapse Menu';
    }
}

// Initialize layout on load
updateLayout(DEFAULT_WIDTH);

// Resizing functionality
resizer.addEventListener('mousedown', (e) => {
    if (window.innerWidth >= 768) { // Only enable resizing on desktop
        e.preventDefault();
        isResizing = true;
        // Temporarily disable transitions during drag for smoothness
        sidebar.style.transition = 'none';
        mainContent.style.transition = 'none';
        document.body.style.cursor = 'col-resize';
    }
});

document.addEventListener('mousemove', (e) => {
    if (!isResizing) return;
    // Calculate new width from the mouse position
    const newWidth = e.clientX;
    updateLayout(newWidth);
});

document.addEventListener('mouseup', () => {
    if (isResizing) {
        isResizing = false;
        // Re-enable transitions after drag finishes
        sidebar.style.transition = 'width 300ms ease, transform 300ms ease';
        mainContent.style.transition = 'margin-left 300ms ease';
        document.body.style.cursor = '';

        // 🔥 FIX 1: Resize the chart after manual drag ends
        resizeChart();
    }
});

// Toggle Collapse functionality (Button click)
collapseToggleBtn.addEventListener('click', () => {
    if (document.body.classList.contains('sidebar-collapsed')) {
        updateLayout(DEFAULT_WIDTH); // Expand
    } else {
        updateLayout(COLLAPSED_WIDTH); // Collapse
    }

    // 🔥 FIX 2: Resize the chart after toggle button click (with a timeout)
    resizeChart();
});

// Mobile Menu Toggle
// ... (Your existing mobile logic) ...
menuButton.addEventListener('click', () => {
    sidebar.classList.toggle('is-visible');
    sidebarOverlay.classList.toggle('hidden');
});

sidebarOverlay.addEventListener('click', () => {
    sidebar.classList.remove('is-visible');
    sidebarOverlay.classList.add('hidden');
});

// Handle visibility and chart on window resize
window.addEventListener('resize', () => {
    if (window.innerWidth >= 768) {
        if (document.body.classList.contains('sidebar-collapsed')) {
            updateLayout(COLLAPSED_WIDTH);
        } else {
            updateLayout(currentWidth);
        }
        sidebar.classList.remove('is-visible');
        sidebarOverlay.classList.add('hidden');

        // 🔥 FIX 3: Resize the chart on general window resize
        resizeChart();
    }
});

// Current time header update (utility)
function updateTime() {
    const now = new Date();
    const timeString = now.toLocaleTimeString('en-US', { hour: '2-digit', minute: '2-digit' });
    const dateString = now.toLocaleDateString('en-US', { weekday: 'short', month: 'short', day: 'numeric' });
    document.getElementById('current-time').textContent = `${dateString} | ${timeString}`;
}
setInterval(updateTime, 1000);
updateTime();


document.addEventListener("DOMContentLoaded", function () {
    const navLinks = document.querySelectorAll(".nav-link");

    // Restore active from localStorage
    const activeHref = localStorage.getItem("activeNav");
    if (activeHref) {
        navLinks.forEach(link => {
            if (link.getAttribute("href") === activeHref) {
                link.classList.add("active");
            }
        });
    }

    // Add click listener to each link
    navLinks.forEach(link => {
        link.addEventListener("click", function () {
            navLinks.forEach(l => l.classList.remove("active"));
            this.classList.add("active");
            localStorage.setItem("activeNav", this.getAttribute("href"));
        });
    });
});


// Amdin Avatar js code
const clickArea = document.getElementById('avatar-click-area');
const dropdown = document.getElementById('avatar-dropdown');
const arrow = document.getElementById('dropdown-arrow');

clickArea.addEventListener('click', () => {
    dropdown.classList.toggle('hidden');

    if (!dropdown.classList.contains('hidden')) {
        // Show dropdown
        dropdown.classList.remove('opacity-0', 'scale-95');
        dropdown.classList.add('opacity-100', 'scale-100');
        arrow.classList.add('rotate-180'); // Rotate arrow down
    } else {
        // Hide dropdown
        dropdown.classList.remove('opacity-100', 'scale-100');
        dropdown.classList.add('opacity-0', 'scale-95');
        arrow.classList.remove('rotate-180'); // Rotate arrow back
    }
});

const bell = document.getElementById('notification-bell');
const notification_dropdown = document.getElementById('notification-dropdown');

bell.addEventListener('click', (e) => {
    e.stopPropagation();
    notification_dropdown.classList.toggle('hidden');
});

// Close when clicking outside
document.addEventListener('click', (e) => {
    if (!bell.contains(e.target) && !notification_dropdown.contains(e.target)) {
        notification_dropdown.classList.add('hidden');
    }
});
