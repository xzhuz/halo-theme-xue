<div class="xue-mobile-menu"><i class="ion-ios-close-empty"></i>
    <nav>
        <ul id="menu-menu-1" class="sf-mobile-menu clearfix">
            <@menuTag method="tree">
                <#list menus?sort_by('priority') as menu>
                    <li class="menu-item <#if menu.children?? && menu.children?size gt 0>menu-item-has-children</#if>"
                    >
                        <#if menu.children?? && menu.children?size gt 0>
                            <a href="javascript:void(0)" target="${menu.target!}"
                               class="void-link md:text-base sm:text-sm">${menu.name}</a>
                        <#else >
                            <a class="link md:text-base sm:text-sm" href="${menu.url!}"
                               target="${menu.target!}">${menu.name}</a>
                        </#if>

                        <#if menu.children?? && menu.children?size gt 0>
                            <ul class="sub-menu">
                                <#list menu.children?sort_by('priority') as child>
                                    <li class="menu-item">
                                        <a href="${child.url!}"
                                           class="link md:text-base sm:text-sm"
                                           target="${child.target!}">${child.name}</a>
                                    </li>
                                </#list>
                            </ul>

                        </#if>
                    </li>
                </#list>
            </@menuTag>
        </ul>
    </nav>
</div>
<header class="header-area header-2">
    <div class="xue-menu-container" style="">
        <div class="container">
            <div class="xue-logo">
                <#if settings.open_night_mode!true>
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
                </#if>
            </div>
            <a href="#" class="mobile-menu-icon"><span></span></a>
            <nav class="xue-menu">
                <ul class="sf-menu sf-js-enabled">
                    <@menuTag method="tree">
                        <#list menus?sort_by('priority') as menu>
                            <li class="menu-item <#if menu.children?? && menu.children?size gt 0>menu-item-has-children</#if>"
                            >
                                <#if menu.children?? && menu.children?size gt 0>
                                    <a href="javascript:void(0)" target="${menu.target!}"
                                       class="void-link md:text-base sm:text-sm">${menu.name}</a>
                                <#else >
                                    <a class="link md:text-base sm:text-sm" href="${menu.url!}"
                                       target="${menu.target!}">${menu.name}</a>
                                </#if>

                                <#if menu.children?? && menu.children?size gt 0>
                                    <ul class="sub-menu" style="display: none; visibility: hidden;">
                                        <#list menu.children?sort_by('priority') as child>
                                            <li class="menu-item">
                                                <a href="${child.url!}"
                                                   class="link md:text-base sm:text-sm"
                                                   target="${child.target!}">${child.name}</a>
                                            </li>
                                        </#list>
                                    </ul>

                                </#if>
                            </li>
                        </#list>
                    </@menuTag>
                </ul>
            </nav>
        </div>
    </div>
    <div class="header-clone"></div>
</header>