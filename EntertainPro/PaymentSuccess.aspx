<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="PaymentSuccess.aspx.cs" Inherits="EntertainPro.PaymentSuccess" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <style>
        .confirmation-message { 
            text-align: center; 
            padding: 80px 20px; 
            font-family: Arial, sans-serif;
        }
        .confirmation-message h1 { 
            color: #2ecc71; /* Green for success */
            margin-bottom: 20px;
        }
        .confirmation-message h2 {
            color: #e74c3c; /* Red for failure */
            margin-bottom: 20px;
        }
        .confirmation-message p {
            font-size: 1.1em;
            line-height: 1.6;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div class="confirmation-message">
        <asp:Literal ID="ltlMessage" runat="server"></asp:Literal>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
</asp:Content>
