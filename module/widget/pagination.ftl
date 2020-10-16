<#if settings.posts_style!true>
    <#include "originalPagination.ftl"/>
<#else>
    <#include "ajaxPagination.ftl"/>
</#if>