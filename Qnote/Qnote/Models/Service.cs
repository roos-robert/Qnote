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

        // Hämtar alla kontakter.
        public IEnumerable<Qnote> GetNotes()
        {
            return NoteDAL.GetNotes();
        }
    }
}