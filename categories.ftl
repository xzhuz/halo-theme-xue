<#include "module/macro.ftl">
<@layout title="分类列表 | ${options.blog_title!}" keywords="${options.seo_keywords!}" description="${options.seo_description!}">
    <main class="mx-auto" id="container">
        <header class="bg-cover post-cover">
            <#if settings.categories_patternimg?? && settings.categories_patternimg!=''>
                <div class="cover-bg">
                    <img src="${settings.categories_patternimg!}" class="z-auto"
                         alt="${settings.categories_title! 'Categories'}">
                </div>
            <#else>
                <div class="placeholder-bg">
                </div>
            </#if>
            <div class="cover-content flex justify-center">
                <!-- 封面内容 -->
                <div class="inner flex flex-col justify-center">
                    <p class="cover-title text-base md:text-4xl lg:text-4xl xl:text-5xl">${settings.categories_title! 'Categories'}</p>
                </div>
            </div>
        </header>
        <div class="container mx-auto px-4 mt-16 max-w-6xl tracking-wider md:leading-relaxed sm:leading-normal ct-container cn-pd content-container">
            <@categoryTag method="list">
                <#if categories?? && categories?size gt 0>
                    <#list categories as category>
                        <a href="${category.fullPath}/" class="ah-hf ah-hv">
                            <span class="ah-dt ct-f-size op-10"><span class="cst-icon icon-toc"></span> ${category.name}</span>
                            <span class="ah-tt h-6 op-06">${category.description}</span>
                        </a>
                    </#list>
                </#if>
            </@categoryTag>
        </div>
    </main>
</@layout>
