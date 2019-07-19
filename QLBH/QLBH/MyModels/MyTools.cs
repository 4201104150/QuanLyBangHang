using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace QLBH.Models
{
    public class MyTools
    {
        public static int PAGE_NUMBER_GRID = 50;
        public static int PAGE_NUMBER = 15;
        public static string GenRandomKey(int length = 5)
        {
            Random rd = new Random();
            string pattern = "0123456789zxcvbnmasdfghjklqwertyuiop[]?!@#$%^&*()<>:";
            string kq = string.Empty;
            for(int i = 0; i < length; i++)
            {
                kq += pattern[rd.Next(0, pattern.Length)];
            }
            return kq;
        }
    }
}
