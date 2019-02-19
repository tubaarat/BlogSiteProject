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
    public partial class UpdateCategory : System.Web.UI.Page
    {
        SqlConnect connection = new SqlConnect();
        string categoryID = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            categoryID = Request.QueryString["categoryID"];
            if(Page.IsPostBack==false)
            {
                if (Session["adminUserName"] == null)
                {
                    Response.Redirect("Login.aspx");
                }

                SqlCommand cmdUpdateCategory = new SqlCommand("select * from TblCategory where categoryID='" + categoryID + "'", connection.connect());
                SqlDataReader drUpdateCat = cmdUpdateCategory.ExecuteReader();
                DataTable dtUpdate = new DataTable("Table");
                dtUpdate.Load(drUpdateCat);

                DataRow dataRow = dtUpdate.Rows[0];
                txtUpdCatName.Text = dataRow["categoryName"].ToString();
                txtUpdCatNo.Text = dataRow["categoryNo"].ToString();
                txtUpdCatCount.Text = dataRow["categoryPiece"].ToString();
            }
        }

        protected void btnUpdateCategory_Click(object sender, EventArgs e)
        {
            if(fuCatUpdatePicture.HasFile)
            {
                fuCatUpdatePicture.SaveAs(Server.MapPath("/CategoryPictures/" + fuCatUpdatePicture.FileName));

                SqlCommand cmdUpdateCat = new SqlCommand("update TblCategory Set categoryName='"+txtUpdCatName.Text+"',categoryNo='"+txtUpdCatNo.Text+"',categoryPiece='"+txtUpdCatCount.Text+"',categoryPicture='/CategoryPictures/"+fuCatUpdatePicture.FileName+"' where categoryID='"+categoryID+"'",connection.connect());
                cmdUpdateCat.ExecuteNonQuery();

                Response.Redirect("Categories.aspx");
            }
            else
            {
                SqlCommand cmdUpdate = new SqlCommand("update TblCategory Set categoryName='" + txtUpdCatName.Text + "',categoryNo='" + txtUpdCatNo.Text + "',categoryPiece='" + txtUpdCatCount.Text + "' where categoryID='" + categoryID + "'", connection.connect());
                cmdUpdate.ExecuteNonQuery();
                Response.Redirect("Categories.aspx");
            }
        }
    }
}