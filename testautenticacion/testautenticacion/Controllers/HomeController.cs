using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;

namespace testautenticacion.Controllers
{
   // [Authorize]

    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            ViewBag.idrol = Session["IdRol"];
            return View();
        }
        
        public ActionResult About()
        {
            ViewBag.Message = "Bienvenido a la pagina about.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Bienvenido a la pagina contacto.";

            return View();
        }
        public ActionResult CerrarSesion()
        {
            FormsAuthentication.SignOut();
            Session["Usuario"] = null;
            return RedirectToAction("Index", "Acceso");
        }
    }
}