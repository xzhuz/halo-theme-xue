<div class="menu-wrap">
    <nav class="menu">
        <div class="icon-list">
            <@menuTag method="tree">
                <#list menus?sort_by('priority') as menu>
                        <a href="${menu.url!}">
                            <span >${menu.name}</span>
                        </a>
                </#list>
            </@menuTag>
            <#if settings.open_night_mode!true>
                <a class="day-night-switch" role="button" onClick="dayNightSwitch()">
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
                </a>
            </#if>
        </div>
    </nav>
    <button class="close-button" id="close-button">Close Menu</button>
</div>
<button class="menu-button" id="open-button">Open Menu</button>
