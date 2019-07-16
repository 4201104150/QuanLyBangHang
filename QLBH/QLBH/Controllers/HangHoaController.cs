using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
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
            List<HangHoa> dsHangHoas = new List<HangHoa>();
            dsHangHoas = db.HangHoa.ToList();
            return View(dsHangHoas.Select(p => new HangHoaViewModel
            {
                MaHH = p.MaHh,
                TenHH = p.TenHh,
                Hinh = p.Hinh,
                DonGia = p.DonGia.Value,
                GiamGia = p.GiamGia
            }));
        }

        public IActionResult List(int? loai)
        {
            var dshanghoa = db.HangHoa.ToList();
            string loaidangchon = "";
            if(loai.HasValue)
            {
                var lo = db.Loai.SingleOrDefault(p => p.MaLoai == loai);
                if(lo!=null)
                {
                    loaidangchon = lo.TenLoai;
                }
                dshanghoa=db.HangHoa.Where(p=>p.MaLoai==loai).ToList();
            }
            ViewBag.loaidangchon = loaidangchon;
            return View(dshanghoa);
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
    }
}