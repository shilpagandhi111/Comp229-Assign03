using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Comp229_Assign03
{
    public partial class Landing_Page : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            displayStudentData();
        }
        public void displayStudentData()
        {
            Label1.Text = "";
            SqlConnection conn = new SqlConnection("Server=localhost\\SqlExpress;Database=Comp229Assign03;" + "Integrated Security=True");
            SqlCommand comm = new SqlCommand("select FirstMidName, LastName from Comp229Assign03.[dbo].Students;", conn);

            conn.Open();
            SqlDataReader reader = comm.ExecuteReader();

            while (reader.Read())
            {
                Label1.Text += reader["FirstMidName"] + " ";
                Label1.Text += reader["LastName"] + "<br/>";
            }

            reader.Close();
            conn.Close();
        }



        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection("Server=localhost\\SqlExpress;Database=Comp229Assign03;" + "Integrated Security=True");
            bool IsAdded = false;
            string FirstMidName = TextBox2.Text.Trim();
            string LastName = TextBox3.Text;
            string EnrollmentDate = TextBox4.Text;
            SqlCommand cmd = new SqlCommand("Insert into Comp229Assign03.[dbo].Students (FirstMidName,LastName, EnrollmentDate)values( @FirstMidName, @LastName , @EnrollmentDate)", conn);

            cmd.Parameters.AddWithValue("@FirstMidName", FirstMidName);
            cmd.Parameters.AddWithValue("@LastName", LastName);
            cmd.Parameters.AddWithValue("@EnrollmentDate", EnrollmentDate);
            conn.Open();
            IsAdded = cmd.ExecuteNonQuery() > 0;
            conn.Close();

            if (IsAdded)
            {


                BindGridView();
            }
            else
            {
                Response.Redirect("ErrorMessage(Insert).aspx");
            }


        }

        private void BindGridView()
        {

            SqlConnection conn = new SqlConnection("Server=localhost\\SqlExpress;Database=Comp229Assign03;" + "Integrated Security=True");
            try
            {
                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }

                SqlCommand cmd = new SqlCommand("Select * from Students", conn);
                SqlDataAdapter adp = new SqlDataAdapter(cmd);


            }

            finally
            {
                conn.Close();
            }
        }




    }



}