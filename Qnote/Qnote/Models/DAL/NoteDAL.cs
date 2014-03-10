using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Qnote.Models.DAL
{
    public class NoteDAL : DALBase
    {
        // Collection for looping out references to the Qnote-object (Quick-notes, gets all for a specific user).
        public IEnumerable<Qnote> GetNotes()
        {
            using (var conn = CreateConnection())
            {
                try
                {
                    var qnotes = new List<Qnote>(25);

                    var cmd = new SqlCommand("app.usp_GetNotes", conn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    // Note, this parameter should be connected to a session, this is only for testing.
                    cmd.Parameters.Add("@UserID", SqlDbType.Int, 4).Value = 1;

                    conn.Open();

                    // Creates references to the data from the database.
                    using (var reader = cmd.ExecuteReader())
                    {
                        // Figures out the index of the DB-columns.
                        var noteIdIndex = reader.GetOrdinal("NoteID");
                        var headerIndex = reader.GetOrdinal("Header");
                        var noteIndex = reader.GetOrdinal("Note");
                        var dateIndex = reader.GetOrdinal("Date");
                        var userIdIndex = reader.GetOrdinal("UserID");

                        while (reader.Read())
                        {
                            qnotes.Add(new Qnote
                            {
                                NoteID = reader.GetInt32(noteIdIndex),
                                Header = reader.GetString(headerIndex),
                                Note = reader.GetString(noteIndex),
                                Date = reader.GetDateTime(dateIndex),
                                UserID = reader.GetInt32(userIdIndex)
                            });
                        }
                    }

                    qnotes.TrimExcess();
                    return qnotes;
                }
                catch
                {
                    throw new ApplicationException("An error occured when trying to access and get data from database.");
                }
            }
        }
    }
}