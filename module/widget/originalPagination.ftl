<ul class="pagination-list flex flex-row ">
        <li class="pagination-previous<#if pagination.hasPrev><#else > is-invisible </#if>">
            <a class="pagination-circle" href="${pagination.prevPageFullPath!}"><span class="iconfont icon-left"> </span>
            </a>
        </li>
        <#list pagination.rainbowPages as number>
            <#if number.isCurrent>
                <li>
                    <a class="pagination-circle is-current"  href="${number.fullPath!}">${number.page!}</a>
                </li>
            <#else>
                <li>
                    <a class="pagination-circle" href="${number.fullPath!}">${number.page!}</a>
                </li>
            </#if>
        </#list>
        <#if pagination.hasNext>
            <li class="pagination-next">
                <a class="pagination-circle" href="${pagination.nextPageFullPath!}">
                    <span class="iconfont icon-right"> </span>
                </a>
            </li>
        </#if>
</ul>