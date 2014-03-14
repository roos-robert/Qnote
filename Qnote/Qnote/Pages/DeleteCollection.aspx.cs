using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Qnote.Models;

namespace Qnote.Pages
{
    public partial class DeleteCollection : System.Web.UI.Page
    {
        // Lazy init.
        private Service _service;

        private Service Service
        {
            get { return _service ?? (_service = new Service()); }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            // Nicley presents the header of the collection in the jumbotron.
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
                // Deletes the collection, also presents a message to the user that all went well.
                // TODO Activate delete functionality for collections again.
                //Service.DeleteCollectionName(Int32.Parse(RouteData.Values["id"].ToString()));
                Session["Success"] = "Samlingen var tom och kunde raderas utan problem!";
                Response.RedirectToRoute("Collections");
                Context.ApplicationInstance.CompleteRequest();
            }
            catch (Exception)
            {
                // Huh? My code won't work? This will never happen, but just in case, ModelState saves the day and presents a error message to the user.
                ModelState.AddModelError(String.Empty, "Ett fel inträffade då samlingen skulle raderas, förmodligen finns det anteckningar kvar i samlingen!");
            }
        }

        protected void LinkButtonCancel_Click(object sender, EventArgs e)
        {
            // The user changes his or her mind, clicks cancel and is sent back to the list of all the notes.
            Response.RedirectToRoute("Collections");
            Context.ApplicationInstance.CompleteRequest();
        }
    }
}