using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Qnote.Models
{
    // This class represents the Note table in the database, to avoid name conflicts (since i named a row the same as the table) the class is named Qnote.
    public class Qnote
    {
        public int NoteID { get; set; }

        // Validation with data annotations of text beeing entered.
        [Required(ErrorMessage = "En rubrik måste anges.")]
        [StringLength(60)]
        public string Header { get; set; }

        [Required(ErrorMessage = "En anteckning måste ha minst 1 tecken, max 2000.")]
        [StringLength(2000)]
        public string Note { get; set; }

        public DateTime Date { get; set; }
        public int UserID { get; set; }
    }
}