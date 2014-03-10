﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Routing;

namespace Qnote
{
    public static class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.MapPageRoute("Default", "", "~/Pages/Default.aspx");
            routes.MapPageRoute("NewNote", "notes/new", "~/Pages/NewNote.aspx");
            routes.MapPageRoute("AllNotes", "notes/all", "~/Pages/AllNotes.aspx");
        }
    }
}