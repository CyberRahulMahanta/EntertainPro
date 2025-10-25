function showLoader() {
    const loader = document.getElementById('loader');
    if (loader) loader.classList.remove('hidden');
}

function hideLoader() {
    const loader = document.getElementById('loader');
    if (loader) loader.classList.add('hidden');
}

function showContent(contentId) {
    showLoader();
    setTimeout(() => {
        const contentElements = {
            'user-profile': document.getElementById('Div1'),
            'booking-history': document.getElementById('booking-history-content'),
            'settings': document.getElementById('settings-content'),
            'help-support': document.getElementById('help-support-content')
        };

        const linkElements = {
            'user-profile': document.getElementById('profile-link'),
            'booking-history': document.getElementById('history-link'),
            'settings': document.getElementById('settings-link'),
            'help-support': document.getElementById('support-link')
        };

        const activeClass = 'nav-active';
        const inactiveClasses = ['text-red-100', 'hover:text-white', 'pl-3', 'py-1'];

        for (const id in contentElements) {
            if (!contentElements[id]) continue;
            if (id === contentId) {
                contentElements[id].classList.remove('hidden');
                if (linkElements[id]) {
                    linkElements[id].classList.add(activeClass, 'text-white');
                    linkElements[id].classList.remove(...inactiveClasses);
                }
            } else {
                contentElements[id].classList.add('hidden');
                if (linkElements[id]) {
                    linkElements[id].classList.remove(activeClass, 'text-white');
                    linkElements[id].classList.add(...inactiveClasses);
                }
            }
        }
        hideLoader();
    }, 1000);
}



function showToast(message, type = "success") {
    const toast = document.getElementById("toast");

    if (!toast) return;

    toast.textContent = message;
    toast.classList.remove("hidden");

    if (type === "error") {
        toast.classList.remove("bg-green-500");
        toast.classList.add("bg-red-500");
    } else {
        toast.classList.remove("bg-red-500");
        toast.classList.add("bg-green-500");
    }

    setTimeout(() => {
        toast.classList.add("hidden");
    }, 3000);
}

    // passwoed changing modal js code 
const openModalBtn = document.getElementById('<%= btnOpenChangePassword.ClientID %>');
const modal = document.getElementById('<%= changePasswordModal.ClientID %>');
const closeModalBtn = document.getElementById('<%= btnCloseChangePassword.ClientID %>');
const cancelBtn = document.getElementById('<%= btnCancelChangePassword.ClientID %>');
const form = document.getElementById('<%= changePasswordForm.ClientID %>');

if (openModalBtn && modal && closeModalBtn && cancelBtn && form) {
    // Open modal
    openModalBtn.addEventListener('click', () => {
        modal.classList.remove('hidden');
    });

    // Close modal
    const closeModal = () => modal.classList.add('hidden');
    closeModalBtn.addEventListener('click', closeModal);
    cancelBtn.addEventListener('click', closeModal);

    // Close modal when clicking outside
    modal.addEventListener('click', (e) => {
        if (e.target === modal) closeModal();
    });

    // Handle form submission
    form.addEventListener('submit', (e) => {
        e.preventDefault();

        const current = document.getElementById('<%= txtCurrentPassword.ClientID %>').value;
        const newPass = document.getElementById('<%= txtNewPassword.ClientID %>').value;
        const confirm = document.getElementById('<%= txtConfirmPassword.ClientID %>').value;

        if (newPass !== confirm) {
            alert("New passwords do not match!");
            return;
        }

        // TODO: Add your server-side update logic
        alert("Password updated successfully!");
        form.reset();
        modal.classList.add('hidden');
    });
}