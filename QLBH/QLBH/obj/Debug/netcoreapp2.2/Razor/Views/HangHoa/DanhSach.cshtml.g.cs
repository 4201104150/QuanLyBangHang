#pragma checksum "D:\Program\ASP.NET\QLBHOL\QLBH\QLBH\Views\HangHoa\DanhSach.cshtml" "{ff1816ec-aa5e-4d10-87f7-6f4963833460}" "98a3c256465076935e3c8246504f43bd31ac71b8"
// <auto-generated/>
#pragma warning disable 1591
[assembly: global::Microsoft.AspNetCore.Razor.Hosting.RazorCompiledItemAttribute(typeof(AspNetCore.Views_HangHoa_DanhSach), @"mvc.1.0.view", @"/Views/HangHoa/DanhSach.cshtml")]
[assembly:global::Microsoft.AspNetCore.Mvc.Razor.Compilation.RazorViewAttribute(@"/Views/HangHoa/DanhSach.cshtml", typeof(AspNetCore.Views_HangHoa_DanhSach))]
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
    [global::Microsoft.AspNetCore.Razor.Hosting.RazorSourceChecksumAttribute(@"SHA1", @"98a3c256465076935e3c8246504f43bd31ac71b8", @"/Views/HangHoa/DanhSach.cshtml")]
    [global::Microsoft.AspNetCore.Razor.Hosting.RazorSourceChecksumAttribute(@"SHA1", @"bcc748d7051f071adde9f362a7c9debe12336743", @"/Views/_ViewImports.cshtml")]
    public class Views_HangHoa_DanhSach : global::Microsoft.AspNetCore.Mvc.Razor.RazorPage<IEnumerable<QLBH.Models.HangHoa>>
    {
        private static readonly global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute __tagHelperAttribute_0 = new global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute("asp-action", "ChiTiet", global::Microsoft.AspNetCore.Razor.TagHelpers.HtmlAttributeValueStyle.DoubleQuotes);
        private static readonly global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute __tagHelperAttribute_1 = new global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute("asp-controller", "HangHoa", global::Microsoft.AspNetCore.Razor.TagHelpers.HtmlAttributeValueStyle.DoubleQuotes);
        #line hidden
        #pragma warning disable 0169
        private string __tagHelperStringValueBuffer;
        #pragma warning restore 0169
        private global::Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperExecutionContext __tagHelperExecutionContext;
        private global::Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperRunner __tagHelperRunner = new global::Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperRunner();
        private global::Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperScopeManager __backed__tagHelperScopeManager = null;
        private global::Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperScopeManager __tagHelperScopeManager
        {
            get
            {
                if (__backed__tagHelperScopeManager == null)
                {
                    __backed__tagHelperScopeManager = new global::Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperScopeManager(StartTagHelperWritingScope, EndTagHelperWritingScope);
                }
                return __backed__tagHelperScopeManager;
            }
        }
        private global::Microsoft.AspNetCore.Mvc.TagHelpers.AnchorTagHelper __Microsoft_AspNetCore_Mvc_TagHelpers_AnchorTagHelper;
        private global::Microsoft.AspNetCore.Mvc.Razor.TagHelpers.UrlResolutionTagHelper __Microsoft_AspNetCore_Mvc_Razor_TagHelpers_UrlResolutionTagHelper;
        #pragma warning disable 1998
        public async override global::System.Threading.Tasks.Task ExecuteAsync()
        {
            BeginContext(41, 2, true);
            WriteLiteral("\r\n");
            EndContext();
#line 3 "D:\Program\ASP.NET\QLBHOL\QLBH\QLBH\Views\HangHoa\DanhSach.cshtml"
  
    ViewData["Title"] = "Danh sách";
    Layout = "~/Views/Shared/_LayoutTongQuat.cshtml";

#line default
#line hidden
            BeginContext(143, 458, true);
            WriteLiteral(@"<style>
    .hanghoa {
        height: 250px;
        border-radius: 5px;
        text-align: center;
        position: relative;
    }

        .hanghoa:hover {
            border: 1px solid blue;
        }

        .hanghoa img {
            height: 150px;
        }

    .giaban {
        position: absolute;
        bottom: 5px;
        right: 5px;
        font-size: large;
        color: blue;
    }
</style>
<div class=""row"">
");
            EndContext();
#line 32 "D:\Program\ASP.NET\QLBHOL\QLBH\QLBH\Views\HangHoa\DanhSach.cshtml"
     foreach (var hh in Model)
    {

#line default
#line hidden
            BeginContext(640, 52, true);
            WriteLiteral("        <div class=\"col-md-3 hanghoa\">\r\n            ");
            EndContext();
            BeginContext(692, 164, false);
            __tagHelperExecutionContext = __tagHelperScopeManager.Begin("a", global::Microsoft.AspNetCore.Razor.TagHelpers.TagMode.StartTagAndEndTag, "98a3c256465076935e3c8246504f43bd31ac71b85006", async() => {
                BeginContext(783, 18, true);
                WriteLiteral("\r\n                ");
                EndContext();
                BeginContext(801, 37, false);
                __tagHelperExecutionContext = __tagHelperScopeManager.Begin("img", global::Microsoft.AspNetCore.Razor.TagHelpers.TagMode.SelfClosing, "98a3c256465076935e3c8246504f43bd31ac71b85401", async() => {
                }
                );
                __Microsoft_AspNetCore_Mvc_Razor_TagHelpers_UrlResolutionTagHelper = CreateTagHelper<global::Microsoft.AspNetCore.Mvc.Razor.TagHelpers.UrlResolutionTagHelper>();
                __tagHelperExecutionContext.Add(__Microsoft_AspNetCore_Mvc_Razor_TagHelpers_UrlResolutionTagHelper);
                BeginAddHtmlAttributeValues(__tagHelperExecutionContext, "src", 2, global::Microsoft.AspNetCore.Razor.TagHelpers.HtmlAttributeValueStyle.DoubleQuotes);
                AddHtmlAttributeValue("", 811, "~/Hinh/HangHoa/", 811, 15, true);
#line 37 "D:\Program\ASP.NET\QLBHOL\QLBH\QLBH\Views\HangHoa\DanhSach.cshtml"
AddHtmlAttributeValue("", 826, hh.Hinh, 826, 8, false);

#line default
#line hidden
                EndAddHtmlAttributeValues(__tagHelperExecutionContext);
                await __tagHelperRunner.RunAsync(__tagHelperExecutionContext);
                if (!__tagHelperExecutionContext.Output.IsContentModified)
                {
                    await __tagHelperExecutionContext.SetOutputContentAsync();
                }
                Write(__tagHelperExecutionContext.Output);
                __tagHelperExecutionContext = __tagHelperScopeManager.End();
                EndContext();
                BeginContext(838, 14, true);
                WriteLiteral("\r\n            ");
                EndContext();
            }
            );
            __Microsoft_AspNetCore_Mvc_TagHelpers_AnchorTagHelper = CreateTagHelper<global::Microsoft.AspNetCore.Mvc.TagHelpers.AnchorTagHelper>();
            __tagHelperExecutionContext.Add(__Microsoft_AspNetCore_Mvc_TagHelpers_AnchorTagHelper);
            __Microsoft_AspNetCore_Mvc_TagHelpers_AnchorTagHelper.Action = (string)__tagHelperAttribute_0.Value;
            __tagHelperExecutionContext.AddTagHelperAttribute(__tagHelperAttribute_0);
            __Microsoft_AspNetCore_Mvc_TagHelpers_AnchorTagHelper.Controller = (string)__tagHelperAttribute_1.Value;
            __tagHelperExecutionContext.AddTagHelperAttribute(__tagHelperAttribute_1);
            if (__Microsoft_AspNetCore_Mvc_TagHelpers_AnchorTagHelper.RouteValues == null)
            {
                throw new InvalidOperationException(InvalidTagHelperIndexerAssignment("asp-route-mahh", "Microsoft.AspNetCore.Mvc.TagHelpers.AnchorTagHelper", "RouteValues"));
            }
            BeginWriteTagHelperAttribute();
#line 36 "D:\Program\ASP.NET\QLBHOL\QLBH\QLBH\Views\HangHoa\DanhSach.cshtml"
                   WriteLiteral(hh.MaHh);

#line default
#line hidden
            __tagHelperStringValueBuffer = EndWriteTagHelperAttribute();
            __Microsoft_AspNetCore_Mvc_TagHelpers_AnchorTagHelper.RouteValues["mahh"] = __tagHelperStringValueBuffer;
            __tagHelperExecutionContext.AddTagHelperAttribute("asp-route-mahh", __Microsoft_AspNetCore_Mvc_TagHelpers_AnchorTagHelper.RouteValues["mahh"], global::Microsoft.AspNetCore.Razor.TagHelpers.HtmlAttributeValueStyle.DoubleQuotes);
            await __tagHelperRunner.RunAsync(__tagHelperExecutionContext);
            if (!__tagHelperExecutionContext.Output.IsContentModified)
            {
                await __tagHelperExecutionContext.SetOutputContentAsync();
            }
            Write(__tagHelperExecutionContext.Output);
            __tagHelperExecutionContext = __tagHelperScopeManager.End();
            EndContext();
            BeginContext(856, 18, true);
            WriteLiteral("\r\n            <h3>");
            EndContext();
            BeginContext(875, 8, false);
#line 39 "D:\Program\ASP.NET\QLBHOL\QLBH\QLBH\Views\HangHoa\DanhSach.cshtml"
           Write(hh.TenHh);

#line default
#line hidden
            EndContext();
            BeginContext(883, 48, true);
            WriteLiteral("</h3>\r\n            <div class=\"giaban\">Giá bán: ");
            EndContext();
            BeginContext(932, 9, false);
#line 40 "D:\Program\ASP.NET\QLBHOL\QLBH\QLBH\Views\HangHoa\DanhSach.cshtml"
                                    Write(hh.DonGia);

#line default
#line hidden
            EndContext();
            BeginContext(941, 26, true);
            WriteLiteral(" đ</div>\r\n        </div>\r\n");
            EndContext();
#line 42 "D:\Program\ASP.NET\QLBHOL\QLBH\QLBH\Views\HangHoa\DanhSach.cshtml"
    }

#line default
#line hidden
            BeginContext(974, 6, true);
            WriteLiteral("</div>");
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
        public global::Microsoft.AspNetCore.Mvc.Rendering.IHtmlHelper<IEnumerable<QLBH.Models.HangHoa>> Html { get; private set; }
    }
}
#pragma warning restore 1591
