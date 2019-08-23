using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using QLBH.Models;
using QLBH.MyModels;

namespace QLBH.Controllers
{
    public class GuiMailController : Controller
    {
        MyeStoreContext db=new MyeStoreContext();
        public IActionResult Index()
        {
            return View();
        }
        public IActionResult GuiMailQC()
        {
            List<string> lm = new List<string>();
            string NoiDungMail = "<img src=\"https://panew.hcmue.edu.vn/images/_KHO_ANH_CHUNG_/hinhcuthe/mail.jpg\" <table style=" + "width: 100 % " + "><br><a href=" + "https://Localhost:5001" + ">Vào dây để biết thêm thông tin chi tiết</a><caption>Liên hệ với chúng tôi</caption><tr><th>Địa chỉ</th><th>Thêm</th></tr><tr><td>ĐHSP 280 ADV</td><td>Email:BanLau@gmail.com</td></tr><tr><td>Facebook</td><td>Youtube</td></tr></table>";
            lm = db.KhachHang.Select(p => p.Email).ToList();
            foreach(string a in lm)
            {
                GoogleMailer.Send(a, "Giảm giá cực mạnh nhân dịp tựu trường 2019-2020", NoiDungMail);
            }            
            return View("Index");
        }
    }
}