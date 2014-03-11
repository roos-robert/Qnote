using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Qnote.Models;

namespace Qnote.Pages
{
    public partial class NewNote : System.Web.UI.Page
    {
        private Service _service;

        private Service Service
        {
            get { return _service ?? (_service = new Service()); }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        public IEnumerable<CollectionName> DropDownListCollection_GetData()
        {
            try
            {
                // Retrieves all the collectionnames and sends them to the dropdownlist.
                return Service.GetCollectionNames();
            }
            catch (Exception)
            {
                ModelState.AddModelError("", "Ett fel inträffade då collections skulle hämtas");
                return null;
            }          
        }

        public void FormViewNewNote_InsertItem(Models.QnoteCollectionID qnoteCollectionID)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    // Saves the note.
                    Service.CreateNoteAndCollection(qnoteCollectionID);

                    // Sets the confirm-message and redirects to the notelist.
                    Session["Success"] = "Anteckningen har nu sparats!";

                    Response.RedirectToRoute("AllNotes");
                    Context.ApplicationInstance.CompleteRequest();
                }
                catch (Exception)
                {
                    ModelState.AddModelError("", "Ett fel inträffade då anteckningen skulle läggas till.");
                }                   
            }
        }
    }
}