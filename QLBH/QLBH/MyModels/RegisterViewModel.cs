using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace QLBH.MyModels
{
    public class RegisterViewModel
    {
        [Key]
        [MaxLength(10, ErrorMessage ="Tối đa 10 kí tự")]
        [Display(Name ="Mã khách hàng")]
        [Remote(action:"KiemTraMaKhachHang", controller:"KhachHang")]
        public string MaKH { get; set; }
        [Required]
        [MaxLength(250)]
        [Display(Name ="Họ tên Khách hàng")]
        public string HoTen { get; set; }
        [Required]
        [MaxLength(150)]
        [Display(Name ="Email")]
        public string Email { get; set; }
        [Required]
        [MaxLength(250)]
        [DataType(DataType.Password)]
        [Display(Name = "Mật khẩu")]
        public string Password { get; set; }
        [Required]
        [MaxLength(250)]
        [DataType(DataType.Password)]
        [Compare("Password", ErrorMessage ="Không khớp")]
        [Display(Name = "Nhập lại mật khẩu")]
        public string PasswordConfirm { get; set; }
        [Display(Name = "Đăng ký nhận quảng cáo")]
        public bool NhanQuangCao { get; set; }        
    }
}
