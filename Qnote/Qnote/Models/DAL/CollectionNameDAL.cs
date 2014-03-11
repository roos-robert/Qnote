using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Qnote.Models.DAL
{
    public class CollectionNameDAL : DALBase
    {
        // Retrives what name a collection has.
        public CollectionName GetCollectionNameByID(int CollectionNameID)
        {
            using (var conn = CreateConnection())
            {
                try
                {
                    var cmd = new SqlCommand("app.usp_GetCollectionName", conn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@CollectionNameID", SqlDbType.Int, 4).Value = CollectionNameID;

                    conn.Open();

                    using (var reader = cmd.ExecuteReader())
                    {
                        // Figures out the index of the DB-columns.
                        var collectionNameIdIndex = reader.GetOrdinal("CollectionNameID");
                        var collectionNameIndex = reader.GetOrdinal("CollectionName");

                        // If a post matching my parameter exists, an object containing the data will be created.
                        if (reader.Read())
                        {
                            return new CollectionName
                            {
                                CollectionNameID = reader.GetInt32(collectionNameIdIndex),
                                CollectionNameText = reader.GetString(collectionNameIndex)
                            };
                        }
                        else
                        {
                            return null;
                        }
                    }
                }
                catch
                {
                    throw new ApplicationException("An error occured when trying to access and get data from database.");
                }
            }
        }
    }
}