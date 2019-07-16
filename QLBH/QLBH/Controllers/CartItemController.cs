using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using QLBH.Models;
using System.Web;
using QLBH.MyModels;
using K42Store106402.Models;

namespace QLBH.Controllers
{
    public class CartItemController : Controller
    {
        private readonly MyeStoreContext db;
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
            HangHoa hh = db.HangHoa.SingleOrDefault(p => p.MaHh == 1001);
            CartItem x = new CartItem
            {
                hangHoa = hh,
                soLuong = 1,
                donGia = hh.DonGia.Value * (1 - hh.GiamGia)
            };
            Carts.Add(x);
            Carts.Add(x);
            return View(Carts);
        }

        public IActionResult AddToCart(int mahh)
        {
            List<CartItem> gioHang = Carts;
            //tìm xem có chưa
            CartItem item = gioHang.SingleOrDefault(p => p.hangHoa.MaHh == mahh);
            if (item != null) //có rồi
            {
                item.soLuong++;
            }
            else
            {
                HangHoa hh = db.HangHoa.SingleOrDefault(p => p.MaHh == mahh);
                item = new CartItem
                {
                    hangHoa=hh,
                    soLuong=1,
                    donGia=hh.DonGia.Value*(1-hh.GiamGia)
                };
                gioHang.Add(item);
            }
            //lưu session
            HttpContext.Session.Set("GioHang", gioHang);
            return RedirectToAction("Index");
        }
    }
}