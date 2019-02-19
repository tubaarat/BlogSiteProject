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
    public partial class UpdateComments : System.Web.UI.Page
    {

        SqlConnect connection = new SqlConnect();
        string commentID = "";
        string articleID = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["adminUserName"] == null)
            {
                Response.Redirect("Login.aspx");
            }

            commentID = Request.QueryString["commentID"];
            if (!Page.IsPostBack)
            {
                string query = "select * from TblComment where commentID='" + commentID + "'";
                SqlCommand cmdGetComments = new SqlCommand(query, connection.connect());
                SqlDataReader drGetcomment = cmdGetComments.ExecuteReader();

                DataTable dtGetComment = new DataTable("table");
                dtGetComment.Load(drGetcomment);

                DataRow row = dtGetComment.Rows[0];

                txtCommentatorName.Text = row["commentName"].ToString();
                txtCommentContent.Text = row["commentContent"].ToString();


            }
        }

        protected void btnUpdateComment_Click(object sender, EventArgs e)
        {
            string query1 = "Update TblComment Set commentName='" + txtCommentatorName.Text + "', commentContent='" + txtCommentContent.Text + "', commentConfirm='" + cbConfirm.Checked + "' where commentID='" + commentID + "'";
            articleID = Request.QueryString["articleID"];
            
            SqlCommand cmdConfirm = new SqlCommand(query1, connection.connect());
            cmdConfirm.ExecuteNonQuery();
            
            if (cbConfirm.Checked)
            {

                string query2 = "Update TblArticle Set articleCommentCount=articleCommentCount+1 where articleID='" + articleID + "'";
                SqlCommand cmdUpdateArticleCommentCounter = new SqlCommand(query2, connection.connect());
                cmdUpdateArticleCommentCounter.ExecuteNonQuery();
            }

            if(!cbConfirm.Checked)
            {
                string queryUpd = "Update TblArticle Set articleCommentCount=articleCommentCount-1 where articleID='" + articleID + "'";
                SqlCommand cmdUpdateArticleCommentCounter = new SqlCommand(queryUpd, connection.connect());
                cmdUpdateArticleCommentCounter.ExecuteNonQuery();
                Response.Redirect("Comments.aspx");
            }

            Response.Redirect("Comments.aspx");
        }
    }
}