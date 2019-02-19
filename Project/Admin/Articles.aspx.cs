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
    public partial class Articles : System.Web.UI.Page
    {
        SqlConnect connection = new SqlConnect();
        string articleID = "";
        string transaction = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["adminUserName"]==null)
            {
                Response.Redirect("Login.aspx");
            }


            articleID = Request.QueryString["articleID"];
            transaction = Request.QueryString["transaction"];

            if (transaction == "delete")
            {
                string query = "Delete from TblArticle where articleID='" + articleID + "'";
                SqlCommand cmdDelete = new SqlCommand(query, connection.connect());
                cmdDelete.ExecuteNonQuery();
            }


            if (Page.IsPostBack == false)
            {
                pnlArticleAdd.Visible = false;
                pnlEditArticle.Visible = false;
                pnlAddFile.Visible = false;

                //kategorileri getir.
                SqlCommand cmdGetCategory = new SqlCommand("Select * from TblCategory", connection.connect());
                SqlDataReader drGetCategory = cmdGetCategory.ExecuteReader();
                ddlCategory.DataTextField = "categoryName";
                ddlCategory.DataValueField = "categoryID";
                ddlCategory.DataSource = drGetCategory;
                ddlCategory.DataBind();

                //makaleleri getir
                string query = "select * from TblArticle";
                SqlCommand cmdGetArticles = new SqlCommand(query, connection.connect());
                SqlDataReader drGetArticle = cmdGetArticles.ExecuteReader();

                dtlGetArticles.DataSource = drGetArticle;
                dtlGetArticles.DataBind();
            }
        }

        protected void btnArticlePnlOpen_Click(object sender, EventArgs e)
        {
            if (pnlEditArticle.Visible)
            {
                pnlEditArticle.Visible = false;
            }
            pnlArticleAdd.Visible = true;
        }

        protected void btnArticlePnlClose_Click(object sender, EventArgs e)
        {
            pnlArticleAdd.Visible = false;
        }

        protected void btnAddArticle_Click(object sender, EventArgs e)
        {

            string query = "Insert into TblArticle(articleHeader,articleResume,articleContent,categoryID) Values('" + txtHeader.Text + "','" + txtResume.Text + "','" + ASPxHtmlEditorAddArticle.Html.ToString() + "','" + ddlCategory.SelectedValue + "')";
            SqlCommand cmdAddArticle = new SqlCommand(query, connection.connect());

            cmdAddArticle.ExecuteNonQuery();
            string query1 = "update TblCategory Set categoryPiece=categoryPiece+1 where categoryID='" + ddlCategory.SelectedValue + "'";
            SqlCommand cmdCategoryCount = new SqlCommand(query1, connection.connect());
            cmdCategoryCount.ExecuteNonQuery();

            Response.Redirect("Articles.aspx");


        }
        protected void btnOpenEditArtPnl_Click(object sender, EventArgs e)
        {
            if (pnlArticleAdd.Visible)
            {
                pnlArticleAdd.Visible = false;
            }
            pnlEditArticle.Visible = true;
        }

        protected void btnCloseEditArtPnl_Click(object sender, EventArgs e)
        {
            pnlEditArticle.Visible = false;
        }

        protected void btnOpenPnlAddFile_Click(object sender, EventArgs e)
        {
            pnlAddFile.Visible = true;
        }

        protected void btnClosePnlAddFile_Click(object sender, EventArgs e)
        {
            pnlAddFile.Visible = false;
        }

        protected void btnAddFiles_Click(object sender, EventArgs e)
        {
            if (fuAddFile.HasFile)
            {
                fuAddFile.SaveAs(Server.MapPath("/Files/" + fuAddFile.FileName));
                Response.Redirect("Articles.aspx");
            }
            else
            {
                lblAddFileError.Text = "Dosya yükleyiniz!";
            }
        }
    }
}