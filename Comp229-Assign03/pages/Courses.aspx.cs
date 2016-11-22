using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Comp229_Assign03
{
    public partial class Courses : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            displayEnrollments();
        }
        public void displayEnrollments()
        {
            SqlConnection conn = new SqlConnection("Server=localhost\\SqlExpress;Database=Comp229Assign03;" + "Integrated Security=True");
            SqlCommand comm = new SqlCommand("Select a.CourseID, a.Title,b.StudentID,b.FirstMidName,b.LastName from Comp229Assign03.[dbo].Courses a Left join Comp229Assign03.[dbo].Enrollments c on c.CourseID = a.CourseID Left join Comp229Assign03.[dbo].Students b on b.StudentID = c.StudentID;", conn);

            conn.Open();
            SqlDataReader reader = comm.ExecuteReader();

            while (reader.Read())
            {

                EnrolledStudentGrid.DataSource = reader;
                EnrolledStudentGrid.DataBind();
            }

            reader.Close();
            conn.Close();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection("Server=localhost\\SqlExpress;Database=Comp229Assign03;" + "Integrated Security=True");
            bool IsAdded = false;
            string StudentID = TextBox1.Text.Trim();
            string CourseID = TextBox2.Text;
            string Grade = TextBox3.Text;
            SqlCommand cmd = new SqlCommand("Insert into Comp229Assign03.[dbo].Enrollments (StudentID,CourseID, Grade)values( @StudentID, @CourseID , @Grade)", conn);

            cmd.Parameters.AddWithValue("@StudentID", StudentID);
            cmd.Parameters.AddWithValue("@CourseID", CourseID);
            cmd.Parameters.AddWithValue("@Grade", Grade);
            conn.Open();
            IsAdded = cmd.ExecuteNonQuery() > 0;
            conn.Close();

            if (IsAdded)
            {
                Response.Redirect("Landing_Page.aspx");
            }
            else
            {

                Response.Redirect("ErrorMessage(Insert).aspx");
            }
        }


        protected void Button2_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection("Server=localhost\\SqlExpress;Database=Comp229Assign03;" + "Integrated Security=True");


            string StudentID = TextBox1.Text.Trim();
            string CourseID = TextBox2.Text;
            string Grade = TextBox3.Text.Trim();

            SqlCommand cmdDeleteEnrolled = new SqlCommand("DELETE From Comp229Assign03.[dbo].Enrollments WHERE CourseID = @CourseID AND StudentID = @StudentID;", conn);

            cmdDeleteEnrolled.Parameters.Add("@StudentID", System.Data.SqlDbType.Int);
            cmdDeleteEnrolled.Parameters["@StudentID"].Value = StudentID;

            cmdDeleteEnrolled.Parameters.Add("@CourseID", System.Data.SqlDbType.Int);
            cmdDeleteEnrolled.Parameters["@CourseID"].Value = CourseID;

            try
            {
                conn.Open();
                cmdDeleteEnrolled.ExecuteNonQuery();

            }
            finally
            {
                conn.Close();
            }


        }

    }
}