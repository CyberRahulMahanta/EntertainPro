<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SessionDebug.aspx.cs" Inherits="EntertainPro.SessionDebug" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Session Data</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 40px; }
        table { border-collapse: collapse; width: 70%; margin: auto; }
        th, td { border: 1px solid #ccc; padding: 8px; text-align: left; }
        th { background: #f4f4f4; }
        h2 { text-align: center; margin-bottom: 20px; }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <h2>Current Session Data</h2>
        <asp:Literal ID="litSessionData" runat="server"></asp:Literal>
    </form>
</body>
</html>
