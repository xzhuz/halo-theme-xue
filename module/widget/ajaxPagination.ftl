    <ul class="pagination-list flex flex-row " id="pagination">
        <li class="pagination-previous<#if pagination.hasPrev><#else > is-invisible </#if>">
        <span class="pagination-circle" path="${pagination.prevPageFullPath!}" onClick="getData(this)">
            <span class="iconfont icon-left"> </span>
        </span>
        </li>
        <#list pagination.rainbowPages as number>
            <#if number.isCurrent>
                <li>
                    <span class="pagination-circle is-current" path="${number.fullPath!}" onClick="getData(this)">${number.page!}</span>
                </li>
            <#else>
                <li>
                    <span class="pagination-circle" path="${number.fullPath!}" onClick="getData(this)">${number.page!}</span>
                </li>
            </#if>
        </#list>
        <#if pagination.hasNext>
            <li class="pagination-next">
            <span class="pagination-circle" path="${pagination.nextPageFullPath!}" onClick="getData(this)">
                <span class="iconfont icon-right"> </span>
            </span>
            </li>
        </#if>
    </ul>