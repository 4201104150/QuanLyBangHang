using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using BraintreeHttp;
using Microsoft.AspNetCore.Mvc;
using PayPal.Core;
using PayPal.v1.Payments;
using QLBH.Models;
using QLBH.MyModels;

namespace QLBH.Controllers
{
    public class PaypalController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
        public List<CartItem> Cart
        {
            get
            {
                var data = HttpContext.Session.Get<List<CartItem>>("GioHang");
                if (data == null)
                {
                    data = new List<CartItem>();
                }

                return data;
            }
        }
        public async Task<IActionResult> Checkout()
        {
            //SandboxEnvironment(clientId, clientSerect)
            var environment = new PayPal.Core.SandboxEnvironment("AVfkleP2c7e0uq3ejIEtvchq0ecX8DN31BymS6MmD1vFnTpg9g1QD3-77jwZ4eAZ38jZFgDNd8NxC0ta", "EIm8Kah8ii49Dj-ckEeQT4XnOn5tFjZkJdNw_pCyV0vFqj50E0ZraaszgEfmBWXqqGGz8a-dTm97HAiu");
            var client = new PayPalHttpClient(environment);

            //Đọc thông tin đơn hàng từ Session
            var itemList = new ItemList()
            {
                Items = new List<Item>()
            };

            var tongTien = Cart.Sum(p => p.donGia);
            foreach (var item in Cart)
            {
                itemList.Items.Add(new Item()
                {
                    Name = item.hangHoa.TenHh,
                    Currency = "USD",
                    Price = item.hangHoa.DonGia.ToString(),
                    Quantity = item.soLuong.ToString(),
                    Sku = "sku",
                    Tax = "0"
                });
            }
            var payment = new Payment()
            {
                Intent = "sale",
                Transactions = new List<Transaction>()
                {
                    new Transaction()
                    {
                        Amount = new Amount()
                        {
                            Total = tongTien.ToString(),
                            Currency = "USD",
                            Details = new AmountDetails
                            {
                                Tax = "0",
                                Shipping = "0",
                                Subtotal = tongTien.ToString()
                            }
                        },
                        ItemList = itemList,
                        Description = "Don hang 001",
                        InvoiceNumber = DateTime.Now.Ticks.ToString()
                    }
                },
                RedirectUrls = new RedirectUrls()
                {
                    CancelUrl = "http://localhost:5001/Paypal/Fail",
                    ReturnUrl = "/Paypal/Success"
                },
                Payer = new Payer()
                {
                    PaymentMethod = "paypal"
                }
            };

            PaymentCreateRequest request = new PaymentCreateRequest();
            request.RequestBody(payment);

            try
            {
                HttpResponse response = await client.Execute(request);
                var statusCode = response.StatusCode;
                Payment result = response.Result<Payment>();

                var links = result.Links.GetEnumerator();
                string paypalRedirectUrl = null;
                while (links.MoveNext())
                {
                    LinkDescriptionObject lnk = links.Current;
                    if (lnk.Rel.ToLower().Trim().Equals("approval_url"))
                    {
                        //saving the payapalredirect URL to which user will be redirected for payment  
                        paypalRedirectUrl = lnk.Href;
                    }
                }

                return Redirect(paypalRedirectUrl);

            }
            catch (HttpException httpException)
            {
                var statusCode = httpException.StatusCode;
                var debugId = httpException.Headers.GetValues("PayPal-Debug-Id").FirstOrDefault();

                return RedirectToAction("Fail");
            }

            return View();
        }

        public IActionResult Success()
        {
            return View();
        }
        public IActionResult Fail()
        {
            return Content("Thanh toán thất bại");
        }
    }
}