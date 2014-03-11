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

        // Retrives a specific Note.
        public Qnote GetNoteByID(int NoteID)
        {
            using (var conn = CreateConnection())
            {
                try
                {
                    var cmd = new SqlCommand("app.usp_GetNote", conn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@NoteID", SqlDbType.Int, 4).Value = NoteID;

                    conn.Open();

                    using (var reader = cmd.ExecuteReader())
                    {
                        // Figures out the index of the DB-columns.
                        var noteIdIndex = reader.GetOrdinal("NoteID");
                        var headerIndex = reader.GetOrdinal("Header");
                        var noteIndex = reader.GetOrdinal("Note");
                        var dateIndex = reader.GetOrdinal("Date");
                        var userIdIndex = reader.GetOrdinal("UserID");

                        // If a post matching my parameter exists, an object containing the data will be created.
                        if (reader.Read())
                        {
                            return new Qnote
                            {
                                NoteID = reader.GetInt32(noteIdIndex),
                                Header = reader.GetString(headerIndex),
                                Note = reader.GetString(noteIndex),
                                Date = reader.GetDateTime(dateIndex),
                                UserID = reader.GetInt32(userIdIndex)
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

        // Creates a new note.
        public void CreateNote(Qnote qnote)
        {
            using (var conn = CreateConnection())
            {
                try
                {
                    var cmd = new SqlCommand("app.usp_CreateNote", conn);
                    cmd.CommandType = CommandType.StoredProcedure;

                    // Here im creating the parameters that will be used.
                    cmd.Parameters.Add("@Header", SqlDbType.VarChar, 60).Value = qnote.Header;
                    cmd.Parameters.Add("@Note", SqlDbType.VarChar, 2000).Value = qnote.Note;
                    cmd.Parameters.Add("@UserID", SqlDbType.Int, 4).Value = qnote.UserID;

                    // This parameter retrieves the ID of the post just inserted.
                    //cmd.Parameters.Add("@NoteID", SqlDbType.Int, 4).Direction = ParameterDirection.Output;

                    conn.Open();
                    cmd.ExecuteNonQuery();

                    // Retrives the NoteID and adds it to the object.
                    //qnote.NoteID = (int)cmd.Parameters["@ContactID"].Value;
                }
                catch
                {
                    throw new ApplicationException("An error occured when trying to add a note to the database.");
                }
            }
        }

        // Updates a existing note.
        public void UpdateNote(Qnote qnote)
        {
            using (var conn = CreateConnection())
            {
                try
                {
                    var cmd = new SqlCommand("app.usp_UpdateNote", conn);
                    cmd.CommandType = CommandType.StoredProcedure;

                    // Here im creating the parameters that will be used.
                    cmd.Parameters.Add("@NoteID", SqlDbType.Int, 4).Value = qnote.NoteID;
                    cmd.Parameters.Add("@Header", SqlDbType.VarChar, 60).Value = qnote.Header;
                    cmd.Parameters.Add("@Note", SqlDbType.VarChar, 2000).Value = qnote.Note;
                    cmd.Parameters.Add("@UserID", SqlDbType.Int, 4).Value = qnote.UserID;

                    conn.Open();
                    cmd.ExecuteNonQuery();
                }
                catch
                {
                    throw new ApplicationException("An error occured when trying to update a note.");
                }
            }
        }

        // Deletes a note
        public void DeleteNote(int NoteID)
        {
            using (var conn = CreateConnection())
            {
                try
                {
                    var cmd = new SqlCommand("app.usp_DeleteNote", conn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@NoteID", SqlDbType.Int, 4).Value = NoteID;

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