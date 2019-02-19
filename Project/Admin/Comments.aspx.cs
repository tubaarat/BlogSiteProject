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
    public partial class Comments : System.Web.UI.Page
    {
        SqlConnect connection = new SqlConnect();
        string transaction = "";
        string commentID = "";
        string transaction2 = "";
        string articleID = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["adminUserName"] == null)
            {
                Response.Redirect("Login.aspx");
            }

            commentID = Request.QueryString["commentID"];
            transaction = Request.QueryString["transaction"];
            transaction2 = Request.QueryString["transaction2"];
            if (transaction == "delete")
            {
                string queryDel = "Delete from TblComment where commentID='" + commentID + "'";
                SqlCommand cmdDeleteComment = new SqlCommand(queryDel, connection.connect());
                cmdDeleteComment.ExecuteNonQuery();

                Response.Redirect("Comments.aspx");
            }

            if (transaction2 == "delete2")
            {
                string queryDel2 = "Delete from TblComment where commentID='" + commentID + "'";
                SqlCommand cmdDeleteComment2 = new SqlCommand(queryDel2, connection.connect());
                cmdDeleteComment2.ExecuteNonQuery();               

                Response.Redirect("Comments.aspx");
            }

            if (!Page.IsPostBack)
            {              

                pnlNotConfirmComments.Visible = false;
                pnlConfirmComment.Visible = false;


                //onaylanmamış yorumları getir
                string query = "SELECT dbo.TblArticle.articleID AS Expr1, dbo.TblArticle.articleHeader, dbo.TblArticle.articleCommentCount, dbo.TblComment.* FROM dbo.TblArticle INNER JOIN dbo.TblComment ON dbo.TblArticle.articleID = dbo.TblComment.articleID where commentConfirm=0";
                SqlCommand cmdGetComments = new SqlCommand(query, connection.connect());
                SqlDataReader drGetComment = cmdGetComments.ExecuteReader();

                dlGetComments.DataSource = drGetComment;
                dlGetComments.DataBind();

                //onaylanmış yorumları getir
                string query1 = "SELECT dbo.TblArticle.articleID AS Expr1, dbo.TblArticle.articleHeader, dbo.TblArticle.articleCommentCount, dbo.TblComment.* FROM dbo.TblArticle INNER JOIN dbo.TblComment ON dbo.TblArticle.articleID = dbo.TblComment.articleID where commentConfirm=1";
                SqlCommand cmdGetConfirmedComment = new SqlCommand(query1, connection.connect());
                SqlDataReader drGetConfirmedComment = cmdGetConfirmedComment.ExecuteReader();

                dlConfirmedComment.DataSource = drGetConfirmedComment;
                dlConfirmedComment.DataBind();
            }
        }

        protected void btnNotConfirmCommentPnlOpen_Click(object sender, EventArgs e)
        {
            pnlNotConfirmComments.Visible = true;
        }

        protected void btnNotConfirmCommentPnlClose_Click(object sender, EventArgs e)
        {
            pnlNotConfirmComments.Visible = false;
        }

        protected void btnConfirmCommentPnlOpen_Click(object sender, EventArgs e)
        {
            pnlConfirmComment.Visible = true;
        }

        protected void btnConfirmCommentPnlClose_Click(object sender, EventArgs e)
        {
            pnlConfirmComment.Visible = false;
        }
    }
}