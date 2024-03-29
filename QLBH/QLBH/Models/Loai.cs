﻿using QLBH.MyModels;
using System;
using System.Collections.Generic;

namespace QLBH.Models
{
    public partial class Loai
    {
        public Loai()
        {
            HangHoa = new HashSet<HangHoa>();
        }

        public int MaLoai { get; set; }
        public string TenLoai { get; set; }
        public string TenLoaiAlias { get; set; }
        public string MoTa { get; set; }
        public string Hinh { get; set; }

        public virtual ICollection<HangHoa> HangHoa { get; set; }
        public string TenLoaiSeoUrl => TenLoai.SEOUrl();
    }
}
