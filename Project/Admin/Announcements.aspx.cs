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
    public partial class Announcements : System.Web.UI.Page
    {
        SqlConnect connection = new SqlConnect();
        string transaction = "";
        string announceID = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["adminUserName"] == null)
            {
                Response.Redirect("Login.aspx");
            }

            announceID = Request.QueryString["announceID"];
            transaction = Request.QueryString["transaction"];

            if (transaction == "delete")
            {
                string query = "Delete from TblAnnouncement where announceID='" + announceID + "'";
                SqlCommand cmdDelAnnounce = new SqlCommand(query, connection.connect());
                cmdDelAnnounce.ExecuteNonQuery();
            }

            if (Page.IsPostBack == false)
            {
                pnlAnnounceAdd.Visible = false;
                pnlEditAnnounce.Visible = false;


                //duyuruları getir.
                string query = "Select * from TblAnnouncement";
                SqlCommand cmdGetAnnounce = new SqlCommand(query, connection.connect());
                SqlDataReader drGetAnnounce = cmdGetAnnounce.ExecuteReader();

                dlGetAnnounce.DataSource = drGetAnnounce;
                dlGetAnnounce.DataBind();
            }
        }

        protected void btnAnnouncePnlOpen_Click(object sender, EventArgs e)
        {
            pnlAnnounceAdd.Visible = true;
        }

        protected void btnAnnouncePnlClose_Click(object sender, EventArgs e)
        {
            pnlAnnounceAdd.Visible = false;
        }

        protected void btnAddAnnounce_Click(object sender, EventArgs e)
        {
            string query = "Insert into TblAnnouncement(announceHeader,announceContent,announcePicture) Values('" + txtAddAnnounceHeader.Text + "','" + ASPxHtmlEditorAddAnnounce.Html.ToString() + "','/images/duyuru-icon.png')";
            SqlCommand cmdAddAnnounce = new SqlCommand(query, connection.connect());
            cmdAddAnnounce.ExecuteNonQuery();
            Response.Redirect("Announcements.aspx");
        }

        protected void btnEditAnnouncePnlOpen_Click(object sender, EventArgs e)
        {
            pnlEditAnnounce.Visible = true;
        }

        protected void btnEditAnnouncePnlClose_Click(object sender, EventArgs e)
        {
            pnlEditAnnounce.Visible = false;
        }
    }
}