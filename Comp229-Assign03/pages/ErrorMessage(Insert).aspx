<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ErrorMessage(Insert).aspx.cs" Inherits="Comp229_Assign03.ErrorMessage_Insert_" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            text-align: center;
        }
        .auto-style2 {
            font-size: xx-large;
        }




        .auto-style3 {
            color: #FF6600;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="auto-style1">
    
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <span class="auto-style2"><span class="auto-style3">Sorry the data was not entered </span>.<br />
        <asp:Button ID="Button1" runat="server" Text="Try Again" OnClick="Button1_Click" />
        </span>
        <br />
    
    </div>
    </form>
</body>
</html>

