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
    public partial class AnswerComments : System.Web.UI.Page
    {
        SqlConnect connection = new SqlConnect();
        string articleID = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["adminUserName"] == null)
            {
                Response.Redirect("Login.aspx");
            }
        }

        protected void btnCommentAnswer_Click(object sender, EventArgs e)
        {
            articleID = Request.QueryString["articleID"];

            string query = "Insert into TblComment(commentName, commentContent, commentPicture,articleID) Values('" + txtAdminName.Text + "','" + txtCommentContent.Text + "', '/images/admin.png', '" + articleID + "')";
            SqlCommand cmdAddComment = new SqlCommand(query, connection.connect());
            cmdAddComment.ExecuteNonQuery();
            Response.Redirect("Comments.aspx");

        }
    }
}