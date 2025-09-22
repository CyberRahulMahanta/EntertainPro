<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="EntertainPro.Login" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Entertain Pro - Login</title>
    <link rel="apple-touch-icon" sizes="180x180" href="favicon_io/apple-touch-icon.png">
    <link rel="icon" type="image/png" sizes="32x32" href="favicon_io/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="favicon_io/favicon-16x16.png">
    <link rel="manifest" href="favicon_io/site.webmanifest">
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="css/login.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
</head>
<body class="gradient-bg">

    <!-- Floating Cinematic Icons -->
    <i class="fas fa-film floating-icon top-10 left-10"></i>
    <i class="fas fa-ticket-alt floating-icon bottom-10 right-10"></i>

    <form id="form1" runat="server" class="w-full max-w-md">
        <div class="card-glass">

            <!-- CineMax Branding -->
            <div class="text-center mb-6">
                <i class="fa fa-video-camera text-white text-6xl mb-3 animate-pulse"></i>
                <h1 class="text-3xl font-bold text-white tracking-wide">Entertain Pro</h1>
                <p class="text-sm text-white/70">Your gateway to the movies</p>
            </div>

            <h2 class="text-xl font-semibold text-white text-center mb-6">Sign In</h2>

            <asp:Label ID="lblMessage" runat="server" CssClass="block text-center text-yellow-300 mb-4"></asp:Label>

            <!-- Email -->
            <div class="mb-4 input-group">
                <i class="fa fa-envelope"></i>
                <asp:TextBox ID="txtEmail" runat="server" TextMode="Email"
                    CssClass="input-glass" Placeholder="you@example.com"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvEmail" runat="server"
                    ControlToValidate="txtEmail" ErrorMessage="Email required"
                    ForeColor="Yellow" Display="Dynamic"></asp:RequiredFieldValidator>
            </div>

            <!-- Password -->
            <div class="mb-4 input-group">
                <i class="fa fa-lock"></i>
                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"
                    CssClass="input-glass" Placeholder="Enter password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvPassword" runat="server"
                    ControlToValidate="txtPassword" ErrorMessage="Password required"
                    ForeColor="Yellow" Display="Dynamic"></asp:RequiredFieldValidator>
            </div>

            <!-- Login Button -->
            <asp:Button ID="btnLogin" runat="server" Text="Login"
                CssClass="w-full btn-primary mt-2" OnClick="BtnLogin_Click" />

            <!-- Divider -->
            <div class="flex items-center my-6">
                <div class="flex-grow h-px bg-white/30"></div>
                <span class="px-3 text-white/70 text-sm">OR</span>
                <div class="flex-grow h-px bg-white/30"></div>
            </div>

            <!-- Social Login Icons -->
            <div class="flex justify-center gap-5 mt-4">
                <!-- Google -->
                <a href="GoogleLogin.aspx"
                    class="w-12 h-12 flex items-center justify-center rounded-full bg-white shadow-md social-btn">
                    <img src="https://www.svgrepo.com/show/475656/google-color.svg" class="w-6 h-6" />
                </a>
                <!-- Facebook -->
                <a href="FacebookLogin.aspx"
                    class="w-12 h-12 flex items-center justify-center rounded-full bg-blue-600 text-white shadow-md social-btn">
                    <i class="fab fa-facebook-f text-lg"></i>
                </a>
                <!-- GitHub -->
                <a href="GithubLogin.aspx"
                    class="w-12 h-12 flex items-center justify-center rounded-full bg-gray-900 text-white shadow-md social-btn">
                    <i class="fab fa-github text-lg"></i>
                </a>
            </div>

            <!-- Links -->
            <div class="text-center mt-6">
                <a href="Register.aspx" class="text-red-200 hover:text-white font-semibold text-sm">Don't have an account? Register
                </a>
                <br />
                <a href="ForgotPassword.aspx" class="text-red-200 hover:text-white font-semibold text-sm">Forgot Password?
                </a>
            </div>
        </div>
    </form>
</body>
</html>
