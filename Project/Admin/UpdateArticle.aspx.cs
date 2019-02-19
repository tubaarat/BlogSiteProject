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
    public partial class UpdateArticle : System.Web.UI.Page
    {
        SqlConnect connection = new SqlConnect();
        string articleID = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["adminUserName"] == null)
            {
                Response.Redirect("Login.aspx");
            }

            articleID = Request.QueryString["articleID"];
            if(!Page.IsPostBack)
            {
                string query = "select * from TblArticle where articleID='"+articleID+"'";
                SqlCommand cmdGetArticle = new SqlCommand(query, connection.connect());
                SqlDataReader drGetArticle = cmdGetArticle.ExecuteReader();

                DataTable dtgetArticle = new DataTable("table");
                dtgetArticle.Load(drGetArticle);
                DataRow row = dtgetArticle.Rows[0];
                txtUpdArtHeader.Text = row["articleHeader"].ToString();
                txtResume.Text = row["articleResume"].ToString();
                ASPxHtmlEditorUpdateArticle.Html = row["articleContent"].ToString();
                txtCommentCount.Text = row["articleCommentCount"].ToString();
            }
        }

        protected void btnUpdateArticle_Click(object sender, EventArgs e)
        {
            string query = "update TblArticle set articleHeader='"+txtUpdArtHeader.Text+"',articleResume='"+txtResume.Text+"',articleContent='"+ASPxHtmlEditorUpdateArticle.Html.ToString()+"',articleCommentCount='"+txtCommentCount.Text+"' where articleID='"+articleID+"'";
            SqlCommand cmdUpdate = new SqlCommand(query, connection.connect());
            cmdUpdate.ExecuteNonQuery();

            Response.Redirect("Articles.aspx");
        }
    }
}