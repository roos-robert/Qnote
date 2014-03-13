using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Qnote.Models
{
    // This class represents the databasetable Collection, it handles what note belongs to which collection.
    public class Collection
    {
        public int CollectionID { get; set; }
        public int CollectionNameID { get; set; }
        public int NoteID { get; set; }
    }
}