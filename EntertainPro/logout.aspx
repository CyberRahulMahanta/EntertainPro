<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="logout.aspx.cs" Inherits="EntertainPro.logout" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .logout-message {
            text-align: center;
            padding: 100px 20px;
            font-family: Arial, sans-serif;
            font-size: 1.2em;
            color: #555;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div class="logout-message">
        <p>Logging you out, please wait...</p>
    </div>
</asp:Content>
