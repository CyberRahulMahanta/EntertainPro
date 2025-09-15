<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="EntertainPro.Register" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>CineMax - Register for Movie Tickets</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
    <link href="css/register.css" rel="stylesheet">
</head>
<body class="gradient-bg min-h-screen flex items-center justify-center p-4">
    <form id="form1" runat="server" class="w-full max-w-6xl mx-auto">
        <div class="absolute top-10 left-10 text-white text-6xl opacity-20">
            <i class="fas fa-film movie-reel"></i>
        </div>
        <div class="absolute bottom-10 right-10 text-white text-6xl opacity-20">
            <i class="fas fa-ticket-alt"></i>
        </div>


        <div class="grid md:grid-cols-2 gap-8 items-center">

            <!-- Left Info Card -->
            <div class="hidden md:block">
                <div class="card-glass rounded-2xl p-6 text-center text-white ticket-clip glow-effect">
                    <div class="text-center mb-8">
                        <h1 class="text-4xl font-bold text-white mb-2">
                            <i class="fa fa-video-camera me-1 col_light fs-1 align-middle"></i>Entertain Pro
                        </h1>
                        <p class="text-white/80">Your Ultimate Movie Experience Awaits</p>
                    </div>
                    <img src="https://storage.googleapis.com/workspace-0f70711f-8b4e-4d94-86f1-2a93ccde5887/image/82b25300-3d01-4b1f-ad88-2c008e4008cc.png"
                         alt="Movie theater" class="w-full h-48 object-cover rounded-xl mb-4" />
                    <h3 class="text-xl font-semibold mb-2 accent-text">Join Our Movie Community</h3>
                    <p class="text-sm opacity-80">Get exclusive access to premium content, early ticket bookings, and member-only discounts</p>
                    <div class="mt-6 grid grid-cols-3 gap-4">
                        <div class="text-center"><i class="fas fa-ticket-alt text-2xl mb-2 color="#000000""></i><p class="text-xs">Easy Booking</p></div>
                        <div class="text-center"><i class="fas fa-crown text-2xl mb-2 color="#000000""></i><p class="text-xs">VIP Access</p></div>
                        <div class="text-center"><i class="fas fa-gift text-2xl mb-2 color="#000000""></i><p class="text-xs">Special Offers</p></div>
                    </div>
                </div>
            </div>

            <!-- Right Form Card -->
            <div class="card-glass rounded-2xl p-8 glow-effect">
                <h2 class="text-2xl font-bold text-white text-center mb-6">Create Your Account</h2>

                <div class="grid md:grid-cols-2 gap-4">
                    <div>
                        <label class="block text-white text-sm mb-2">First Name</label>
                        <asp:TextBox ID="txtFirstName" runat="server" CssClass="w-full input-glass rounded-lg px-4 py-3 text-white focus:outline-none" Placeholder="Enter your first name"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvFirstName" runat="server" ControlToValidate="txtFirstName" ErrorMessage="First name required" ForeColor="Yellow" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                    <div>
                        <label class="block text-white text-sm mb-2">Last Name</label>
                        <asp:TextBox ID="txtLastName" runat="server" CssClass="w-full input-glass rounded-lg px-4 py-3 text-white focus:outline-none" Placeholder="Enter your last name"></asp:TextBox>
                    </div>
                </div>

                <div>
                    <label class="block text-white text-sm mb-2">Email Address</label>
                    <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" CssClass="w-full input-glass rounded-lg px-4 py-3 text-white focus:outline-none" Placeholder="your@email.com"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail" ErrorMessage="Email required" ForeColor="Yellow" Display="Dynamic"></asp:RequiredFieldValidator>
                </div>

                <div class="grid md:grid-cols-2 gap-4">
                    <div>
                        <label class="block text-white text-sm mb-2">Password</label>
                        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="w-full input-glass rounded-lg px-4 py-3 text-white focus:outline-none" Placeholder="Create password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtPassword" ErrorMessage="Password required" ForeColor="Yellow" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                    <div>
                        <label class="block text-white text-sm mb-2">Confirm Password</label>
                        <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password" CssClass="w-full input-glass rounded-lg px-4 py-3 text-white focus:outline-none" Placeholder="Confirm password"></asp:TextBox>
                        <asp:CompareValidator ID="cvPassword" runat="server" ControlToValidate="txtConfirmPassword" ControlToCompare="txtPassword" ErrorMessage="Passwords do not match!" ForeColor="Yellow" Display="Dynamic"></asp:CompareValidator>
                    </div>
                </div>

                <div>
                    <label class="block text-white text-sm mb-2">Phone Number</label>
                    <asp:TextBox ID="txtPhone" runat="server" CssClass="w-full input-glass rounded-lg px-4 py-3 text-white focus:outline-none" Placeholder=""></asp:TextBox>
                </div>

                <div>
                    <label class="block text-white text-sm mb-2">Date of Birth</label>
                    <asp:TextBox ID="txtDOB" runat="server" TextMode="Date" CssClass="w-full input-glass rounded-lg px-4 py-3 text-white focus:outline-none"></asp:TextBox>
                </div>

                <div class="flex items-center mb-4 mt-4">
                    <asp:CheckBox ID="chkTerms" runat="server" CssClass="mr-2 accent-red-500" />
                    <label for="chkTerms" class="text-white text-sm">I agree to the Terms of Service & Privacy Policy</label>
                </div>

                <asp:Button ID="btnRegister" runat="server" Text="Create Account" CssClass="w-full btn-primary text-white py-3 rounded-lg font-semibold hover:scale-105 transition-all" OnClick="BtnRegister_Click" />

                <asp:Label ID="lblMessage" runat="server" CssClass="block text-center text-white mt-4"></asp:Label>

                <div class="text-center mt-4">
                    <p class="text-white text-sm">Already have an account? 
                        <a href="Login.aspx" class="text-red-200 hover:text-white font-semibold">Sign In</a>
                    </p>
                </div>
            </div>
        </div>
    </form>
</body>
</html>

