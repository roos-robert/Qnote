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

        protected void DeleteButton_Click(object sender, EventArgs e)
        {
            try
            {
                // Raderar kontakten samt presenterar ett meddelande om att allt lyckats.
                Service.DeleteNote(Int32.Parse(RouteData.Values["id"].ToString()));
                Session["Success"] = "Anteckningen har raderats!";
                Response.RedirectToRoute("AllNotes");
                Context.ApplicationInstance.CompleteRequest();
            }
            catch (Exception)
            {
                ModelState.AddModelError(String.Empty, "Ett fel inträffade då anteckningen skulle raderas.");
            }
        }
    }
}