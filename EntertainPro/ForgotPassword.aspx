<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ForgotPassword.aspx.cs" Inherits="EntertainPro.ForgotPassword" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8" />
    <title>Entertain Pro - Forgot Password</title>
    <link rel="apple-touch-icon" sizes="180x180" href="favicon_io/apple-touch-icon.png">
    <link rel="icon" type="image/png" sizes="32x32" href="favicon_io/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="favicon_io/favicon-16x16.png">
    <link rel="manifest" href="favicon_io/site.webmanifest">
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="css/login.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
    <style>
        .otp-container {
            display: flex;
            justify-content: center;
            gap: 10px;
        }

        .otp-box {
            width: 45px;
            height: 50px;
            font-size: 24px;
            text-align: center;
            border-radius: 8px;
            border: 2px solid #ff4444; /* your theme color */
            outline: none;
            transition: border 0.3s;
        }

            .otp-box:focus {
                border-color: #ff7f7f;
                box-shadow: 0 0 5px #ff4444;
            }
    </style>
</head>
<body class="gradient-bg">
    <i class="fas fa-film floating-icon top-10 left-10"></i>
    <i class="fas fa-ticket-alt floating-icon bottom-10 right-10"></i>
    <form id="form1" runat="server" class="w-full max-w-md">
        <div class="card-glass">
            <div class="text-center mb-6">
                <i class="fa fa-key text-white text-5xl mb-3 animate-pulse"></i>
                <h1 class="text-3xl font-bold text-white tracking-wide">Reset Password</h1>
            </div>

            <asp:Label ID="lblMessage" runat="server" EnableViewState="false"></asp:Label>

            <asp:Panel ID="pnlRequestOtp" runat="server">
                <p class="text-sm text-white/70 text-center mb-4">Enter your email to receive an OTP.</p>
                <div class="mb-4 input-group">
                    <i class="fa fa-envelope"></i>
                    <asp:TextBox ID="txtEmail" runat="server" TextMode="Email"
                        CssClass="input-glass" Placeholder="you@example.com"></asp:TextBox>
                </div>
                <asp:Button ID="btnSendOtp" runat="server" Text="Send OTP"
                    CssClass="w-full btn-primary mt-2" OnClick="btnSendOtp_Click" />
            </asp:Panel>

            <asp:Panel ID="pnlVerifyOtp" runat="server" Visible="false">
                <p class="text-sm text-white/70 text-center mb-4">Check your email for the 6-digit code.</p>
                <div class="mb-4 text-center otp-container">
                    <asp:TextBox ID="otp1" runat="server" MaxLength="1" CssClass="otp-box" onkeyup="moveNext(this, 'otp2')"></asp:TextBox>
                    <asp:TextBox ID="otp2" runat="server" MaxLength="1" CssClass="otp-box" onkeyup="moveNext(this, 'otp3')" onkeydown="movePrev(event, 'otp1')"></asp:TextBox>
                    <asp:TextBox ID="otp3" runat="server" MaxLength="1" CssClass="otp-box" onkeyup="moveNext(this, 'otp4')" onkeydown="movePrev(event, 'otp2')"></asp:TextBox>
                    <asp:TextBox ID="otp4" runat="server" MaxLength="1" CssClass="otp-box" onkeyup="moveNext(this, 'otp5')" onkeydown="movePrev(event, 'otp3')"></asp:TextBox>
                    <asp:TextBox ID="otp5" runat="server" MaxLength="1" CssClass="otp-box" onkeyup="moveNext(this, 'otp6')" onkeydown="movePrev(event, 'otp4')"></asp:TextBox>
                    <asp:TextBox ID="otp6" runat="server" MaxLength="1" CssClass="otp-box" onkeydown="movePrev(event, 'otp5')"></asp:TextBox>
                </div>

                <div class="mb-4 input-group">
                    <i class="fa fa-lock"></i>
                    <asp:TextBox ID="txtNewPassword" runat="server" TextMode="Password"
                        CssClass="input-glass" Placeholder="New Password"></asp:TextBox>
                </div>
                <div class="mb-4 input-group">
                    <i class="fa fa-lock"></i>
                    <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password"
                        CssClass="input-glass" Placeholder="Confirm New Password"></asp:TextBox>
                </div>
                <asp:Button ID="btnResetPassword" runat="server" Text="Reset Password"
                    CssClass="w-full btn-primary mt-2" OnClick="btnResetPassword_Click" />
            </asp:Panel>

            <div class="text-center mt-6">
                <a href="Login.aspx" class="text-red-200 hover:text-white font-semibold text-sm">
                    <i class="fa fa-arrow-left mr-2"></i>Back to Login
                </a>
            </div>
        </div>
    </form>
    <script>
        function moveNext(current, nextId) {
            if (current.value.length >= 1) {
                document.getElementById(nextId).focus();
            }
        }

        function movePrev(e, prevId) {
            if (e.key === "Backspace" && e.target.value === "") {
                document.getElementById(prevId).focus();
            }
        }

        // Optional: combine OTP values on submit
        function getOtp() {
            return Array.from(document.querySelectorAll('.otp-box'))
                .map(input => input.value)
                .join('');
        }
    </script>

</body>
</html>
