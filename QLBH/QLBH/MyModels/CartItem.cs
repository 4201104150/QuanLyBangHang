using K42Store106402.Models;
using Microsoft.AspNetCore.Http;
using QLBH.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace QLBH.MyModels
{
    public class CartItem
    {
        public HangHoa hangHoa { get; set; }
        public int soLuong { get; set; }
        public double donGia { get; set; }
    }
    public class ShoppingCart
    {
        private List<CartItem> cartItem;
        public List<CartItem> CartItems
        {
            get
            {
                var items = httpContextAccessor.HttpContext.Session.Get<List<CartItem>>("GioHang");
                return (items != default(List<CartItem>)) ? items : new List<CartItem>();
            }                   
            set
            {
                httpContextAccessor.HttpContext.Session.Set<List<CartItem>>("GioHang", value);
            }
        }
        public double Total
        {
            get => CartItems.Sum(p => p.soLuong * (double)p.hangHoa.DonGia * (1 - p.hangHoa.GiamGia));
        }

        public void AddToCart(int MaHH, int soLuong = 1)
        {
            List<CartItem> giohang = CartItems;
            //Kiếm hàng hóa (dựa MaHH) có trong giỏ hàng chưa
            CartItem item = giohang.SingleOrDefault(p => p.hangHoa.MaHh == MaHH);
            if (item != null)
            {
                item.soLuong += soLuong;
            }
            else
            {
                HangHoa hh = db.HangHoa.SingleOrDefault(p => p.MaHh == MaHH);
                item = new CartItem
                {
                    hangHoa = hh,
                    soLuong = soLuong
                };
                giohang.Add(item);
            }
            //cập nhật Session
            httpContextAccessor.HttpContext.Session.Set("GioHang", giohang);
        }

        public void UpdateCart(int[] productList, int[] amountList)
        {
            List<CartItem> giohang = CartItems;
            for (int i = 0; i < productList.Length; i++)
            {
                CartItem item = giohang.SingleOrDefault(p => p.hangHoa.MaHh == productList[i]);
                if (item != null)
                {
                    item.soLuong = amountList[i];
                }
            }
            httpContextAccessor.HttpContext.Session.Set("GioHang", giohang);
        }

        /// <summary>
        /// đang thực hiện
        /// </summary>
        /// <param name="ht"></param>
        /// <param name="dc"></param>
        /// <param name="cachtt"></param>
        /// <param name="cachvc"></param>
        /// <returns></returns>
        public int SaveCartToDatabase(string ht,string dc,string cachtt,string cachvc)
        {
            double PhiVC = 0;//chỉnh sửa theo yêu cầu
            //Tạo đơn hàng
            HoaDon hd = new HoaDon
            {
                MaKh = httpContextAccessor.HttpContext.Session.GetString("MaKh"),
                NgayDat = DateTime.Now,
                NgayGiao = new DateTime(DateTime.Now.Year, DateTime.Now.Month, DateTime.Now.Day + 3),
                HoTen = ht,//họ tên
                DiaChi=dc,//địa chỉ
                CachThanhToan=cachtt,
                CachVanChuyen=cachvc,
                PhiVanChuyen = PhiVC,                
                MaTrangThai = 1,
                MaNv=null,
                GhiChu="Chưa thanh toán"
            };
            db.Add(hd);
            db.SaveChanges();
           
            //duyệt qua giỏ hàng lưu cho tiết đơn hàng
            ChiTietHd cthd = null;
            foreach (CartItem item in this.CartItems)
            {
                cthd = new ChiTietHd
                {
                    MaHd = hd.MaHd,
                    MaHh = item.hangHoa.MaHh,
                    SoLuong = item.soLuong,
                    DonGia = (double)item.hangHoa.DonGia * (1 - item.hangHoa.GiamGia)
                };
                db.Add(cthd);
            }
            db.SaveChanges();
            //xóa giỏ hàng
            this.Clear();

            return hd.MaHd; //trả về mã đơn hàng
        }

        public void Clear()
        {
            httpContextAccessor.HttpContext.Session.Set("GioHang", new List<CartItem>());
        }

        private readonly MyeStoreContext db;
        private readonly IHttpContextAccessor httpContextAccessor;
        public ShoppingCart(MyeStoreContext ctx, IHttpContextAccessor context)
        {
            db = ctx;
            httpContextAccessor = context;
        }
    }
}