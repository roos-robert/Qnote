using Qnote.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Qnote.Pages
{
    public partial class DeleteNote : System.Web.UI.Page
    {
        // Lazy init.
        private Service _service;

        private Service Service
        {
            get { return _service ?? (_service = new Service()); }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            // Nicley presents the header of the note in the jumbotron.
            try
            {
                HeaderLitteral.Text = RouteData.Values["header"].ToString();
            }
            catch (Exception)
            {
                HeaderLitteral.Text = "Titel saknas";
            }
        }

        protected void DeleteButton_Click(object sender, EventArgs e)
        {
            try
            {
                // Deletes the note, also presents a message to the user that all went well.
                Service.DeleteNote(Int32.Parse(RouteData.Values["id"].ToString()));
                Session["Success"] = "Anteckningen har raderats!";
                Response.RedirectToRoute("AllNotes");
                Context.ApplicationInstance.CompleteRequest();
            }
            catch (Exception)
            {
                // Huh? My code won't work? This will never happen, but just in case, ModelState saves the day and presents a error message to the user.
                ModelState.AddModelError(String.Empty, "Ett fel inträffade då anteckningen skulle raderas.");
            }
        }

        protected void LinkButtonCancel_Click(object sender, EventArgs e)
        {
            // The user changes his or her mind, clicks cancel and is sent back to the list of all the notes.
            Response.RedirectToRoute("AllNotes");
            Context.ApplicationInstance.CompleteRequest();
        }
    }
}