<#include "module/macro.ftl">
<@layout title="${tag.name} | ${options.blog_title!}" keywords="${options.seo_keywords!}" description="${options.seo_description!}">
    <main class="mx-auto" id="container">
        <header class="bg-cover post-cover">
            <#if settings.tag_patternimg?? && settings.tag_patternimg!=''>
                <div class="cover-bg">
                    <img src="${settings.tag_patternimg!}" class="z-auto"
                         alt="${tag.name}">
                </div>
            <#else>
                <div class="placeholder-bg">
                </div>
            </#if>
            <div class="cover-content flex justify-center">
                <!-- 封面内容 -->
                <div class="inner flex flex-col justify-center">
                    <p class="cover-title text-base md:text-4xl lg:text-4xl xl:text-5xl">${tag.name}</p>
                </div>
            </div>
        </header>
         <div class="container mx-auto px-4 content-container <#if !(settings.posts_style!true)>mx-850</#if>">
            <#if settings.posts_style!true>
                <#include "module/widget/post_cards.ftl">
            <#else>
                <#include "module/widget/post_list.ftl">
            </#if>
        </div>
    </main>
</@layout>
