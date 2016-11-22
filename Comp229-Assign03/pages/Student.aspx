<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Student.aspx.cs" Inherits="Comp229_Assign03.Students" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="Content/StyleSheet.css" rel="stylesheet" />
    <link href="Content/bootstrap-theme.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" />
    <script src="Scripts/jquery-1.9.1.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    <link href="Content/bootstrap.css" rel="stylesheet" />

     <style>
.jumbotron {
    background-color: #f4511e; /* Orange */
    color: #ffffff;
             text-align: center;
         }
         </style>

<div class="jumbotron text-center">
    <h1> Students</h1>
    <p> </p>
</div>
      <div class="container-fluid bg-1 text-left">
            <h3 class="text-white">
                Enter Your Information Below:
            </h3>
            <p>
                &nbsp;&nbsp; &nbsp;</p>
            :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <br />
            <br />
            <asp:Label ID="Label3" runat="server" Text="First Name" CssClass="text-white"></asp:Label>
            &nbsp;:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="TextBox2" runat="server" ></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="Label4" runat="server" Text="Last Name" CssClass="text-white"></asp:Label>
            :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
            <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="Label13" runat="server" Text="Enrollment Date" CssClass="text-white"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="TextBox11" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="Label5" runat="server" Text="Course Title" CssClass="text-white"></asp:Label>
            :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="Label6" runat="server" Text="Department" CssClass="text-white"></asp:Label>
            :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="Label15" runat="server" Text="Credits" CssClass="text-white"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="TextBox13" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="Button2" runat="server" Text="Enter Data" OnClick="Button2_Click" />
            <br />
            <br />
          
            
        </div>
    <style>
        .bg-1{
            background-color:gray;
        }
        .auto-style1 {
            color: #fff;
            text-align: center;
        }
        .auto-style2 {
            font-size: x-large;
        }
        .auto-style3 {
            background-color: #C0C0C0;
        }
        </style>
   <div class="auto-style3">
       <h1 class="auto-style1">
           Courses</h1>
       <p>
           &nbsp;</p>
       <asp:GridView ID="CoursesGrid" runat="server" CssClass="table" AutoGenerateColumns="false"  CellPadding="5" CellSpacing="5" >
                <Columns>
                    <asp:BoundField DataField="CourseID" HeaderText="Course ID" ItemStyle-Width="50" FooterStyle-HorizontalAlign="Center" />
                    <asp:BoundField DataField="Title" HeaderText="Title" ItemStyle-Width="150" FooterStyle-HorizontalAlign="Center" />
                    <asp:BoundField DataField="Credits" HeaderText="Credits" ItemStyle-Width="50"  FooterStyle-HorizontalAlign="Center" />
                    <asp:BoundField DataField="DepartmentID" HeaderText="Department ID" ItemStyle-Width="50" FooterStyle-HorizontalAlign="Center" />

                </Columns>
            </asp:GridView>
   </div>
   
    <div class="container-fluid text-lg-center bg-2" style="background-color: #FFFFFF">
        <div class="text-xs-center">
            <span class="auto-style2">Our Students</span><br />
&nbsp;</div>
        <asp:GridView ID="UpdateStudentGrid" runat="server" AutoGenerateColumns="False" HorizontalAlign="Center" CssClass="table" CellPadding="5" CellSpacing="5" OnRowCancelingEdit="StdDetailsGrid_RowCancelingEdit"
                OnRowDeleting="StdDetailsGrid_RowDeleting" OnRowEditing="StdDetailsGrid_RowEditing" OnRowUpdating="StdDetailsGrid_RowUpdating" >
                <Columns>
                    <asp:BoundField DataField="StudentID" HeaderText="Student Number" ItemStyle-Width="150" />
                    <asp:BoundField DataField="FirstMidName" HeaderText="First Name" ItemStyle-Width="150" />
                    <asp:BoundField DataField="LastName" HeaderText="Last Name" ItemStyle-Width="150" />
                    <asp:BoundField DataField="EnrollmentDate" HeaderText="Enrolment Date" DataFormatString="{0:MM/dd/yyyy}" ItemStyle-Width="150" />
                    <asp:CommandField ButtonType="Link" ShowEditButton="true" ShowDeleteButton="true" ItemStyle-Width="100" />

                </Columns>
            </asp:GridView>
        </div>
</asp:Content>

