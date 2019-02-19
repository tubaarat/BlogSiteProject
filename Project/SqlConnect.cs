using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace BlogSiteProject
{
    public class SqlConnect
    {
        public SqlConnection connect()
        {
            SqlConnection connection = new SqlConnection("Data Source=.; Initial Catalog=BlogSiteDB; Integrated Security=true");
            connection.Open();
            SqlConnection.ClearPool(connection);
            SqlConnection.ClearAllPools();
            return connection;
        }
    }
}