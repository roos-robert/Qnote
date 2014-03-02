using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Qnote
{
    public partial class Default1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userOnline"] != null)
            {
                LoginPanel.Visible = false;
            }

            if (Session["Success"] != null)
            {
                LoginConfirmation.Visible = true;
                SuccessLiteral.Text = Session["Success"].ToString();
                Session.Remove("Success");
            }    
        }

        protected void LoginButton_Click(object sender, EventArgs e)
        {
            // The dummy form sets the sessions for trying the demo, the demo person is Ellen Nu = userID 2.
            Session["userOnline"] = true;
            Session["userID"] = 2;
            Session["Success"] = "Du har nu loggat in!";

            Response.Redirect("Default.aspx");
        }
    }
}