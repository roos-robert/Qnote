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

        // Retrieves all collections from the database.
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

        // Method for adding a new collection to the database.
        public void QnoteListView_InsertItem(CollectionName collectionName)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    Service.CreateCollectionName(collectionName);
                    Session["Success"] = "Samlingen har skapats!";
                    Response.RedirectToRoute("Collections");
                    Context.ApplicationInstance.CompleteRequest();
                }
                catch (Exception)
                {
                    ModelState.AddModelError("", "Ett fel inträffade då samlingen skulle läggas till, försök igen om en stund!");
                }             
            }
        }
    }
}