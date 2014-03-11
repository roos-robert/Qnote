using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Qnote.Models
{
    public class CollectionName
    {
        public int CollectionNameID { get; set; }

        // Validation with data annotations of text beeing entered.
        [Required(ErrorMessage = "En samling måste anges.")]
        [StringLength(60)]
        public string CollectionNameText { get; set; }
    }
}