<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Payment.aspx.cs" Inherits="EntertainPro.Payment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .payment-processing {
            text-align: center;
            padding: 80px 20px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div class="payment-processing">
        <h2>Processing your payment...</h2>
        <p>Please do not refresh or close this window.</p>
    </div>

    <script src="https://checkout.razorpay.com/v1/checkout.js"></script>
</asp:Content>
