using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Comp229_Assign03
{
    public partial class Students : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ShowData();
            }
            displayCourseData();

        }
        public void displayCourseData()
        {

            SqlConnection conn = new SqlConnection("Server=localhost\\SqlExpress;Database=Comp229Assign03;" + "Integrated Security=True");
            SqlCommand comm = new SqlCommand("select * from Comp229Assign03.[dbo].Courses;", conn);

            conn.Open();
            SqlDataReader reader = comm.ExecuteReader();

            while (reader.Read())
            {

                CoursesGrid.DataSource = reader;
                CoursesGrid.DataBind();
            }

            reader.Close();
            conn.Close();

        }


        protected void UpdatingData(object sender, GridViewUpdateEventArgs e)
        {
            SqlConnection conn = new SqlConnection("Server=localhost\\SqlExpress;Database=Comp229Assign03;" + "Integrated Security=True");
            //Make the connection 
            conn.Open();
            //Define you query
            string sqlQuery = " UPDATE Comp229Assign03.[dbo].[Students] SET [FirstMIdName] = @FirstName, [LastName] = @LastName,  WHERE StudentID=@StudentID";
            SqlCommand cmd = new SqlCommand(sqlQuery, conn);

            // cmd.Parameters.AddWithValue("@StudentID", TextBox6.Text);
            // cmd.Parameters.AddWithValue("@FirstName", TextBox7.Text);
            // cmd.Parameters.AddWithValue("@LastName", TextBox8.Text);
            cmd.ExecuteNonQuery();
            conn.Close();


        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection("Server=localhost\\SqlExpress;Database=Comp229Assign03;" + "Integrated Security=True");
            bool IsAdded = false;
            string FirstMidName = TextBox2.Text.Trim();
            string LastName = TextBox3.Text;
            string EnrollmentDate = TextBox11.Text;

            string courseTitle = TextBox4.Text;
            string Department = TextBox5.Text;
            string Credits = TextBox13.Text;

            SqlCommand cmd = new SqlCommand("Insert into Comp229Assign03.[dbo].Students (FirstMidName,LastName, EnrollmentDate)values( @FirstMidName, @LastName , @EnrollmentDate)", conn);
            SqlCommand cmd1 = new SqlCommand("Insert into Comp229Assign03.[dbo].Courses (Title,Credits, DepartmentID)values( @CourseTitle, @Credits , @DepartmentId)", conn);
            cmd.Parameters.AddWithValue("@FirstMidName", FirstMidName);
            cmd.Parameters.AddWithValue("@LastName", LastName);
            cmd.Parameters.AddWithValue("@EnrollmentDate", EnrollmentDate);

            cmd1.Parameters.AddWithValue("@CourseTitle", courseTitle);
            cmd1.Parameters.AddWithValue("@DepartmentID", Department);
            cmd1.Parameters.AddWithValue("@Credits", Credits);

            conn.Open();
            IsAdded = cmd.ExecuteNonQuery() > 0;
            IsAdded = cmd1.ExecuteNonQuery() > 0;
            conn.Close();

            if (IsAdded)
            {

                Response.Redirect("Student.aspx");


            }
            else
            {
                Response.Redirect("ErrorMessage(Insert).aspx");
            }
        }

        protected void ShowData()
        {

            SqlConnection conn = new SqlConnection("Server=localhost\\SqlExpress;Database=Comp229Assign03;" + "Integrated Security=True");
            conn.Open();
            SqlCommand comm = new SqlCommand("select * from Comp229Assign03.[dbo].Students;", conn);
            SqlDataReader reader = comm.ExecuteReader();
            UpdateStudentGrid.DataSource = reader;
            UpdateStudentGrid.DataBind();

            conn.Close();
        }

        protected void StdDetailsGrid_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            SqlConnection conn = new SqlConnection("Server=localhost\\SqlExpress;Database=Comp229Assign03;" + "Integrated Security=True");
            conn.Open();
            GridViewRow row = (GridViewRow)UpdateStudentGrid.Rows[e.RowIndex];
            Int32 StudentID = Convert.ToInt32(row.Cells[0].Text);

            SqlCommand cmd = new SqlCommand("DELETE FROM Comp229Assign03.[dbo].Students WHERE StudentID = @StudentID;", conn);
            cmd.Parameters.AddWithValue("@StudentID", StudentID);


            cmd.ExecuteNonQuery();
            conn.Close();
            ShowData();
        }





        protected void StdDetailsGrid_RowEditing(object sender, GridViewEditEventArgs e)
        {
            ViewState["StudentId"] = UpdateStudentGrid.Rows[e.NewEditIndex].Cells[0].Text;
            UpdateStudentGrid.EditIndex = e.NewEditIndex;
            ShowData();


        }

        protected void StdDetailsGrid_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            UpdateStudentGrid.EditIndex = -1;
            ShowData();

        }

        protected void StdDetailsGrid_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {

            SqlConnection conn = new SqlConnection("Server=localhost\\SqlExpress;Database=Comp229Assign03;" + "Integrated Security=True");


            GridViewRow row = (GridViewRow)UpdateStudentGrid.Rows[e.RowIndex];
            TextBox textStudentID = (TextBox)row.Cells[1].Controls[0];
            TextBox textFirstName = (TextBox)row.Cells[1].Controls[0];
            TextBox textLastName = (TextBox)row.Cells[2].Controls[0];
            TextBox textDate = (TextBox)row.Cells[3].Controls[0];

            // Int32 StudentID = Convert.ToInt32(row.Cells[0].Text);
            string FirstMidName = textFirstName.Text;
            string LastName = textLastName.Text;
            string EnrollmentDate = textDate.Text;


            SqlCommand cmd = new SqlCommand("UPDATE Comp229Assign03.[dbo].Students SET FirstMidName = @FirstMidName, LastName = @LastName, EnrollmentDate = @EnrollmentDate  WHERE StudentID = @StudentID;", conn);

            cmd.Parameters.Add("@StudentId", System.Data.SqlDbType.Int);
            cmd.Parameters["@StudentId"].Value = Convert.ToInt32(ViewState["StudentId"]);

            cmd.Parameters.AddWithValue("@FirstMidName", FirstMidName);
            cmd.Parameters.AddWithValue("@LastName", LastName);
            cmd.Parameters.AddWithValue("@EnrollmentDate", EnrollmentDate);

            try
            {
                conn.Open();

                cmd.ExecuteNonQuery();


            }
            finally
            {
                conn.Close();
            }

            UpdateStudentGrid.EditIndex = -1;

            ShowData();




        }

        protected void StdDetailsGrid_RowDeleted(object sender, GridViewDeletedEventArgs e)
        {
        }
    }