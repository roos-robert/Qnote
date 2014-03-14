using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Qnote.Models.DAL
{
    // This DAL handles retrieving/handling data related to the CollectionName table. Full CRUD.
    public class CollectionNameDAL : DALBase
    {
        // Creates a new collection(name).
        public void CreateCollectionName(CollectionName collectionName)
        {
            using (var conn = CreateConnection())
            {
                try
                {
                    var cmd = new SqlCommand("app.usp_CreateCollectionName", conn);
                    cmd.CommandType = CommandType.StoredProcedure;

                    // Here I'm creating the parameters that will be used.
                    cmd.Parameters.Add("@Collection", SqlDbType.VarChar, 60).Value = collectionName.CollectionNameText;

                    conn.Open();
                    cmd.ExecuteNonQuery();
                }
                catch
                {
                    throw new ApplicationException("An error occured when trying to add a collection to the database.");
                }
            }
        }

        // Retrives all collectionnames.
        public IEnumerable<CollectionName> GetCollectionNames()
        {
            using (var conn = CreateConnection())
            {
                try
                {
                    var collectionNames = new List<CollectionName>(25);

                    var cmd = new SqlCommand("app.usp_GetCollectionNames", conn);
                    cmd.CommandType = CommandType.StoredProcedure;

                    conn.Open();

                    // Creates references to the data from the database.
                    using (var reader = cmd.ExecuteReader())
                    {
                        // Figures out the index of the DB-columns.
                        var collectionNameIdIndex = reader.GetOrdinal("CollectionNameID");
                        var collectionIndex = reader.GetOrdinal("Collection");

                        while (reader.Read())
                        {
                            collectionNames.Add(new CollectionName
                            {
                                CollectionNameID = reader.GetInt32(collectionNameIdIndex),
                                CollectionNameText = reader.GetString(collectionIndex),
                            });
                        }
                    }

                    collectionNames.TrimExcess();
                    return collectionNames;
                }
                catch
                {
                    throw new ApplicationException("An error occured when trying to access and get data from database.");
                }
            }
        }

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
                        var collectionNameIndex = reader.GetOrdinal("Collection");

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

        // Deletes a collection(name).
        public void DeleteCollectionName(int CollectionNameID)
        {
            using (var conn = CreateConnection())
            {
                try
                {
                    var cmd = new SqlCommand("app.usp_DeleteCollectionName", conn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@CollectionNameID", SqlDbType.Int, 4).Value = CollectionNameID;

                    conn.Open();

                    cmd.ExecuteNonQuery();
                }
                catch
                {
                    throw new ApplicationException("An error occured when trying to remove data from the database.");
                }
            }
        }
    }
}