using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using QLBH.Models;
using QLBH.MyModels;

namespace QLBH.Controllers
{
    public class HangHoaController : Controller
    {
        private readonly MyeStoreContext db;
        public HangHoaController(MyeStoreContext ct)
        {
            db = ct;
        }

        public IActionResult Index()
        {
            return View();
        }

        public IActionResult DanhSach(int? id)
        {
            List<HangHoa> dsHangHoas = new List<HangHoa>();
            dsHangHoas = db.HangHoa.Where(p=>p.MaLoai==id).ToList();
            ViewBag.loaidangchon = db.Loai.Where(p => p.MaLoai == id);
            return View(dsHangHoas.Select(p => new HangHoa
            {
                MaHh = p.MaHh,
                TenHh = p.TenHh,
                Hinh = p.Hinh,
                DonGia = p.DonGia.Value,
                GiamGia = p.GiamGia
            }));
        }

        public IActionResult ChiTiet(int? mahh)
        {
            HangHoa hh = db.HangHoa.SingleOrDefault(p => p.MaHh == mahh);
            if (mahh == null)
            {
                return RedirectToAction("Index", "HangHoa");
            }

            return View(hh);
        }
        [HttpGet("san-pham/{url}", Name = "HangHoaSeoUrl")]
        public IActionResult HangHoaSeoUrl(string url)
        {
            var hh = db.HangHoa.SingleOrDefault(p => p.TenHh.SEOUrl() == url);

            var lo = db.Loai.SingleOrDefault(p => p.MaLoai == hh.MaLoai);
            if (lo != null)
            {
                ViewBag.LoaiDangChon = lo.TenLoai;
            }
            return View("ChiTiet", hh);
        }
        [HttpPost]
        public IActionResult Search(string Search = "")
        {
            ViewBag.LoaiDangChon = "Kết quả tìm kiếm";
            var dsHangHoa = db.HangHoa.Where(p => p.TenHh.Contains(Search))
                .Include(p => p.MaNccNavigation)
                .Include(p => p.MaLoaiNavigation)
                .ToList();
            return View("Search", dsHangHoa);
        }

    }
}