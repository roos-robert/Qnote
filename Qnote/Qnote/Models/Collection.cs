using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Qnote.Models
{
    public class Collection
    {
        public int CollectionID { get; set; }
        public int CollectionNameID { get; set; }
        public int NoteID { get; set; }
    }
}