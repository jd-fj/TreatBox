using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.AspNetCore.Mvc.Rendering;
using System.Linq;
using System.Collections.Generic;
using TreatBox.Models;

namespace TreatBox.Controllers
{
    public class HomeController : Controller
    {
      private readonly TreatBoxContext _db;

      public HomeController(TreatBoxContext db)
      {
        _db = db;
      }

      public ActionResult Index()
      {
        var viewModel = new MyViewModel();
        viewModel.AllTreats = _db.Treats.ToList();
        viewModel.AllFlavors = _db.Flavors.ToList();
        return View(viewModel);
      }

    }
}
