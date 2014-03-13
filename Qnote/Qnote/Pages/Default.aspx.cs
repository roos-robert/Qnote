using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Qnote.Pages
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userOnline"] != null)
            {
                LoginPanel.Visible = false;
                LogoutPanel.Visible = true;
            }
        }

        protected void LoginButton_Click(object sender, EventArgs e)
        {
            // From the dummy-form i here set the session to one of the three test users.
            Session["userOnline"] = true;
            Session["userID"] = DDLUser.SelectedValue;
            Session["Success"] = "Du har nu loggat in!";

            Response.RedirectToRoute("AllNotes");
            Context.ApplicationInstance.CompleteRequest();
        }

        protected void LogoutButton_Click(object sender, EventArgs e)
        {
            // If the user logs out, the session is cleared.
            Session.Abandon();
            Response.RedirectToRoute("Default");
            Context.ApplicationInstance.CompleteRequest();
        }
    }
}