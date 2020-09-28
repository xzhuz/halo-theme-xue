<#if settings.QR_code_zfb?? || settings.QR_code_wx??>
<div class="container mx-auto px-4 mt-8 pb-4 max-w-6xl tracking-wider md:leading-relaxed sm:leading-normal cn-pd coffee-tags ct-container">
    <section class="donate">
        <div class="icon">
            <#if settings.QR_code_zfb??>
                <a href="javascript:;" id="alipay" onClick="toggleAliPay()"><i class="iconfont icon-alipay"></i></a>
            </#if>
            <#if settings.QR_code_wx??>
                <a href="javascript:;" id="wechat" onClick="toggleWeChat()"><i class="iconfont icon-wechatpay"></i></a>
            </#if>
        </div>
         <#if settings.QR_code_zfb??>
            <div class="qrcode qrcode-alipay hidden" >
                <img src="${settings.QR_code_zfb}">
            </div>
        </#if>
        <#if settings.QR_code_wx??>
            <div class="qrcode qrcode-wechat hidden">
                <img src="${settings.QR_code_wx}">
            </div>
        </#if>
    </section>
</div>
</#if>