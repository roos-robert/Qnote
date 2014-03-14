using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Qnote.Models.DAL;
using System.ComponentModel.DataAnnotations;

namespace Qnote.Models
{
    // This is a class for handling all the interaction between the presentation layers and the data layers. Beautiful aint it?
    public class Service
    {
        #region Note CRUD
        // Init of the NoteDAL
        private NoteDAL _noteDAL;
        private NoteDAL NoteDAL
        {
            get { return _noteDAL ?? (_noteDAL = new NoteDAL()); }
        }

        // Creates or updates a note.
        public void CreateNoteAndCollection(QnoteCollectionID qnoteCollectionID)
        {
            ICollection<ValidationResult> validationResults;
            if (!qnoteCollectionID.Validate(out validationResults))
            {
                var ex = new ValidationException("The Qnote object did not pass the data validation!");
                ex.Data.Add("ValidationResults", validationResults);
                throw ex;
            }

            if (qnoteCollectionID.NoteID == 0)
            {
                NoteDAL.CreateNoteAndCollection(qnoteCollectionID);
            }
            else
            {
                NoteDAL.UpdateNoteAndCollection(qnoteCollectionID);
            }
        }

        // Gets all notes.
        public IEnumerable<Qnote> GetNotes(int UserID)
        {
            return NoteDAL.GetNotes(UserID);
        }

        // Gets specific note.
        public Qnote GetNote(int NoteID)
        {
            return NoteDAL.GetNoteByID(NoteID);
        }

        // Deletes specific note.
        public void DeleteNote(int NoteID)
        {
            NoteDAL.DeleteNote(NoteID);
        }
        #endregion

        #region Collection CRUD
        // Init of the CollectionDAL
        private CollectionDAL _collectionDAL;
        private CollectionDAL CollectionDAL
        {
            get { return _collectionDAL ?? (_collectionDAL = new CollectionDAL()); }
        }

        // Gets collection data for a specific note.
        public Collection GetCollection(int NoteID)
        {
            return CollectionDAL.GetCollectionByNoteID(NoteID);
        }
        #endregion

        #region CollectionName CRUD

        // Init of the CollectionNameDAL
        private CollectionNameDAL _collectionNameDAL;
        private CollectionNameDAL CollectionNameDAL
        {
            get { return _collectionNameDAL ?? (_collectionNameDAL = new CollectionNameDAL()); }
        }

        // Creates or updates a collection(name).
        public void CreateCollectionName(CollectionName collectionName)
        {
            ICollection<ValidationResult> validationResults;
            if (!collectionName.Validate(out validationResults))
            {
                var ex = new ValidationException("The CollectionName object did not pass the data validation!");
                ex.Data.Add("ValidationResults", validationResults);
                throw ex;
            }

            if (collectionName.CollectionNameID == 0)
            {
                CollectionNameDAL.CreateCollectionName(collectionName);
            }
            else
            {
                //CollectionNameDAL.UpdateCollectionName(collectionName);
            }
        }

        // Gets specific collection(name)
        public CollectionName GetCollectionName(int CollectionNameID)
        {
            return CollectionNameDAL.GetCollectionNameByID(CollectionNameID);
        }

        // Gets all collectionnames.
        public IEnumerable<CollectionName> GetCollectionNames()
        {
            return CollectionNameDAL.GetCollectionNames();
        }

        // Deletes specific collection(name).
        public void DeleteCollectionName(int CollectionNameID)
        {
            CollectionNameDAL.DeleteCollectionName(CollectionNameID);
        }
        #endregion
    }
}