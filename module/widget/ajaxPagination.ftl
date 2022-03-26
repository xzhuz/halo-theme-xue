    <ul class="pagination-list flex flex-row " id="pagination">
        <li class="pagination-previous<#if pagination.hasPrev><#else > is-invisible </#if>">
        <span class="pagination-circle" data-path="${pagination.prevPageFullPath!}" >
            <span class="iconfont icon-left dark:text-gray-300"> </span>
        </span>
        </li>
        <#list pagination.rainbowPages as number>
            <#if number.isCurrent>
                <li>
                    <span class="pagination-circle is-current" data-path="${number.fullPath!}" >${number.page!}</span>
                </li>
            <#else>
                <li>
                    <span class="pagination-circle dark:text-gray-300" data-path="${number.fullPath!}" >${number.page!}</span>
                </li>
            </#if>
        </#list>
        <#if pagination.hasNext>
            <li class="pagination-next">
            <span class="pagination-circle dark:text-gray-300" data-path="${pagination.nextPageFullPath!}" >
                <span class="iconfont icon-right dark:text-gray-300"> </span>
            </span>
            </li>
        </#if>
    </ul>