<header class="slide header">
    <!--	Add "slideRight" class to items that move right when viewing Nav Drawer  -->
    <ul id="navToggle" class="burger slide">
        <!--	Add "slideRight" class to items that move right when viewing Nav Drawer  -->
        <li></li>
        <li></li>
        <li></li>
    </ul>

</header>

<nav class="slide header-nav">
    <ul>
        <@menuTag method="tree">
            <#list menus?sort_by('priority') as menu>
                <li>
                    <a class="link md:text-base sm:text-sm" href="${menu.url!}"
                       target="${menu.target!}">${menu.name}</a>
                </li>
            </#list>
            <#if settings.open_night_mode!true>
                <li class="day-switch">
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
                </li>
            </#if>
        </@menuTag>

    </ul>
</nav>