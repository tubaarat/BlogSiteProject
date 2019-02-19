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
    public partial class UpdateAnnouncement : System.Web.UI.Page
    {
        SqlConnect connection = new SqlConnect();
        string announceID = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["adminUserName"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            announceID = Request.QueryString["announceID"];

            if (!Page.IsPostBack)
            {
                string query = "Select * from TblAnnouncement where announceID='" + announceID + "'";
                SqlCommand cmdGetAnnounce = new SqlCommand(query, connection.connect());
                SqlDataReader drGetAnnounce = cmdGetAnnounce.ExecuteReader();

                DataTable dtGetAnnounce = new DataTable("table");
                dtGetAnnounce.Load(drGetAnnounce);
                DataRow row = dtGetAnnounce.Rows[0];
                txtUpdAnnounceHeader.Text = row["announceHeader"].ToString();
                ASPxHtmlEditorUpdateAnnounce.Html = row["announceContent"].ToString();
            }
        }

        protected void btnUpdateAnnounce_Click(object sender, EventArgs e)
        {
            string query = "Update TblAnnouncement Set announceHeader='" + txtUpdAnnounceHeader.Text + "', announceContent='" + ASPxHtmlEditorUpdateAnnounce.Html.ToString() + "' where announceID='" + announceID + "'";
            SqlCommand cmdUpdAnnounce = new SqlCommand(query, connection.connect());
            cmdUpdAnnounce.ExecuteNonQuery();
            Response.Redirect("Announcements.aspx");
        }
    }
}