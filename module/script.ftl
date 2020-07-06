<#-- 代码高亮-->
<script src="//cdn.jsdelivr.net/gh/highlightjs/cdn-release@10.0.0/build/highlight.min.js"></script>
<script charset="UTF-8" src="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/10.0.0/languages/go.min.js"></script>
<#--代码行数-->
<script src="//cdn.jsdelivr.net/npm/highlightjs-line-numbers.js@2.7.0/dist/highlightjs-line-numbers.min.js"></script>
<#-- 代码copy按钮-->
<#--<script src="https://cdn.jsdelivr.net/gh/hshanx/highlightjs-copy-button@master/dist/highlightjs-copy-button.min.js"></script>-->
<!--图片预览插件-->
<script data-pjax-viewer src="//cdn.jsdelivr.net/npm/viewerjs@1.5.0/dist/viewer.min.js"></script>
<#-- 模态框-->
<script src="https://cdn.jsdelivr.net/npm/micromodal/dist/micromodal.min.js"></script>
<#--相册插件-->
<script src="//cdn.jsdelivr.net/npm/justifiedGallery@3.7.0/dist/js/jquery.justifiedGallery.min.js"></script>
<#-- 相册相关的js -->
<script src="${theme_base!}/source/js/gallery.js?ver=${.now?long}"></script>

<#--  顶部菜单  -->
<script src="https://cdn.jsdelivr.net/gh/hshanx/static@master/simply-nav.js"></script>
<#--右下角按钮-->
<script src="https://cdn.jsdelivr.net/gh/hshanx/static@master/moon.js"></script>

<#--目录-->
<#if is_post?? && settings.post_toc!true>
    <script src="//cdn.jsdelivr.net/npm/tocbot@4.4.2/dist/tocbot.min.js"></script>
</#if>

<#if settings.enabled_mathjax!true>
    <script type="javascript">
        var katex_config = {
            delimiters:
                [
                    {left: "$$", right: "$$", display: true},
                    {left: "$", right: "$", display: false},
                    {left: "\\(", right: "\\)", display: false},
                    {left: "\\[", right: "\\]", display: true},
                ]
        }
    </script>
    <script defer src="//cdn.jsdelivr.net/npm/katex@0.11.1/dist/katex.min.js"></script>
    <script defer src="//cdn.jsdelivr.net/npm/katex@0.11.1/dist/contrib/auto-render.min.js"
            onload="if (document.getElementById('write') ) {renderMathInElement(document.getElementById('write'),katex_config)}"></script>
</#if>




<#-- 赞赏模态框 -->
<div class="modal micromodal-slide" id="coffeeModal" aria-hidden="true" role="dialog">
    <div class="modal__overlay" tabindex="-1" data-micromodal-close="">
        <div class="modal__container" role="dialog" aria-modal="true" aria-labelledby="modal-1-title">
            <header class="modal__header">
                <h2 class="modal__title" id="coffeeModalTitle"> </h2>
                <button class="modal__close" aria-label="Close modal" id="closeCoffeeModalBtn"></button>
            </header>
            <div class="modal__content flex flex-row justify-center" id="coffeeModalContent">
                <#if settings.QR_code_zfb??>
                    <div id='qrCodeZfb' class="pay-code-invisible" code-data="支付宝">
                        <img class="qr_code_zfb qr-code" src="${settings.QR_code_zfb!}" alt="AliPay"/>
                    </div>
                </#if>
                <#if settings.QR_code_wx??>
                    <div id="qrCodeWx" class="pay-code-invisible" code-data="微信支付">
                        <img class="qr_code_wx qr-code" src="${settings.QR_code_wx!}" alt="WeiXinPay"/>
                    </div>
                </#if>
            </div>
            <footer class="modal__footer flex flex-row justify-center">
                <#if settings.QR_code_zfb??>
                    <button class="modal__btn zfb-btn code-btn" id="zfbBtn">支付宝</button>
                </#if>
                <#if settings.QR_code_wx??>
                    <button class="modal__btn wx-btn code-btn" id="wxBtn">微信</button>
                </#if>
            </footer>
        </div>
    </div>
</div>

<script type="text/javascript">
    // console.clear();
    console.log("%c 有朋自远方来, 不亦说乎.", "background:#24272A; color:#ffffff", "");
    console.log("%c Github %c", "background:#24272A; color:#ffffff", "", "https://github.com/hshanx");
    // console.log("%c 版本号: %c", "background:#24272A; color:#ffffff", "", "1.4.2");

    var performance =window.performance ||window.msPerformance ||window.webkitPerformance;if(performance) {console.log(performance);    }

</script>

