<footer class="footer py-8 text-center shadow-md dark:bg-gray-800" style="flex: 0 0 auto;" id="footer">
  <div class="my-0 mx-auto px-10 mx-auto flex flex-row lg:justify-between  md:justify-center items-center grid lg:grid-cols-2 md:grid-cols-1">
    <#-- 社交信息 begin -->
    <div class="offsite-links flex flex-row justify-center flex-wrap">
      <#if settings.github??>
        <a href="${settings.github!}"
           class="circle p-2 m-2.5 text-gray-400 hover:text-red-600  bg-transparent border border-gray-100 rounded-full text-gray-500 inline-block relative cursor-pointer w-10 h-10"
           target="_blank" rel="noopener" title="Github">
          <span class="iconfont icon-github"> </span>
        </a>
      </#if>
      <#if settings.mail??>
        <a href="mailto:${settings.mail!}"
           class="circle p-2 m-2.5 text-gray-400 hover:text-red-600 bg-transparent border border-gray-100 rounded-full text-gray-500 inline-block relative cursor-pointer w-10 h-10"
           target="_blank" rel="noopener" title="邮箱">
          <span class="iconfont icon-youxiang"> </span>
        </a>
      </#if>
      <#if settings.rss!true>
        <a href="${atom_url!}"
           class="circle p-2 m-2.5 text-gray-400 hover:text-red-600 bg-transparent border border-gray-100 rounded-full text-gray-500 inline-block relative cursor-pointer w-10 h-10"
           target="_blank" rel="noopener" title="RSS">
          <span class="iconfont icon-rss"> </span>
        </a>
      </#if>
      <#if settings.zhihu??>
        <a href="${settings.zhihu!}"
           class="circle p-2 m-2.5 text-gray-400 hover:text-red-600 bg-transparent border border-gray-100 rounded-full text-gray-500 inline-block relative cursor-pointer w-10 h-10"
           target="_blank" rel="noopener" title="知乎">
          <span class="iconfont icon-zhihu-circle-fill"> </span>
        </a>
      </#if>
      <#if settings.weibo??>
        <a href="${settings.weibo!}"
           class="circle p-2 m-2.5 text-gray-400 hover:text-red-600 bg-transparent border border-gray-100 rounded-full text-gray-500 inline-block relative cursor-pointer w-10 h-10"
           target="_blank" rel="noopener" title="微博">
          <span class="iconfont icon-weibo"> </span>
        </a>
      </#if>
    </div>
    <#-- 社交信息 end -->

    <div class="site-info flex flex-col justify-center text-gray-800 dark:text-gray-500">
      <@global.footer />
      <#if settings.Icp??>
        <p class="leading-6"><a href="http://beian.miit.gov.cn" target="_blank" class="text-base text-gray-800 dark:text-gray-500">${settings.Icp!}</a></p>
      </#if>
      <#if settings.PublicSecurityRecord?? && settings.PoliceSecurityRecordCode??>
        <p style="display: inline-block;background-image: url(${theme_base!}/source/images/beian.png);background-repeat: no-repeat;background-position: top left;background-size: contain;padding-left: 20px;">
          <a href="http://www.beian.gov.cn/portal/registerSystemInfo?recordcode=${settings.PoliceSecurityRecordCode!}" target="_blank"
             class="text-base text-gray-800 dark:text-gray-500">${settings.PublicSecurityRecord!}</a>
        </p>
      </#if>
      <!-- 请尊重作者，请务必保留版权 -->
      <div class="badges">
        <div class="github-badge">
          <a style="color: #fff" rel="license" href="http://halo.run" target="_blank">
            <span class="badge-subject pr-8 mr-1">Powered</span>
            <span class="badge-value bg-blue">Halo</span>
          </a>
        </div>
        <div class="github-badge">
          <a style="color: #fff" rel="license" href="https://github.com/xzzai/halo-theme-xue.git"
             target="_blank">
            <span class="badge-subject pr-8 mr-1">Theme</span>
            <span class="badge-value bg-red">Xue</span>
          </a>
        </div>

        <#if settings.TimeStatistics??>
          <div class="github-badge">
            <a style="color: #fff" rel="license" href="javascript:void(0)">
              <span class="badge-subject pr-8 mr-1">运行</span>
              <span class="badge-value bg-orange" id="span_dt_dt"></span>
            </a>
          </div>
        </#if>
        <#if settings.visit_statistics!false>
          <div class="github-badge">
            <a style="color: #fff" rel="license" href="javascript:void(0)">
              <span class="badge-subject pr-8 mr-1">用户</span>
              <span id="busuanzi_container_site_uv"><span class="badge-value bg-brightgreen"
                                                          id="busuanzi_value_site_uv"></span></span>
            </a>
          </div>
          <div class="github-badge">
            <a style="color: #fff" rel="license" href="javascript:void(0)">
              <span class="badge-subject pr-8 mr-1">访问</span>
              <span id="busuanzi_container_site_pv"><span class="badge-value bg-blueviolet"
                                                          id="busuanzi_value_site_pv"></span></span>
            </a>
          </div>
        </#if>
      </div>
    </div>
  </div>
</footer>

<#include "back2Top.ftl"/>

<#-- 搜索 -->
<form method="get" action="/search">
  <div class="hidden fixed top-0 left-0 right-0 z-50 overflow-y-auto h-full bg-gray-200 bg-opacity-60" id="searchBox">
    <div class="mt-24 mt-8 mx-auto max-w-3xl animate-search border-gray-100 ">
      <div class="flex py-1 px-2 whitespace-nowrap rounded-md bg-white" id="searchInput">
        <label class="flex flex-row-reverse flex-grow">
          <input class="flex-grow p-0 text-xl border-none leading-snug" maxlength="30" name="keyword"
                 id="searchBoxInput" spellcheck="false" placeholder="Search" autofocus="autofocus" autocomplete="off">
          <span class="p-4 text-2xl opacity-50 transition-opacity iconfont icon-search"></span>
        </label>
        <a class="p-4 text-2xl opacity-50 transition-opacity iconfont icon-exit search-btn"></a>
      </div>
    </div>
  </div>
</form>
