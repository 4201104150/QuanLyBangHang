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
            dsHangHoas = db.HangHoa.Where(p => p.MaLoai == id).ToList();
            ViewBag.loaidangchon = db.Loai.Where(p => p.MaLoai == id);
            Loai loai = db.Loai.FirstOrDefault(p => p.MaLoai == id);
            if (loai != null)
            {
                ViewBag.Loai = loai;
            }
            return View(dsHangHoas.Select(p => new Product
            {
                MaHH = p.MaHh,
                TenHH = p.TenHh,
                Hinh = p.Hinh,
                DonGia = p.DonGia.Value,
                GiamGia = p.GiamGia
            }));

        }

        public IActionResult ChiTiet(int? mahh)
        {
            HangHoa hh = db.HangHoa.SingleOrDefault(p => p.MaHh == mahh);
            if (hh != null)
            {
                //HangHoaViewModel hhvmd = new HangHoaViewModel();
                //hhvmd.MaHh = hh.MaHh;
                //return View(hhvmd);
                return View(hh);
            }
            return RedirectToAction(controllerName: "Home", actionName: "Error");

        }

        [HttpGet("{loai}/{url}", Name = "HangHoaSeoUrl")]
        public IActionResult HangHoaSeoUrl(string loai, string url)
        {
            var hh = db.HangHoa.SingleOrDefault(p => p.TenHh.SEOUrl() == url);


            if (hh != null)
            {
                var lo = db.Loai.SingleOrDefault(p => p.MaLoai == hh.MaLoai);
                if (lo != null)
                {
                    ViewBag.LoaiDangChon = lo.TenLoai;
                }
                //HangHoaViewModel hhvmd = mapper.Map<HangHoaViewModel>(hh);
                HangHoaChiTiet hhct = new HangHoaChiTiet();
                hhct.MaHh = hh.MaHh;
                hhct.MoTa = hh.MoTa;
                hhct.Hinh = hh.Hinh;
                hhct.TenHh = hh.TenHh;
                hhct.DonGia = hh.DonGia;
                return View("ChiTiet", hhct);
            }
            return RedirectToAction(controllerName: "Home", actionName: "Error");

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