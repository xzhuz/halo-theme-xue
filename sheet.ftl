<#include "module/macro.ftl">
<@layout title="${sheet.title!} | ${options.blog_title!}" keywords="${options.seo_keywords!}" description="${options.seo_description!}">
    <main class="mx-auto">
        <div class="container mx-auto md-content px-4 mt-16 max-w-6xl tracking-wider md:leading-relaxed sm:leading-normal ct-container cn-pd">
            ${sheet.formatContent!}
        </div>
    </main>
    <div class="container mx-auto px-4 mt-16 max-w-6xl tracking-wider md:leading-relaxed sm:leading-normal ct-container cn-pd">
        <#include "module/comment.ftl">
        <@comment post=sheet type="sheet" />
    </div>
</@layout>
