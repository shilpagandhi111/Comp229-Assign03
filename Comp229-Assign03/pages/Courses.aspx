<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Courses.aspx.cs" Inherits="Comp229_Assign03.Courses" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
        <link href="Content/bootstrap.min.css" rel="stylesheet" />
     <style>
.jumbotron {
    background-color: #f4511e; /* Orange */
    color: #ffffff;
}
         
         .auto-style1 {
             font-size: x-large;
         }
         .auto-style2 {
             font-size: large;
         }
         
     </style>
    <div class="jumbotron text-lg-center">
           <br class="auto-style1" /> <span class="auto-style1">Courses
            </span>
            <br />
        <br />
    </div>

    <div class="container-fluid table" style="text-align: center">

        <div class="text-xs-center">

        <span style="color: #FF6600">
        <br />
        <br />
        <span class="auto-style2">Enrolled Student list:<br />
            </span></span><br />
        </div>
        <asp:GridView ID="EnrolledStudentGrid" runat="server" CssClass="table" AutoGenerateColumns="false" HorizontalAlign="Center" CellPadding="5" CellSpacing="5"  >
                <Columns>
                     <asp:BoundField DataField="StudentID" HeaderText="Student ID" ItemStyle-Width="100" />
                    <asp:BoundField DataField="FirstMidName" HeaderText="First Mid Name" ItemStyle-Width="150" />

                    <asp:BoundField DataField="LastName" HeaderText="Last Name" ItemStyle-Width="150" />

                    <asp:BoundField DataField="CourseID" HeaderText="CourseID" ItemStyle-Width="100" />
                    <asp:BoundField DataField="Title" HeaderText="Course Title" ItemStyle-Width="150" />
                  
                   
                 
                </Columns>
            </asp:GridView>
        </div>
            <br />
            <div class="container-fluid">

           <div class="text-xs-center">
               <asp:Label ID="label1" runat="server" Text="Student ID"></asp:Label>
&nbsp;
               <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
               <br />
               <asp:Label ID="label2" runat="server" Text="CourseId"></asp:Label>
&nbsp;
               <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
               <br />
               <asp:Label ID="Label3" runat="server" Text="Grade"></asp:Label>
               <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
               <br />
            
               <br />
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Add New Student" />
&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button2" runat="server" Text="Remove" OnClick="Button2_Click" />
            <br />
            <br />
        </div>
            </div>
    
        <br />
    
</asp:Content>


