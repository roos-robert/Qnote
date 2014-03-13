using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;

namespace Qnote.Models.DAL
{
    public abstract class DALBase
    {
        private static string connectionString;

        // Creates and returns a reference to a connection object.
        protected SqlConnection CreateConnection()
        {
            SqlConnection conn = new SqlConnection(connectionString);
            return conn;
        }

        // Inits connectionString by retrieving the connection string from Web.config.
        static DALBase()
        {
            connectionString = WebConfigurationManager.ConnectionStrings["QnoteConnectionString"].ConnectionString;
        }
    }
}