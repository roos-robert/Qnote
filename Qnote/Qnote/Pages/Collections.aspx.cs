using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Qnote.Models;

namespace Qnote.Pages
{
    public partial class Categories : System.Web.UI.Page
    {
        // Lazy init.
        private Service _service;

        private Service Service
        {
            get { return _service ?? (_service = new Service()); }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            // Get out, nothing to see here!
        }

        public IEnumerable<CollectionName> QnoteListView_GetData()
        {
            try
            {
                return Service.GetCollectionNames();
            }
            catch (Exception)
            {
                // If by some reason my FormView fails to see there are no posts, ModelState saves the day!
                ModelState.AddModelError("", "Ett fel inträffade när samlingarna skulle hämtas, försök om en stund igen!");
                QnoteListView.Visible = false;
                return null;
            }
        }
    }
}