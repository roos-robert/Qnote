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

        public IEnumerable<QnoteCollectionID> QnoteListView_GetData()
        {
            try
            {
                // Here i get all notes and put them in "qnote" then get the collection for the note, and the name for the collection.
                // After that i throw all the info into a new QnoteCollection object and return that to the listview.
                IEnumerable<QnoteCollectionID> participants = from qnote in Service.GetNotes(Int32.Parse(Session["userID"].ToString()))
                                                            let collection = Service.GetCollection(qnote.NoteID)
                                                            let collectionName = Service.GetCollectionName(collection.CollectionNameID)
                                                            select new QnoteCollectionID
                                                            {
                                                                NoteID = qnote.NoteID,
                                                                Header = qnote.Header,
                                                                Note = qnote.Note,
                                                                //CollectionNameText = collectionName.CollectionNameText
                                                            };
                return participants;
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