using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Qnote.Pages
{
    public partial class NewNote : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // TODO - aktivera inloggning igen.
            //if (Session["userOnline"] == null)
            //{
            //    NewNoteArea.Visible = false;
            //    ErrorLiteral.Text = "Är du verkligen inloggad?"
            //    errorNotif.Visible = true;
            //}

            if (Session["Success"] != null)
            {
                LoginConfirmation.Visible = true;
                SuccessLiteral.Text = Session["Success"].ToString();
                Session.Remove("Success");
            } 
        }

        protected void SaveButton_Click(object sender, EventArgs e)
        {
            Session["Success"] = "Anteckningen har nu sparats!";

            Response.Redirect("NewNote.aspx");
            Context.ApplicationInstance.CompleteRequest();
        }
    }
}