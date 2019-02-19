using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Globalization;
using System.Text.RegularExpressions;
using System.Data;
using System.Data.SqlClient;

namespace BlogSiteProject
{
    public partial class ArticleDetails : System.Web.UI.Page
    {
        SqlConnect connection = new SqlConnect();
        string articleID = "";
        protected void Page_Load(object sender, EventArgs e)
        {
          
            articleID = Request.QueryString["articleID"];
           if(!Page.IsPostBack)
            {
                //makale detay görüntüleme
                string query = "SELECT dbo.TblArticle.articleHeader, dbo.TblArticle.articleContent, dbo.TblArticle.articleDate, dbo.TblArticle.articleReadCount, dbo.TblArticle.articleID, dbo.TblCategory.categoryPicture, dbo.TblCategory.categoryID, dbo.TblArticle.articleCommentCount FROM dbo.TblArticle INNER JOIN dbo.TblCategory ON dbo.TblArticle.categoryID = dbo.TblCategory.categoryID where dbo.TblArticle.articleID='" + articleID + "'";
                SqlCommand cmdGetArticleDetail = new SqlCommand(query, connection.connect());
                SqlDataReader drGetArticleDetail = cmdGetArticleDetail.ExecuteReader();

                dlGetArticleDetail.DataSource = drGetArticleDetail;
                dlGetArticleDetail.DataBind();

                //makale okunma sayısı

                string query1 = "update TblArticle Set articleReadCount=articleReadCount+1 where articleID='"+articleID+"'";
                SqlCommand cmdReadCount = new SqlCommand(query1,connection.connect());
                cmdReadCount.ExecuteNonQuery();

                //yorumları getir

                string queryGetcomment = "select * from TblComment where articleID='"+articleID+"' and commentConfirm=1";
                SqlCommand cmdGetAllComment = new SqlCommand(queryGetcomment,connection.connect());
                SqlDataReader drGetAllComment = cmdGetAllComment.ExecuteReader();

                dlGetAllComments.DataSource = drGetAllComment;
                dlGetAllComments.DataBind();
               


              
            }
        }

        protected void btnAddComment_Click(object sender, EventArgs e)
        {
            string query2 = "Insert into TblComment(commentName,commentEmail,commentContent,commentPicture,articleID) Values('"+txtCommentName.Text+"','"+txtCommentEmail.Text+"','"+txtComentContent.Text+"','/images/commentator.png','"+articleID+"')";
            SqlCommand cmdAddComment = new SqlCommand(query2,connection.connect());
            cmdAddComment.ExecuteNonQuery();
            lblInfo.Text = "Yorumunuz alındı!Teşekkürler.";

            txtComentContent.Text = "";
            txtCommentEmail.Text = "";
            txtCommentName.Text = "";
        }
    } 
}