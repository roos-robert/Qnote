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
            
        }

        protected void SaveButton_Click(object sender, EventArgs e)
        {
            Session["Success"] = "Anteckningen har nu sparats!";

            Response.RedirectToRoute("NewNote");
            Context.ApplicationInstance.CompleteRequest();
        }
    }
}