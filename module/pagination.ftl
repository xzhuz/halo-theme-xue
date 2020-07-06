<ul class="pagination-list flex flex-row ">
    <li class="pagination-previous<#if pagination.hasPrev><#else > is-invisible </#if>">
        <a class="pagination-circle" href="${pagination.prevPageFullPath!}">
<#--            <#include "icon/arrow-left.ftl">-->
            <span class="cst-icon icon-previous"> </span>
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
<#--            <#include "icon/arrow-right.ftl">-->
            <span class="cst-icon icon-next"> </span>
        </a>
    </li>
</ul>