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
    public partial class Categories : System.Web.UI.Page
    {
        SqlConnect connection = new SqlConnect();
        string categoryID = "";
        string transaction = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["adminUserName"] == null)
            {
                Response.Redirect("Login.aspx");
            }

            categoryID = Request.QueryString["categoryID"];
            transaction = Request.QueryString["transaction"];
            if(transaction == "delete")
            {
                SqlCommand cmdDelete = new SqlCommand("delete from TblCategory where categoryID='"+categoryID+"'",connection.connect());
                cmdDelete.ExecuteNonQuery();
            }

            if (!Page.IsPostBack)
            {
                pnlCategoryAdd.Visible = false;
                pnlCategoryEdit.Visible = false;
            }

            //kategorileri dataliste çekme
            SqlCommand cmdListData = new SqlCommand("Select * from TblCategory",connection.connect());
            SqlDataReader drListData = cmdListData.ExecuteReader();
            dlCategoryList.DataSource = drListData;
            dlCategoryList.DataBind();

        }

        protected void btnCatPanelOpen_Click(object sender, EventArgs e)
        {
            pnlCategoryAdd.Visible = true;
        }

        protected void btnCatPanelClose_Click(object sender, EventArgs e)
        {
            pnlCategoryAdd.Visible = false;
        }

        protected void btnAddCategory_Click(object sender, EventArgs e)
        {
            if (fuCategoryPicture.HasFile)
            {
                fuCategoryPicture.SaveAs(Server.MapPath("/CategoryPictures/" + fuCategoryPicture.FileName));
                SqlCommand cmdAddCategory = new SqlCommand("insert into TblCategory(categoryName,categoryNo,categoryPicture) Values('" + txtCategoryName.Text + "','" + txtCategoryNo.Text + "','/CategoryPictures/" + fuCategoryPicture.FileName + "')", connection.connect());
                cmdAddCategory.ExecuteNonQuery();
                Response.Redirect("Categories.aspx");
            }
            else
            {
                lblValidation.Text = "Kategori eklemek için bir resim yüklemelisiniz!";
            }
        }

        protected void btnEditCatOpen_Click(object sender, EventArgs e)
        {
            pnlCategoryEdit.Visible = true;
        }

        protected void btnEditCatClose_Click(object sender, EventArgs e)
        {
            pnlCategoryEdit.Visible = false;
        }
    }
}