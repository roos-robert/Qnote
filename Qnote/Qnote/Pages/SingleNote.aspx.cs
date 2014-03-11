using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Qnote.Models;

namespace Qnote.Pages
{
    public partial class SingleNote : System.Web.UI.Page
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

        public Models.Qnote QnoteListView_GetData()
        {
            return Service.GetNote(Int32.Parse(RouteData.Values["id"].ToString()));
        }

    }
}