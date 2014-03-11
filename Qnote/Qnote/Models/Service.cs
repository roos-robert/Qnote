using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Qnote.Models.DAL;

namespace Qnote.Models
{
    public class Service
    {
        private NoteDAL _noteDAL;

        private NoteDAL NoteDAL
        {
            get { return _noteDAL ?? (_noteDAL = new NoteDAL()); }
        }

        // Gets all notes.
        public IEnumerable<Qnote> GetNotes()
        {
            return NoteDAL.GetNotes();
        }

        // Gets specific note.
        public Qnote GetNote(int NoteID)
        {
            return NoteDAL.GetNoteByID(NoteID);
        }

        // Deletes specific note.
        public void DeleteNote(int NoteID)
        {
            NoteDAL.DeleteNote(NoteID);
        }
    }
}