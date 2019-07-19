using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
namespace QLBH.MyModels
{
    public static class MyMD5
    {
        public static string ToMD5(this string str)
        {
            MD5CryptoServiceProvider md5 = new MD5CryptoServiceProvider();
            byte[] bHash = md5.ComputeHash(Encoding.UTF8.GetBytes(str));
            StringBuilder sbHash = new StringBuilder();
            foreach (byte b in bHash)
                sbHash.Append(String.Format("{0:x2}", b));
            return sbHash.ToString();
        }

        //Tên hàng hóa: Samsung Galaxy Note 9 512Gb
        // ..../san-pham/samsung-galaxy-note-9-512gb
        public static string SEOUrl(this string tenHangHoa)
        {
            string kq = tenHangHoa.ToLower();
            //xử lý tiếng việt
            kq = Regex.Replace(kq, @"[áàạảãâấầậẩẫăắằặẳẵ]", "a");
            kq = Regex.Replace(kq, @"[éèẹẻẽêếềệểễ]", "e");
            kq = Regex.Replace(kq, @"[óòọỏõôốồộổỗơớờợởỡ]", "o");
            kq = Regex.Replace(kq, @"[úùụủũưứừựửữ]", "u");
            kq = Regex.Replace(kq, @"[íìịỉĩ]", "i");
            kq = Regex.Replace(kq, @"[đ]", "d");
            kq = Regex.Replace(kq, @"[ýỳỵỷỹ]", "y");

            kq = Regex.Replace(kq, @"[^a-z0-9\s-]", "");
            //xóa khoảng trắng thừa
            kq = Regex.Replace(kq, @"\s+", "-");
            kq = Regex.Replace(kq, @"\s", "-");
            return kq;

        }
    }
}
