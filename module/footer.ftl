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
                <a href="//wpa.qq.com/msgrd?v=3&uin=${settings.qq!}&site=qq&menu=yes" class="circle pad-10"
                   target="_blank" rel="noopener" title="QQ Chat">
                    <span class="cst-icon icon-qq"> </span>
                </a>
            </#if>
            <#if settings.telegram??>
                <a href="https://t.me/${settings.telegram!}" class="circle pad-10" target="_blank" rel="noopener"
                   title="Telegram Chat">
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
                <a href="${settings.zhihu!}" class="circle pl-7" target="_blank" rel="noopener" title="知乎">
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
                    <a href="http://www.beian.gov.cn" target="_blank"
                       class="text-xs">${settings.PublicSecurityRecord!}</a>
                </p>
            </#if>
            <!-- 请尊重作者，请务必保留版权 -->
            <div class="badges">
                <div class="github-badge">
                    <a style="color: #fff" rel="license" href="http://halo.run" target="_blank">
                        <span class="badge-subject">Powered</span>
                        <span class="badge-value bg-blue">Halo</span>
                    </a>
                </div>
                <div class="github-badge">
                    <a style="color: #fff" rel="license" href="https://github.com/hshanx/halo-theme-xue.git"
                       target="_blank">
                        <span class="badge-subject">Theme</span>
                        <span class="badge-value bg-red">Xue</span>
                    </a>
                </div>

                <#if settings.TimeStatistics??>
                    <div class="github-badge">
                        <a style="color: #fff" rel="license" href="javascript:void(0)">
                            <span class="badge-subject">运行</span>
                            <span class="badge-value bg-orange" id="span_dt_dt"></span>
                        </a>
                    </div>
                </#if>
                <#if settings.visit_statistics!false>
                    <div class="github-badge">
                        <a style="color: #fff" rel="license" href="javascript:void(0)">
                            <span class="badge-subject">人数</span>
                            <span id="busuanzi_container_site_uv"><span class="badge-value bg-brightgreen" id="busuanzi_value_site_uv"></span></span>
                        </a>
                    </div>
                    <div class="github-badge">
                        <a style="color: #fff" rel="license" href="javascript:void(0)">
                            <span class="badge-subject">人数</span>
                            <span id="busuanzi_container_site_pv"><span class="badge-value bg-blueviolet" id="busuanzi_value_site_pv"></span></span>
                        </a>
                    </div>
                </#if>
            </div>
        </div>
    </div>
</footer>

<#if settings.Aplayer?? && settings.Aplayer != ''>
    <meting-js
            server="netease"
            type="playlist"
            fixed="true"
            id="${settings.Aplayer}">
    </meting-js>
</#if>