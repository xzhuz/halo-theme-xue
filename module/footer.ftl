<footer class="footer mt-8">
    <div class="inner container mx-auto flex flex-row lg:justify-between  md:justify-center items-center grid lg:grid-cols-2 md:grid-cols-1">
        <#-- 社交信息 begin -->
        <div class="offsite-links flex flex-row justify-center flex-wrap">
            <#if settings.sina??>
                <a href="${settings.sina!}" class="circle pad-10" target="_blank" rel="noopener">
                    <span class="cst-icon icon-weibo"> </span>
                </a>
            </#if>
            <#if settings.qq??>
                <a href="//wpa.qq.com/msgrd?v=3&uin=${settings.qq!}&site=qq&menu=yes" class="circle pad-10" target="_blank" rel="noopener" title="QQ Chat">
                    <span class="cst-icon icon-qq"> </span>
                </a>
            </#if>
            <#if settings.telegram??>
                <a href="https://t.me/${settings.telegram!}" class="circle pad-10" target="_blank" rel="noopener" title="Telegram Chat">
                    <span class="cst-icon icon-telegram"> </span>
                </a>
            </#if>
            <#if settings.twitter??>
                <a href="${settings.twitter!}" class="circle pad-10" target="_blank" rel="noopener" title="Twitter">
                    <span class="cst-icon icon-twitter"> </span>
                </a>
            </#if>
            <#if settings.github??>
                <a href="${settings.github!}" class="circle pad-10" target="_blank" rel="noopener" title="Github">
                    <span class="cst-icon icon-github"> </span>
                </a>
            </#if>
            <#if settings.zhihu??>
                <a href="${settings.zhihu!}" class="circle pl-7"  target="_blank" rel="noopener" title="知乎">
                    <#include "icon/zhihu.ftl">
                </a>
            </#if>
            <#if settings.mail??>
                <a href="mailto:${settings.mail!}" class="circle pad-10" target="_blank" rel="noopener" title="邮箱">
                    <span class="cst-icon icon-email"> </span>
                </a>
            </#if>
            <#if settings.rss!true>
                <a href="${atom_url!}" class="circle pad-10" target="_blank" rel="noopener" title="RSS">
                    <span class="cst-icon icon-feed"> </span>
                </a>
            </#if>
        </div>
        <#-- 社交信息 end -->

        <div class="site-info flex flex-col justify-center">
            <@global.footer />
            <#if settings.Icp??>
                <p><a href="http://beian.miit.gov.cn" target="_blank" class="text-xs">${settings.Icp!}</a></p>
            </#if>
            <#if settings.PublicSecurityRecord??>
                <p style="display: inline-block;background-image: url(${theme_base!}/assets/images/beian.png);background-repeat: no-repeat;background-position: top left;background-size: contain;padding-left: 20px;">
                    <a href="http://www.beian.gov.cn" target="_blank" class="text-xs">${settings.PublicSecurityRecord!}</a>
                </p>
            </#if>
            <!-- 请尊重作者，请务必保留版权 -->
            <p>Powered by <a target="_blank" href="http://halo.run">Halo</a> •
                Theme by <a target="_blank" href="https://github.com/hshanx/halo-theme-hshan.git">Han Shan</a>
        </div>
    </div>
</footer>