using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Qnote.Models;

namespace Qnote.Pages
{
    public partial class UpdateNote : System.Web.UI.Page
    {
        private Service _service;

        private Service Service
        {
            get { return _service ?? (_service = new Service()); }
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public QnoteCollection QnoteListView_GetData()
        {
            try
            {
                // First off i get all the data for the requested note.
                var note = Service.GetNote(Int32.Parse(RouteData.Values["id"].ToString()));
                if (note != null)
                {
                    // If the note exists i get all the data from the collections table for it and save it.
                    var collection = Service.GetCollection(note.NoteID);
                    // Then i look up the name for the collection the note belongs to and save it.
                    var collectionName = Service.GetCollectionName(collection.CollectionNameID);

                    // Last i put all the pieces together into a new object that i return back to the list view.
                    QnoteCollection _collection = new QnoteCollection();
                    _collection.NoteID = note.NoteID;
                    _collection.Header = note.Header;
                    _collection.Note = note.Note;
                    _collection.Date = note.Date;
                    _collection.CollectionNameText = collectionName.CollectionNameText;

                    return _collection;
                }
                else
                {
                    return null;
                }
            }
            catch (Exception)
            {
                // If something goes wrong, ModelState saves the day by presenting a error that the user can DO NOTHING ABOUT muahaha.
                ModelState.AddModelError("", "Går inte att hämta anteckningens data då denna inte existerar.");
                return null;
            }
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
                ModelState.AddModelError("", "Ett fel inträffade då samlingar skulle hämtas, försök uppdatera anteckningen lite senare!");
                QnoteUpdateFormView.Visible = false;
                return null;
            }
        }

        public void QnoteListView_UpdateItem(QnoteCollectionID qnoteCollectionID)
        {
            if (ModelState.IsValid)
            {                
                try
                {
                    if (qnoteCollectionID.NoteID <= 0)
                    {
                        // Checks if the note exists, else we wont be able to update it, right!?
                        ModelState.AddModelError("", String.Format("Anteckningen med det angivna id:t {0} existerar inte!", qnoteCollectionID.NoteID));
                        return;
                    }
                    else 
                    {
                        DropDownList ddlCollection = QnoteUpdateFormView.FindControl("DropDownListCollection") as DropDownList;
                        qnoteCollectionID.CollectionNameID = Int32.Parse(ddlCollection.SelectedValue.ToString());
                        
                        
                        // Updates the note, and shows that all worked out!
                        Service.CreateNoteAndCollection(qnoteCollectionID);
                        Session["Success"] = "Anteckningen har uppdaterats!";
                        Response.RedirectToRoute("SingleNote", new { id = qnoteCollectionID.NoteID, header = qnoteCollectionID.Header });
                        Context.ApplicationInstance.CompleteRequest();
                    }
                }
                catch (Exception)
                {
                    ModelState.AddModelError("", "Ett fel inträffade då anteckningen skulle uppdateras, försök igen om en stund!");
                }
            }
        }
    }
}