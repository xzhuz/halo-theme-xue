<footer class="footer mt-8">
    <div class="inner px-10 mx-auto flex flex-row lg:justify-between  md:justify-center items-center grid lg:grid-cols-2 md:grid-cols-1">
        <#-- 社交信息 begin -->
        <div class="offsite-links flex flex-row justify-center flex-wrap">
            <#if settings.github??>
                <a href="${settings.github!}" class="circle p-4" target="_blank" rel="noopener" title="Github">
                    <span class="iconfont icon-github"> </span>
                </a>
            </#if>
            <#if settings.mail??>
                <a href="mailto:${settings.mail!}" class="circle p-4" target="_blank" rel="noopener" title="邮箱">
                    <span class="iconfont icon-youxiang"> </span>
                </a>
            </#if>
            <#if settings.rss!true>
                <a href="${atom_url!}" class="circle p-4" target="_blank" rel="noopener" title="RSS">
                    <span class="iconfont icon-rss"> </span>
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
                    <a style="color: #fff" rel="license" href="https://github.com/xzzai/halo-theme-xue.git"
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
                            <span class="badge-subject">用户</span>
                            <span id="busuanzi_container_site_uv"><span class="badge-value bg-brightgreen" id="busuanzi_value_site_uv"></span></span>
                        </a>
                    </div>
                    <div class="github-badge">
                        <a style="color: #fff" rel="license" href="javascript:void(0)">
                            <span class="badge-subject">访问</span>
                            <span id="busuanzi_container_site_pv"><span class="badge-value bg-blueviolet" id="busuanzi_value_site_pv"></span></span>
                        </a>
                    </div>
                </#if>
            </div>
        </div>
    </div>
</footer>

<#if settings.right_corner_circle!true>
    <#include "menu.ftl"/>
</#if>

<#-- 搜索 -->
<form method="get" action="/search">
    <div class="hidden search-box" id="searchBox">
        <div class="search-ipt ipt ipt-w">
            <div class="ipt-ct ct-bg search-container" id="searchInput">
                <label class="sh-lab">
                    <input class="sh-ipt" maxlength="30" name="keyword" id="searchBoxInput" spellcheck="false" placeholder="Search" autofocus="autofocus" autocomplete="off">
                    <span class="sh-icon iconfont icon-search"></span>
                </label>
                <a class="sh-exit iconfont icon-exit" onClick="toggleSearchBox()"></a>
            </div>
        </div>
    </div>
</form>
