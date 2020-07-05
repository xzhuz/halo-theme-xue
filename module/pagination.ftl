<ul class="pagination-list flex flex-row ">
    <li class="pagination-previous<#if pagination.hasPrev><#else > is-invisible </#if>">
<#--        <a class="pagination-circle" href="${blog_url!}">-->
<#--            <i class="fas fa-angle-double-left"></i>-->
<#--        </a>-->
        <a class="pagination-circle" href="${pagination.prevPageFullPath!}">
            <i class="fas fa-chevron-circle-left"></i>
        </a>
    </li>
    <#list pagination.rainbowPages as number>
        <#if number.isCurrent>
            <li>
                <a class="pagination-circle is-current" href="${number.fullPath!}">${number.page!}</a>
            </li>
        <#else>
            <li>
                <a class="pagination-circle" href="${number.fullPath!}">${number.page!}</a>
            </li>
        </#if>
    </#list>
    <li class="pagination-next<#if pagination.hasNext><#else > is-invisible </#if>">
        <a class="pagination-circle" href="${pagination.nextPageFullPath!}">
            <i class="fas fa-chevron-circle-right"></i>
        </a>
<#--        <a class="pagination-circle" href="${blog_url!}/page/${posts.totalPages}">-->
<#--            <i class="fas fa-angle-double-right"></i>-->
<#--        </a>-->
    </li>
</ul>