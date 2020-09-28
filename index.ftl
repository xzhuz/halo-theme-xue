<#include "module/macro.ftl">
<@layout title="${options.blog_title!}" keywords="${options.seo_keywords!}" description="${options.seo_description!}">
    <main class="mx-auto home-page" id="container">
        <header class="bg-cover home-cover <#if !(settings.home_cover?? && settings.home_cover!='') && (settings.enabled_index_cover_height!true) >no-cover-bg </#if>" id="homeHeader">
            <#if settings.home_cover?? && settings.home_cover!=''>
                <div class="cover-bg">
                    <img src="${settings.home_cover!}"
                         alt="${settings.home_title!options.blog_title!}">
                </div>
            <#elseif !(settings.enabled_index_cover_height!true)>
                <div class="cover-bg">
                    <img src="https://cdn.jsdelivr.net/gh/xzzai/static@master/uPic/default-bg.jpg"
                         alt="${settings.home_title!options.blog_title!}">
                </div>
            <#else>
                <div class="default-cover-bg"></div> 
            </#if>
            <div class="cover-content index flex justify-center">
                <!-- 封面内容 -->
                <div class="inner flex flex-col justify-center">
                    <h2 class="cover-title text-left md:text-4xl lg:text-4xl xl:text-5xl">${settings.home_title!options.blog_title!}</h2>
                    <p class="slogan text-center" id="slogan">${settings.home_description!}</p>
                    <#if settings.enabled_index_cover_height!true>
                        <a class="arrow-down" data-scroll id="arch">
                            <span class="screen-reader-text">Scroll Down</span>
                        </a>
                    </#if>
                </div>
            </div>
        </header>
        <div class="container mx-auto px-4 content-container">
            <div class="popular-posts">
                <h3><i class="iconfont icon-hot list-brands"></i>热门文章</h3>
                <div class="posts grid grid-cols-2 lg:grid-cols-4 md:grid-cols-4  lg:gap-4 md:gap-2 sm:gap-1">
                    <#include "module/widget/popular_cards.ftl">
                </div>
            </div>
            <h3><i class="iconfont icon-new list-brands"></i>最新文章</h3>
            <div class="posts mt-4 pagination-container">
                <#if posts?? && posts.getTotalElements() gt 0>
                    <#include "module/widget/post_items.ftl">
                </#if>
            </div>
            <#-- 分页-->
            <nav class="pagination flex flex-row justify-center mt-8" role="navigation"
                 aria-label="pagination">
                <@paginationTag method="index" page="${posts.number}" total="${posts.totalPages}" display="3">
                    <#include "module/widget/more.ftl">
                </@paginationTag>
            </nav>
        </div>
    </main>
</@layout>
