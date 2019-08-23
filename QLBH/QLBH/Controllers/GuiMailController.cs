using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using QLBH.MyModels;

namespace QLBH.Controllers
{
    public class GuiMailController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
        public IActionResult GuiMailQC()
        {
            string NoiDungMail = "";
            GoogleMailer.Send("tuannv@hcmue.edu.vn", "Quảng cáo", "Test quản cáo");
            return Content("Xong");
        }
    }
}