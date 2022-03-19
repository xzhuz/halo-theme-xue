<header class="nav-wrapper -sticky bg-transparent transition-opacity duration-300" id="navHeader"
        style="flex: 0 0 auto;">
  <nav class="nav bg-white md:bg-transparent" id="nav">
    <label class="inline-grid select-none place-content-center cursor-pointer h-full swap swap-rotate nav-lines ">
      <input type="checkbox" class="toggle-nav" id="navCheckbox"/>
      <svg class="swap-off fill-current nav-line" xmlns="http://www.w3.org/2000/svg" width="32" height="32" viewBox="0 0 512 512"><path d="M64,384H448V341.33H64Zm0-106.67H448V234.67H64ZM64,128v42.67H448V128Z"/></svg>
      <svg class="swap-on fill-current nav-line" xmlns="http://www.w3.org/2000/svg" width="32" height="32" viewBox="0 0 512 512"><polygon points="400 145.49 366.51 112 256 222.51 145.49 112 112 145.49 222.51 256 112 366.51 145.49 400 256 289.49 366.51 400 400 366.51 289.49 256 400 145.49"/></svg>
    </label>
    <#if settings.header_logoimg?? && settings.header_logoimg!=''>
      <a href="${blog_url!}" id="headerLogo" class="logo-link"
         onfocus="this.blur();">
        <img src="${settings.header_logoimg}" alt="${blog_title!}" class="logo" id="logo"
             style="height: 3rem"/>
      </a>
    </#if>
    <div class="nav-list " role="navigation">
      <div class="list -left " id="menuLinks">
        <@menuTag method="tree">
          <#list menus?sort_by('priority') as menu>
            <li class="item flex flex-wrap p-0">
              <a class="menu-item link md:text-base sm:text-sm text-gray-100" data-path="${menu.url!}"
                 href="${menu.url!}" target="${menu.target!}">
                ${menu.name}
              </a>
            </li>
          </#list>
        </@menuTag>
      </div>
      <div class="list -right">
        <div class="overlay"></div>
      </div>
    </div>
    <div class="day-switch" style="position: relative; right: 40px">
      <#include "dark_mode.ftl"/>
    </div>
  </nav>
</header>
