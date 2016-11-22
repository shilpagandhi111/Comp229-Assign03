<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Landing_Page.aspx.cs" Inherits="Comp229_Assign03.Landing_Page" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <meta charset="utf-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <style>
.jumbotron {
    background-color: #f4511e; /* Orange */
    color: #ffffff;
}
</style>

<div class="jumbotron text-center">
    <h1> Wade Waters Community College</h1>
    <p> The First community college in the area. Serving the country for over 50 years.</p>
</div>

    <div class="container-fluid text-center text" style="background-color: #808080" >
        <h2>Students</h2>
        <h2>
            <asp:Label ID="Label1" runat="server" Text="Label" style="font-size: medium"></asp:Label>
        </h2>
        <style>
            .bg-1{
                background-color:#808080;
            }
            .auto-style2 {
                color: #FFFFFF;
            }
        </style>
        <div class="container-fluid bg-1 text-left" style="text-align: center; background-color: #C0C0C0">
            <h3>
                Enter Your Information Below:
            </h3>
            <p>
                &nbsp;</p>
          
            <br />
            <asp:Label ID="Label3" runat="server" Text="First Name" style="color: #FFFFFF"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;:&nbsp;
            <asp:TextBox ID="TextBox2" runat="server" ></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="Label4" runat="server" Text="Last Name" style="color: #FFFFFF"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            :&nbsp;&nbsp;
            <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
            <br />
            <br />
            <span class="auto-style2">Enrollment Date</span>:&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
            <br />
           
            <br />
            <asp:Button ID="Button1" runat="server" Text="Insert" Width="201px" OnClick="Button1_Click" />
            <br />
            
        </div>
       
    </div>
    
</asp:Content>
         


