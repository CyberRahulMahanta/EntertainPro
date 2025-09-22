<%@ Page Title="Booking Confirmation" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="PaymentSuccess.aspx.cs" Inherits="EntertainPro.PaymentSuccess" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" />
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700&display=swap" rel="stylesheet">

    <style>
        /* 1. CSS Variables for easy color management and theming */
        :root {
            --primary-color: #ff4444;
            --success-color: #2ecc71;
            --failure-color: #e74c3c;
            --background-light: #f4f7f6;
            --card-background: #ffffff;
            --text-dark: #333;
            --text-light: #555;
            --font-family: 'Poppins', sans-serif;
        }

        .page-background {
            background-color: var(--background-light);
            padding: 40px 15px;
            font-family: var(--font-family);
            min-height: 70vh;
            -webkit-font-smoothing: antialiased; /* Smoother fonts */
            text-rendering: optimizeLegibility;
        }

        /* 2. Keyframe Animations for a dynamic entrance */
        @keyframes fadeInDown {
            from {
                opacity: 0;
                transform: translateY(-30px);
            }

            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        @keyframes popIn {
            0% {
                opacity: 0;
                transform: scale(0.5);
            }

            80% {
                opacity: 1;
                transform: scale(1.1);
            }

            100% {
                opacity: 1;
                transform: scale(1);
            }
        }

        .confirmation-message {
            max-width: 600px;
            margin: 0 auto;
            background-color: var(--card-background);
            border-radius: 15px;
            /* A more advanced, layered shadow */
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.04), 0 10px 30px rgba(0, 0, 0, 0.08);
            padding: 45px;
            text-align: center;
            border-top: 6px solid #ddd;
            /* Applying the entrance animation */
            animation: fadeInDown 0.8s ease-out forwards;
        }

            .confirmation-message:has(h1) {
                border-color: var(--success-color);
            }

            .confirmation-message:has(h2) {
                border-color: var(--failure-color);
            }

            /* 3. Animating the icons for more impact */
            .confirmation-message h1::before,
            .confirmation-message h2::before {
                font-family: "Font Awesome 6 Free";
                font-weight: 900;
                display: block;
                font-size: 72px;
                margin-bottom: 25px;
                /* Applying the pop-in animation */
                animation: popIn 0.6s ease-out 0.4s forwards;
                opacity: 0; /* Start hidden */
                transform: scale(0.5); /* Start small */
            }

            .confirmation-message h1::before {
                content: "\f058";
                color: var(--success-color);
            }

            .confirmation-message h2::before {
                content: "\f057";
                color: var(--failure-color);
            }

            .confirmation-message h1,
            .confirmation-message h2 {
                font-size: 2.2em;
                font-weight: 700;
                color: var(--text-dark);
                margin-top: 0;
            }

            .confirmation-message p {
                font-size: 1.1em;
                color: var(--text-light);
                line-height: 1.7;
                margin-bottom: 15px;
            }

                .confirmation-message p strong {
                    color: #000;
                }

            .confirmation-message pre {
                background-color: #fff2f2;
                border: 1px solid #ffdddd;
                text-align: left;
                padding: 15px;
                border-radius: 5px;
                white-space: pre-wrap;
                word-wrap: break-word;
                font-size: 0.9em;
                color: #c7254e;
            }

        .page-actions {
            text-align: center;
            margin-top: 30px;
            /* Animate the buttons in after the card */
            animation: fadeInDown 0.8s ease-out 0.6s forwards;
            opacity: 0;
        }

        /* 4. Advanced button styling with new color and hover effects */
        .cta-button {
            display: inline-block;
            background-image: linear-gradient(45deg, var(--primary-color), #ff6a6a);
            color: #fff;
            padding: 14px 28px;
            border-radius: 8px;
            text-decoration: none;
            font-weight: 600;
            font-size: 1em;
            transition: all 0.3s ease;
            margin: 5px 10px;
            border: none;
            box-shadow: 0 4px 15px rgba(255, 68, 68, 0.2);
        }

            .cta-button:hover {
                transform: translateY(-4px) scale(1.03);
                box-shadow: 0 8px 25px rgba(255, 68, 68, 0.35);
                color: #fff; /* Ensures text stays white on hover */
            }

            .cta-button:active {
                transform: translateY(-1px) scale(1);
            }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div class="page-background">
        <div class="confirmation-message">
            <asp:Literal ID="ltlMessage" runat="server"></asp:Literal>
        </div>

        <div class="page-actions">
            <a href="BookedMovies.aspx" class="cta-button">View My Tickets</a>
            <a href="index.aspx" class="cta-button">Explore More</a>
        </div>
    </div>
</asp:Content>
