<#if settings.QR_code_zfb?? || settings.QR_code_wx??>
<div class="container mx-auto px-4 mt-8 pb-4 max-w-6xl tracking-wider md:leading-relaxed sm:leading-normal cn-pd coffee-tags">
    <section class="donate">
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
        <div class="icon">
            <#if settings.QR_code_zfb??>
                <a href="javascript:;" id="alipay" onHov><i class="iconfont icon-alipay"></i></a>
            </#if>
            <#if settings.QR_code_wx??>
                <a href="javascript:;" id="wechat"><i class="iconfont icon-wechatpay"></i></a>
            </#if>
        </div>
    </section>
</div>
</#if>