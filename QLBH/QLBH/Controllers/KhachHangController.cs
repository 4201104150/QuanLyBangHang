using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;
using QLBH.Models;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using QLBH.Models;
using QLBH.MyModels;

namespace QLBH.Controllers
{
    public class KhachHangController : Controller
    {
        private readonly MyeStoreContext db;
        public KhachHangController(MyeStoreContext ctx)
        {
            db = ctx;
        }
        public IActionResult Index()
        {
            return View();
        }

        //public IActionResult Login(string returnUrl = null)
        //{
        //    ViewBag.ReturnUrl = returnUrl;
        //    return View();
        //}
        [HttpPost]
        public async Task<IActionResult> Login(string MaKH, string MatKhau, string returnUrl = null)
        {
            KhachHang kh = db.KhachHang.SingleOrDefault(p => p.MaKh == MaKH);
            if (kh == null)
            {
                ViewBag.Loi = "Không có khách hàng này";
                return View();
            }
            if (kh.MatKhau != (MatKhau))
            {
                ViewBag.Loi = "Sai thông tin đăng nhập";
                return RedirectToAction("Login","Login");
            }
            //if (!kh.HieuLuc)
            //{
            //    ViewBag.Loi = "Tài khoản chưa kích hoạt";
            //    return View();
            //}

            //Identity
            var claims = new List<Claim> {
                new Claim(ClaimTypes.Name, kh.HoTen)
            };
            ClaimsIdentity claimsIdentity = new ClaimsIdentity(claims, "login");
            ClaimsPrincipal claimsPrincipal = new ClaimsPrincipal(claimsIdentity);
            await HttpContext.SignInAsync(claimsPrincipal);

            //Lưu session MaKH
            HttpContext.Session.SetString("MaKh", kh.MaKh);
            if (Url.IsLocalUrl(returnUrl))
            {
                return Redirect(returnUrl);
            }
            return RedirectToAction("Profile", "KhachHang");
        }

        [Authorize]
        public IActionResult Logout()
        {
            HttpContext.SignOutAsync();
            HttpContext.Session.Remove("MaKh");
            return RedirectToAction("Index", "Home");
        }

        [Authorize]
        public IActionResult Profile()
        {
            var MaKH = HttpContext.Session.GetString("MaKh");
            KhachHang kh = db.KhachHang.SingleOrDefault(p => p.MaKh == MaKH);
            ViewBag.xxxyyy = MaKH;
            return View(kh);
        }
        public IActionResult Register()
        {
            return View();
        }
        [HttpPost]
        public IActionResult Register(RegisterViewModel model)
        {
            if (ModelState.IsValid)
            {
                string MaNgauNhien = MyTools.GenRandomKey();
                KhachHang kh = new KhachHang
                {
                    MaKh = model.MaKH,
                    MatKhau=model.Password,
                    HoTen=model.HoTen,
                    Email=model.Email
                };
                db.Add(kh);
                db.SaveChanges();
                //gửi mail kích hoạt tài khoản
                //string NoiDungMail = $"Chào mừng khách hàng <b>{kh.HoTen} đăng ký tài khoản. Vui lòng click vào <a href={Host()}/KhachHang/Active?MaKH={kh.MaKh}>đây</a> để kích hoạt.";
                //try
                //{
                //    GoogleMailer.Send(kh.Email, "Kich hoat tai khoan", NoiDungMail);
                //}
                //catch { }
                return RedirectToAction("Index", "Login");
            }
            return View();
        }
        public IActionResult Active(string MaKH)
        {
            KhachHang kh = db.KhachHang.SingleOrDefault(p => p.MaKh == MaKH);
            if (kh != null && !kh.HieuLuc)
            {
                kh.HieuLuc = true;
                db.SaveChanges();
                ViewBag.ThongBao = "Kích hoạt thành công";
            }
            else
            {
                ViewBag.ThongBao = "Sai thông tin";
            }
            return View();
        }
        public string Host()
        {
            return $"{(Request.IsHttps ? "https" : "http")}://{Request.Host.ToString()}";

        }
        public IActionResult KiemTraMaKhachHang(string MaKH)
        {
            KhachHang kh = db.KhachHang.SingleOrDefault(p => p.MaKh == MaKH);
            if (kh == null)
            {
                return Json(data: true);
            }
            else
            {
                return Json(data: "Mã này đã có");
            }
        }

        public IActionResult ForgotPassword()
        {
            return View();
        }
    }
}