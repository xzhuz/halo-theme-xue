<#include "module/macro.ftl">
<@layout title="${options.blog_title!}" keywords="${options.seo_keywords!}" description="${options.seo_description!}">
    <main class="mx-auto home-page" id="container">
        <header class="bg-cover" id="homeHeader">
            <#if settings.home_cover?? && settings.home_cover!=''>
                <div class="cover-bg">
                    <img src="${settings.home_cover!}"
                         alt="${settings.home_title!options.blog_title!}">
                </div>
            <#else>
                <div class="default-cover-bg">
                </div>
            </#if>
            <div class="cover-content flex justify-center">
                <!-- 封面内容 -->
                <div class="inner flex flex-col justify-center">
                    <h2 class="cover-title text-left md:text-4xl lg:text-4xl xl:text-5xl">${settings.home_title!options.blog_title!}</h2>
                    <p class="slogan text-center">${settings.home_description!}</p>
                    <#if settings.enabled_index_cover_height!true>
                        <a class="arrow-down" data-scroll id="arch">
                            <span class="screen-reader-text">Scroll Down</span>
                        </a>
                    </#if>
                </div>
            </div>
        </header>
        <div class="container mx-auto px-4 content-container">
            <div class="posts grid lg:grid-cols-4 md:grid-cols-3 sm:grid-cols-2 xs:grid-cols-1 lg:gap-12 md:gap-12 sm:gap-3 mt-4">
                <#if posts?? && posts.getTotalElements() gt 0>
                    <#include "module/post-card.ftl">
                </#if>
            </div>
            <#-- 分页-->
            <nav class="pagination flex flex-row justify-center mt-8" role="navigation"
                 aria-label="pagination">
                <@paginationTag method="index" page="${posts.number}" total="${posts.totalPages}" display="3">
                    <#include "module/pagination.ftl">
                </@paginationTag>
            </nav>
        </div>
    </main>
</@layout>
