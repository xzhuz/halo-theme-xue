<header class="nav-wrapper top-0 left-0 right-0 p-0 z-50 w-full fixed bg-transparent transition-opacity duration-300 opacity-100"
        id="navHeader"
        style="flex: 0 0 auto;">
  <nav class="nav bg-white dark:bg-gray-900 md:bg-transparent" id="nav">
    <label class="inline-grid select-none place-content-center cursor-pointer h-full inline-block md:hidden ">
      <span class="iconfont icon-menu menu-btn text-gray-800 dark:text-gray-100 text-xl"></span>
    </label>
    <#if settings.show_logo!false>
      <a href="${blog_url!}" id="headerLogo" class="flex justify-center items-center p-2" onfocus="this.blur();">
        <img src="${blog_logo!}" alt="${blog_title!}" class="logo" id="logo" style="height: 3rem"/>
      </a>
    </#if>
    <span class="iconfont icon-search fill-current inline-block md:hidden link text-gray-800 dark:text-gray-100 search-btn ml-0 md:ml-4 cursor-pointer"
          style="padding-top: 1.4rem; font-size: 1.4rem; font-weight: 300">
          </span>
    <div class="nav-list list-none absolute top-16 bottom-0 hidden md:block">
      <div class="list">
        <@menuTag method="tree">
          <#list menus?sort_by('priority') as menu>
            <li class="item p-0 <#if menu.children?? && menu.children?size gt 0>has-sub relative cursor-pointer</#if>">
              <#if menu.children?? && menu.children?size gt 0>
                <span class="link text-gray-800 dark:text-gray-100 md:text-base sm:text-sm text-gray-100 block">${menu.name}</span>
                <ul class="sub-menu-item bg-white dark:bg-gray-800 block md:hidden md:absolute z-50 w-auto md:text-center rounded-md md:shadow-lx">
                  <#list menu.children?sort_by('priority') as child>
                    <li class="item pl-10 md:pl-0 h-8 w-full m-0 min-w-max">
                      <a class="menu-item text-gray-800 dark:text-gray-100 md:text-base sm:text-sm text-gray-100"
                         data-path="${child.url!}"
                         href="${child.url!}" target="${child.target!}">
                        ${child.name}
                      </a>
                    </li>
                  </#list>
                </ul>
              <#else>
                <a class="menu-item link block text-gray-800 dark:text-gray-100 md:text-base sm:text-sm text-gray-100"
                   data-path="${menu.url!}"
                   href="${menu.url!}" target="${menu.target!}">
                  ${menu.name}
                </a>
              </#if>
            </li>
          </#list>
        </@menuTag>

        <li class="item p-0 flex flex-col md:flex-row" style="margin-left: auto;">
           <span class="link text-gray-800 dark:text-gray-100 fill-current" style="padding-top: 0.8rem;">
            <#include "dark_mode.ftl"/>
          </span>
          <span class="iconfont icon-search fill-current link text-gray-800 dark:text-gray-100 search-btn ml-0 md:ml-4 cursor-pointer hidden md:inline-block"
                style="padding-top: 1rem; font-size: 1.4rem">
          </span>
        </li>
      </div>
    </div>

    <div class="mobile-sidebar bg-gray-100 dark:bg-gray-900 flex flex-col h-screen z-50 fixed top-0 left-0 w-3/5">
      <div class="mobile-sidebar-inner">
        <div class="flex text-right p-4 justify-end text-lg">
          <span class="text-gray-800 dark:text-gray-100 fill-current mx-2.5">
            <i class="iconfont cursor-pointer dark-btn"></i>
          </span>
          <span class="iconfont icon-close-circle-fill text-gray-800 dark:text-gray-300 menu-btn mx-2.5 text-xl cursor-pointer"></span>
        </div>
        <div class="relative py-0 px-4">
          <ul class="overflow-x-hidden overflow-y-auto pl-0 z-50" style="flex: 1 1 auto;">
            <@menuTag method="tree">
              <#list menus?sort_by('priority') as menu>
                <li class="relative mb-3 py-3.5 px-4 block bg-white dark:bg-gray-800 rounded-md <#if menu.children?? && menu.children?size gt 0>has-sub-item cursor-pointer</#if>">
                  <#if menu.children?? && menu.children?size gt 0>
                    <span class="relative text-base p-0 flex justify-between text-gray-800 dark:text-gray-100 z-0">
                      ${menu.name}
                      <i class="iconfont icon-right drop-down-menu"></i>
                    </span>
                    <ul class="sub-menu relative pl-0" style="display: none">
                      <#list menu.children?sort_by('priority') as child>
                        <li class="list-none mt-4">
                          <a class="relative block text-sm p-0 text-gray-800 dark:text-gray-100" href="${child.url!}">${child.name!}</a>
                        </li>
                      </#list>
                    </ul>
                    <#else>
                      <a class="relative block text-base p-0 text-gray-800 dark:text-gray-100" href="${menu.url!}">${menu.name}</a>
                  </#if>
                </li>
              </#list>
            </@menuTag>
          </ul>
        </div>
      </div>
    </div>
    <div class="non-click-bg z-40 overflow-hidden w-full h-full fixed bg-gray-200 opacity-60 hidden menu-btn"></div>
  </nav>
</header>
