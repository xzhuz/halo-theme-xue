<header class="nav-wrapper -sticky  <#if settings.default_hide_menu!true> <#else>nav-bg-fff</#if>" id="navHeader">
    <button class="collapse-nav" onClick="collapseNav()" id="collapseNav" style="<#if settings.default_hide_menu!true> <#else>display:none</#if>">
        <div class="collapse-burger -squeeze">
            <span class="burger-lines"></span>
        </div>
    </button>
    <nav class="nav <#if settings.default_hide_menu!true>opacity-0<#else> opacity-100  </#if> "  id="nav">    
        <button class="toggle-nav">
            <div class="burger -squeeze">
                <span class="burger-lines"></span>
            </div>
        </button>
        <#if settings.header_logoimg?? && settings.header_logoimg!=''>
            <a href="${blog_url!}" id="headerLogo" class="logo-link"
               onfocus="this.blur();">
                <img src="${settings.header_logoimg}" alt="${blog_title!}" class="logo" id="logo"
                     style="height: 3rem"/>
            </a>
        </#if>
        <ul class="nav-list " role="navigation">
            <div class="list -left " id="menuLinks">
                <@menuTag method="tree">
                    <#list menus?sort_by('priority') as menu>
                        <li class="item ">
                            <a class="link md:text-base sm:text-sm" href="${menu.url!}"
                               target="${menu.target!}">${menu.name}</a>
                        </li>
                    </#list>
                </@menuTag>
            </div>
            <div class="list -right">
                <div class="overlay"></div>
            </div>
        </ul>
        <#if !(settings.right_corner_circle!true)>
            <div class="search">
                <span class="iconfont icon-search " onclick="toggleSearchBox()"></span>
            </div>
        </#if>
        <#if settings.open_night_mode!true>
            <div class="day-switch" style="position: relative; right: 40px">
                <div class="day-night-switch" role="button" onClick="dayNightSwitch()">
                    <div class="onOff daySwitch" id="daySwitch">
                        <div class="star star1"></div>
                        <div class="star star2"></div>
                        <div class="star star3"></div>
                        <div class="star star4"></div>
                        <div class="star star5"></div>
                        <div class="star sky"></div>
                        <div class="sunMoon">
                            <div class="crater crater1"></div>
                            <div class="crater crater2"></div>
                            <div class="crater crater3"></div>
                            <div class="cloud part1"></div>
                            <div class="cloud part2"></div>
                        </div>
                    </div>
                </div>
            </div>
        </#if>
    </nav>
</header>
