#pragma checksum "D:\Program\ASP.NET\QLBHOL\QLBH\QLBH\Views\Paypal\Index.cshtml" "{ff1816ec-aa5e-4d10-87f7-6f4963833460}" "a2936947ed175732d6c99e9a9fb9d4870b24bc71"
// <auto-generated/>
#pragma warning disable 1591
[assembly: global::Microsoft.AspNetCore.Razor.Hosting.RazorCompiledItemAttribute(typeof(AspNetCore.Views_Paypal_Index), @"mvc.1.0.view", @"/Views/Paypal/Index.cshtml")]
[assembly:global::Microsoft.AspNetCore.Mvc.Razor.Compilation.RazorViewAttribute(@"/Views/Paypal/Index.cshtml", typeof(AspNetCore.Views_Paypal_Index))]
namespace AspNetCore
{
    #line hidden
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Threading.Tasks;
    using Microsoft.AspNetCore.Mvc;
    using Microsoft.AspNetCore.Mvc.Rendering;
    using Microsoft.AspNetCore.Mvc.ViewFeatures;
#line 1 "D:\Program\ASP.NET\QLBHOL\QLBH\QLBH\Views\_ViewImports.cshtml"
using QLBH;

#line default
#line hidden
#line 2 "D:\Program\ASP.NET\QLBHOL\QLBH\QLBH\Views\_ViewImports.cshtml"
using QLBH.Models;

#line default
#line hidden
    [global::Microsoft.AspNetCore.Razor.Hosting.RazorSourceChecksumAttribute(@"SHA1", @"a2936947ed175732d6c99e9a9fb9d4870b24bc71", @"/Views/Paypal/Index.cshtml")]
    [global::Microsoft.AspNetCore.Razor.Hosting.RazorSourceChecksumAttribute(@"SHA1", @"bcc748d7051f071adde9f362a7c9debe12336743", @"/Views/_ViewImports.cshtml")]
    public class Views_Paypal_Index : global::Microsoft.AspNetCore.Mvc.Razor.RazorPage<dynamic>
    {
        #pragma warning disable 1998
        public async override global::System.Threading.Tasks.Task ExecuteAsync()
        {
#line 1 "D:\Program\ASP.NET\QLBHOL\QLBH\QLBH\Views\Paypal\Index.cshtml"
  
    this.ViewBag.Title = "Index";
    Layout = "../Shared/_Layout.cshtml";

#line default
#line hidden
            BeginContext(84, 6, true);
            WriteLiteral("\r\n<h2>");
            EndContext();
            BeginContext(91, 13, false);
#line 6 "D:\Program\ASP.NET\QLBHOL\QLBH\QLBH\Views\Paypal\Index.cshtml"
Write(ViewBag.Title);

#line default
#line hidden
            EndContext();
            BeginContext(104, 11, true);
            WriteLiteral("</h2>\r\n\r\n<a");
            EndContext();
            BeginWriteAttribute("href", " href=\"", 115, "\"", 150, 1);
#line 8 "D:\Program\ASP.NET\QLBHOL\QLBH\QLBH\Views\Paypal\Index.cshtml"
WriteAttributeValue("", 122, this.Url.Action("Checkout"), 122, 28, false);

#line default
#line hidden
            EndWriteAttribute();
            BeginContext(151, 19, true);
            WriteLiteral(">PayPalCheckout</a>");
            EndContext();
        }
        #pragma warning restore 1998
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.ViewFeatures.IModelExpressionProvider ModelExpressionProvider { get; private set; }
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.IUrlHelper Url { get; private set; }
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.IViewComponentHelper Component { get; private set; }
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.Rendering.IJsonHelper Json { get; private set; }
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.Rendering.IHtmlHelper<dynamic> Html { get; private set; }
    }
}
#pragma warning restore 1591
