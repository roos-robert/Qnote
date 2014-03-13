using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Qnote.Models.DAL
{
    // This DAL handles retrieving/handling data related to the Collection table.
    public class CollectionDAL : DALBase
    {
        // Retrives what collection a note belongs to.
        public Collection GetCollectionByNoteID(int NoteID)
        {
            using (var conn = CreateConnection())
            {
                try
                {
                    var cmd = new SqlCommand("app.usp_GetCollection", conn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@NoteID", SqlDbType.Int, 4).Value = NoteID;

                    conn.Open();

                    using (var reader = cmd.ExecuteReader())
                    {
                        // Figures out the index of the DB-columns.
                        var collectionIdIndex = reader.GetOrdinal("CollectionID");
                        var collectionNameIdIndex = reader.GetOrdinal("CollectionNameID");
                        var noteIdIndex = reader.GetOrdinal("NoteID");

                        // If a post matching my parameter exists, an object containing the data will be created.
                        if (reader.Read())
                        {
                            return new Collection
                            {
                                CollectionID = reader.GetInt32(collectionIdIndex),
                                CollectionNameID = reader.GetInt32(collectionNameIdIndex),
                                NoteID = reader.GetInt32(noteIdIndex)
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