using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
namespace BlogSiteProject
{
    public partial class CategoryDetails : System.Web.UI.Page
    {
        SqlConnect connection = new SqlConnect();
        string categoryID = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            categoryID = Request.QueryString["categoryID"];

            string query = "SELECT dbo.TblArticle.articleHeader, dbo.TblArticle.articleResume, dbo.TblArticle.articleDate, dbo.TblArticle.articleReadCount, dbo.TblCategory.categoryPicture, dbo.TblCategory.categoryID, dbo.TblArticle.articleCommentCount, dbo.TblArticle.articleID FROM dbo.TblArticle INNER JOIN dbo.TblCategory ON dbo.TblArticle.categoryID = dbo.TblCategory.categoryID where dbo.TblCategory.categoryID='" + categoryID+"'";
            SqlCommand cmdCategoryDetail = new SqlCommand(query,connection.connect());
            SqlDataReader drCategoryDetail = cmdCategoryDetail.ExecuteReader();

            dlGetCategoryDetail.DataSource = drCategoryDetail;
            dlGetCategoryDetail.DataBind();
            
        }
    }
}