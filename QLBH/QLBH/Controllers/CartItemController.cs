using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using QLBH.Models;
using System.Web;
using QLBH.MyModels;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Authorization;
using System.Diagnostics;

namespace QLBH.Controllers
{
    public class CartItemController : Controller
    {
        private readonly MyeStoreContext db;
        private IHttpContextAccessor httpContextAccessor;
        public CartItemController(MyeStoreContext ctx)
        {
            db = ctx;
        }

        public List<CartItem> Carts
        {
            get
            {
                List<CartItem> myCart = HttpContext.Session.Get<List<CartItem>>("GioHang");
                if (myCart == default(List<CartItem>))
                {
                    myCart = new List<CartItem>();
                }
                return myCart;
            }
        }
        public IActionResult Index()
        {
            CartItem a=new CartItem();
            //test luôn đúng
            List<HangHoaViewModel> s = new List<HangHoaViewModel>() { new HangHoaViewModel { Id = 1, Name = "Gi do", Price = 10000, Quantity = 3 }, new HangHoaViewModel { Id = 2, Name = "Gi do 2", Price = 6000, Quantity = 3 } };
            ViewBag.products = s;
            PayPalConfig payPalConfig = PayPalService.getPayPalConfig();
            ViewBag.payPalConfig = payPalConfig;
            return View(Carts);
        }

        [Route("Success")]
        public IActionResult Success()
        {
            //PDTHolder pdtHolder = new PDTHolder();
            var result = PDTHolder.Success(Request.Query["tx"].ToString());
            Debug.WriteLine("First Name: " + result.PayerFirstName);
            Debug.WriteLine("Last Name: " + result.PayerLastName);
            Debug.WriteLine("Email: " + result.PayerEmail);
            Debug.WriteLine("InvoiceNumber: " + result.InvoiceNumber);
            Debug.WriteLine("GrossTotal: " + result.GrossTotal);
            return View("Success");
        }
        public IActionResult AddToCart(int mahh, int qty)
        {
            List<CartItem> gioHang = Carts;
            //tìm xem có chưa
            CartItem item = gioHang.SingleOrDefault(p => p.hangHoa.MaHh == mahh);
            if (item != null) //có rồi
            {
                item.soLuong+=qty;
            }
            else
            {
                HangHoa hh = db.HangHoa.SingleOrDefault(p => p.MaHh == mahh);
                item = new CartItem
                {
                    hangHoa=hh,
                    soLuong=qty,
                    donGia=hh.DonGia.Value*(1-hh.GiamGia)
                };
                gioHang.Add(item);
            }
            //lưu session
            HttpContext.Session.Set("GioHang", gioHang);
            return RedirectToAction("Index");
        }
        public IActionResult Clear()
        {
            ShoppingCart myCart = new ShoppingCart(db, httpContextAccessor);
            myCart.Clear();
            return RedirectToAction("Index");
        }
        public string ThongTinDonHangHtml(int MaDonHang)
        {
            HoaDon dh = db.HoaDon.SingleOrDefault(p => p.MaHd == MaDonHang);
            var chitiet = db.ChiTietHd.Where(p => p.MaHd == dh.MaHd).ToList();
            string html = $"<h2>THÔNG TIN ĐƠN HÀNG</h2>";
            html += $"Mã đơn hàng: {dh.MaHd} - Ngày đặt: {dh.NgayDat}<br>";
            html += $"Tổng tiền: {chitiet.Select(p=>p.DonGia).ToString()} đ<br>";
            html += "<table border=1>";
            html += "<tr>";
            html += "<th>Hàng hóa</th>";
            html += "<th>Đơn giá</th>";
            html += "<th>Số lượng</th>";
            html += "<th>Thành tiền</th>";
            html += "</tr>";
            foreach (var cthd in chitiet)
            {
                html += "<tr>";
                html += $"<td>{cthd.MaHh}</td>";
                html += $"<td>{cthd.DonGia}</td>";
                html += $"<td>{cthd.SoLuong}</td>";
                html += $"<td>{cthd.DonGia * cthd.SoLuong}</td>";
                html += "</tr>";
            }
            html += "</table>";
            return html;
        }
        [HttpPost]
        public JsonResult UpdateCart(int[] productList, int[] amountList)
        {
            ShoppingCart myCart = new ShoppingCart(db, httpContextAccessor);
            myCart.UpdateCart(productList, amountList);
            return Json(new { TongTien = myCart.Total });
        }
        public IActionResult UpdateCart()
        {
            return View("Index");
        }
    }
}