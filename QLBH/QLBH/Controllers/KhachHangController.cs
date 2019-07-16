using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using QLBH.Models;

namespace QLBH.Controllers
{
    public class KhachHangController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
        
        public IActionResult DangKyKhachHang()
        {
            KhachHang kh = new KhachHang();
            
            return RedirectToAction("","");
        }
    }
}