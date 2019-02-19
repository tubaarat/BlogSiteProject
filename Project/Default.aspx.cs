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
    public partial class Default : System.Web.UI.Page
    {
        SqlConnect connection = new SqlConnect();
        protected void Page_Load(object sender, EventArgs e)
        {
            string query = "SELECT dbo.TblArticle.articleHeader, dbo.TblArticle.articleResume, dbo.TblArticle.articleID, dbo.TblArticle.articleDate, dbo.TblArticle.articleReadCount, dbo.TblCategory.categoryPicture, dbo.TblArticle.articleCommentCount FROM dbo.TblArticle INNER JOIN dbo.TblCategory ON dbo.TblArticle.categoryID = dbo.TblCategory.categoryID";
            SqlCommand cmdArticle = new SqlCommand(query,connection.connect());
            SqlDataReader drGetArticle = cmdArticle.ExecuteReader();

            dlGetArticle.DataSource = drGetArticle;
            dlGetArticle.DataBind();
        }
    }
}