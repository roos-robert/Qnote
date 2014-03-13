using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Qnote.Pages.Shared
{
    public partial class SiteOpen : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Success"] != null)
            {
                LoginConfirmation.Visible = true;
                SuccessLiteral.Text = Session["Success"].ToString();
                Session.Remove("Success");
            }    
        }
    }
}