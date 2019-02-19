using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace BlogSiteProject.Admin
{
    public partial class Login : System.Web.UI.Page
    {
        SqlConnect connect = new SqlConnect();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAdminEnter_Click(object sender, EventArgs e)
        {
            SqlCommand sqlCmd = new SqlCommand("Select * from TblAdmin where adminUserName='" + txtAdminUserName.Text + "'and adminPassword='" + txtAdminPassword.Text + "'", connect.connect());
            SqlDataReader dr = sqlCmd.ExecuteReader();

            if(dr.Read())
            {
                Session["adminUserName"] = dr["adminUserName"];

                Response.Redirect("AdminPanel.aspx");
            }
            else
            {
                lblInfo.Text = "Hatalı Giriş Yaptınız!";
            }
        }
    }
}