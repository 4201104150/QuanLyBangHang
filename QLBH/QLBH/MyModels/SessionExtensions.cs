using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Newtonsoft.Json;

namespace QLBH.Models
{
    public static class SessionExtensions
    {
        public static void Set<T>(this ISession session, string key, T value)
        {
            session.SetString(key, JsonConvert.SerializeObject(value));
        }

        public static T Get<T>(this ISession session, string key)
        {
            var value = session.GetString(key);

            return value == null ? default(T) :
                JsonConvert.DeserializeObject<T>(value);
        }
        public static T GetObject<T>(this ISession session, string key)
        {
            string sessionValue = session.GetString(key);

            T obj = string.IsNullOrEmpty(sessionValue) ? default(T) : JsonConvert.DeserializeObject<T>(sessionValue);

            return obj;
        }
    }
}
