using Microsoft.AspNetCore.Mvc;

namespace TreatBox.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }

    }
}
