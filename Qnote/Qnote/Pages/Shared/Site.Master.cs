using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Qnote.Pages.Shared
{
    public partial class Site : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // TODO - aktivera inloggning igen.
            //if (Session["userOnline"] == null)
            //{
            //    RestrictPanel.Visible = false;
            //    ErrorLiteral.Text = "Är du verkligen inloggad?";
            //    errorNotif.Visible = true;
            //}

            if (Session["Success"] != null)
            {
                LoginConfirmation.Visible = true;
                SuccessLiteral.Text = Session["Success"].ToString();
                Session.Remove("Success");
            }    
        }
    }
}