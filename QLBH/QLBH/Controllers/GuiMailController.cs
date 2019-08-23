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
            string NoiDungMail = "<img src=" + "https://gallery.mailchimp.com/4a23862e073675c50fad05c0e/images/171649f1-8312-4053-ac13-8b6951da63cd.jpg"+ "<table style="+"width: 100 % "+"><caption>Liên hệ với chúng tôi</caption><tr><th>Địa chỉ</th><th>Thêm</th></tr><tr><td>ĐHSP 280 ADV</td><td>Email:BanLau@gmail.com</td></tr><tr><td>Facebook</td><td>Youtube</td></tr></table>";
            GoogleMailer.Send("tuannv@hcmue.edu.vn", "Giảm giá mạnh nhân dịp tựu trường", NoiDungMail);
            return Content("Xong");
        }
    }
}