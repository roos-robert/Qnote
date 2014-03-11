using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Qnote.Models;

namespace Qnote.Pages
{
    public partial class SingleNote : System.Web.UI.Page
    {
        private Service _service;

        private Service Service
        {
            get { return _service ?? (_service = new Service()); }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                HeaderLitteral.Text = RouteData.Values["header"].ToString();
            }
            catch (Exception)
            {
                HeaderLitteral.Text = "Titel saknas";
            }
            
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
            catch(Exception)
            {
                // TODO Implement UI error-handling.
                throw new ApplicationException("Anteckningen finns inte.");
            }         
        }
    }
}