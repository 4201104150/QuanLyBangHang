#pragma checksum "D:\Program\ASP.NET\QLBHOL\QLBH\QLBH\Views\Shared\_Livechatsupport.cshtml" "{ff1816ec-aa5e-4d10-87f7-6f4963833460}" "ac2869522e4723e3c912c4ba6a6c3e0141dc6831"
// <auto-generated/>
#pragma warning disable 1591
[assembly: global::Microsoft.AspNetCore.Razor.Hosting.RazorCompiledItemAttribute(typeof(AspNetCore.Views_Shared__Livechatsupport), @"mvc.1.0.view", @"/Views/Shared/_Livechatsupport.cshtml")]
[assembly:global::Microsoft.AspNetCore.Mvc.Razor.Compilation.RazorViewAttribute(@"/Views/Shared/_Livechatsupport.cshtml", typeof(AspNetCore.Views_Shared__Livechatsupport))]
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
    [global::Microsoft.AspNetCore.Razor.Hosting.RazorSourceChecksumAttribute(@"SHA1", @"ac2869522e4723e3c912c4ba6a6c3e0141dc6831", @"/Views/Shared/_Livechatsupport.cshtml")]
    [global::Microsoft.AspNetCore.Razor.Hosting.RazorSourceChecksumAttribute(@"SHA1", @"bcc748d7051f071adde9f362a7c9debe12336743", @"/Views/_ViewImports.cshtml")]
    public class Views_Shared__Livechatsupport : global::Microsoft.AspNetCore.Mvc.Razor.RazorPage<dynamic>
    {
        private static readonly global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute __tagHelperAttribute_0 = new global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute("src", new global::Microsoft.AspNetCore.Html.HtmlString("~/LayoutMau/lib/jquery/dist/jquery.min.js"), global::Microsoft.AspNetCore.Razor.TagHelpers.HtmlAttributeValueStyle.DoubleQuotes);
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
        private global::Microsoft.AspNetCore.Mvc.Razor.TagHelpers.UrlResolutionTagHelper __Microsoft_AspNetCore_Mvc_Razor_TagHelpers_UrlResolutionTagHelper;
        #pragma warning disable 1998
        public async override global::System.Threading.Tasks.Task ExecuteAsync()
        {
            BeginContext(0, 2, true);
            WriteLiteral("\r\n");
            EndContext();
#line 2 "D:\Program\ASP.NET\QLBHOL\QLBH\QLBH\Views\Shared\_Livechatsupport.cshtml"
  
    ViewData["Title"] = "_Livechat";
    Layout = null;

#line default
#line hidden
            BeginContext(67, 65, false);
            __tagHelperExecutionContext = __tagHelperScopeManager.Begin("script", global::Microsoft.AspNetCore.Razor.TagHelpers.TagMode.StartTagAndEndTag, "ac2869522e4723e3c912c4ba6a6c3e0141dc68313772", async() => {
            }
            );
            __Microsoft_AspNetCore_Mvc_Razor_TagHelpers_UrlResolutionTagHelper = CreateTagHelper<global::Microsoft.AspNetCore.Mvc.Razor.TagHelpers.UrlResolutionTagHelper>();
            __tagHelperExecutionContext.Add(__Microsoft_AspNetCore_Mvc_Razor_TagHelpers_UrlResolutionTagHelper);
            __tagHelperExecutionContext.AddHtmlAttribute(__tagHelperAttribute_0);
            await __tagHelperRunner.RunAsync(__tagHelperExecutionContext);
            if (!__tagHelperExecutionContext.Output.IsContentModified)
            {
                await __tagHelperExecutionContext.SetOutputContentAsync();
            }
            Write(__tagHelperExecutionContext.Output);
            __tagHelperExecutionContext = __tagHelperScopeManager.End();
            EndContext();
            BeginContext(132, 2, true);
            WriteLiteral("\r\n");
            EndContext();
            BeginContext(534, 1128, true);
            WriteLiteral(@"<style type=""text/css"">
    .fb-livechat {
        width: 300px;
        height: 383px;
        position: fixed;
        bottom: 15px;
        right: 15px;
    }
</style>
<div id=""fb-livechat"" class=""fb-livechat animated bounceInUp hidden-xs"">
    <div class=""modal-content"">
        <div class=""modal-header"">
            <button type=""button"" class=""close"" aria-label=""Close"" title=""Đóng"" onclick=""removeFacebookLiveChat();""><span aria-hidden=""true"">×</span></button>
            <h5 class=""modal-title"">Gửi tin nhắn</h5>
        </div>
        <div class=""modal-body"">
            <div class=""fb-page"" data-href=""https://www.facebook.com/banlau987/"" data-tabs=""messages"" data-width=""300"" data-height=""300"" data-small-header=""true"" data-adapt-container-width=""true"" data-hide-cover=""false"" data-show-facepile=""true""><blockquote cite=""https://www.facebook.com/banlau987/"" class=""fb-xfbml-parse-ignore""><a href=""https://www.facebook.com/banlau987/"">Đang tải...</a></blockquote></div>
        </div>
    </d");
            WriteLiteral("iv>\r\n</div>\r\n<script src=\"https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js\"></script>\r\n");
            EndContext();
            BeginContext(1880, 779, true);
            WriteLiteral(@"<div id=""fb-root""></div>
<script>
        (function (d, s, id) {
            var js, fjs = d.getElementsByTagName(s)[0];
            if (d.getElementById(id)) return;
            js = d.createElement(s); js.id = id;
            js.src = ""//connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v2.9&appId=2481383151918535"";
            fjs.parentNode.insertBefore(js, fjs);
        }(document, 'script', 'facebook-jssdk'));
</script>
<script type=""text/javascript"">
        function removeFacebookLiveChat() {
            $('#fb-livechat').addClass('bounceOutDown');
            $('#fb-livechat').one('webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend', function () {
                $(this).remove();
            });
        }
</script>
");
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
