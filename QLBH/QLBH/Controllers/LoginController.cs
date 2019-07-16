using Microsoft.AspNetCore.Mvc;
using QLBH.MyModels;

namespace QLBH.Controllers
{
    public class LoginController : Controller
    {
        public IActionResult Index()
        {
            return View("Login");
        }
        public IActionResult Test()
        {
            return View();
        }
    }
}