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
    public partial class Users : System.Web.UI.MasterPage
    {
        SqlConnect connection = new SqlConnect();
        protected void Page_Load(object sender, EventArgs e)
        {
            //duyurular
            string query = "select * from TblAnnouncement";
            SqlCommand cmdGetAnnounce = new SqlCommand(query,connection.connect());
            SqlDataReader drGetAnnounce = cmdGetAnnounce.ExecuteReader();

            dlAnnouncement.DataSource = drGetAnnounce;
            dlAnnouncement.DataBind();
            //kategoriler

            string query2 = "select * from TblCategory";
            SqlCommand cmdCategory = new SqlCommand(query2,connection.connect());
            SqlDataReader drCategory = cmdCategory.ExecuteReader();

            dlGetCategory.DataSource = drCategory;
            dlGetCategory.DataBind();
        }
    }
}