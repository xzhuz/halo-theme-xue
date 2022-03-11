<#if settings.QR_code_zfb?? || settings.QR_code_wx??>
    <section class="donate block text-center my-4 mx-auto">
        <div class="icon relative inline-block border-gray-100 dark:border-gray-700 border bg-white dark:bg-gray-800 rounded-full py-3 px-6 z-20">
            <#if settings.QR_code_zfb??>
                <a href="javascript:;" id="alipay" class="pr-3 border-gray-600 dark:border-gray-700 border-r text-xl" onClick="toggleAliPay()" style="text-decoration: none !important;">
                  <i class="iconfont icon-yooxi text-xl dark:text-gray-300"></i></a>
            </#if>
            <#if settings.QR_code_wx??>
                <a href="javascript:;" id="wechat" class="pl-3"  onClick="toggleWeChat()" style="text-decoration: none !important;">
                  <i class="iconfont icon-wechat text-xl dark:text-gray-300"></i></a>
            </#if>
        </div>
        <#if settings.QR_code_zfb??>
            <div class="qrcode qrcode-alipay hidden p-4 w-56 h-56 z-50 my-4 mx-auto">
                <img class="fade-down max-h-200 dark:filter-60" src="${settings.QR_code_zfb}">
            </div>
        </#if>
        <#if settings.QR_code_wx??>
            <div class="qrcode qrcode-wechat hidden p-4 w-56 h-56 z-50 my-4 mx-auto">
                <img class="fade-down max-h-200 dark:filter-60" src="${settings.QR_code_wx}">
            </div>
        </#if>
    </section>
</#if>