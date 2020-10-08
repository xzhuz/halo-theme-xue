<#include "module/macro.ftl">
<@layout title="${options.blog_title!}" keywords="${options.seo_keywords!}" description="${options.seo_description!}">
    <main class="mx-auto home-page" id="container">
        <#if settings.card_random_cover_list?? && settings.card_random_cover_list != ''>
            <#assign x = "${settings.card_random_cover_list}"?trim />
            <#assign thumbnails = x?trim?split(";") />
            <#assign thumbnailSize = thumbnails?size />
            <#if settings.card_random_cover_list?ends_with(";")>
                <#assign thumbnailSize =thumbnailSize - 1 />
            </#if>
        </#if>
        <header class="bg-cover home-cover" id="homeHeader">
            <#if settings.home_cover?? && settings.home_cover!=''>
                <div class="cover-bg">
                    <img src="${settings.home_cover!}"
                         alt="${settings.home_title!options.blog_title!}">
                </div>
            <#else>
                <div class="placeholder-bg"></div> 
            </#if>
            <div class="cover-content index flex justify-center">
                <!-- 封面内容 -->
                <h2 class="cover-title text-left md:text-4xl lg:text-4xl xl:text-5xl">${settings.home_title!options.blog_title!}</h2>
                    <p class="slogan text-center" id="slogan">${settings.home_description!}</p>
                    <#if settings.enabled_index_cover_height!true>
                        <a class="arrow-down" href="javascript:" onClick="scollTo()">
                            <span class="screen-reader-text">Scroll Down</span>
                        </a>
                    </#if>
            </div>
        </header>
        <div class="container mx-auto px-4 content-container postList <#if !(settings.posts_style!true)>mx-850</#if>">
            <#if settings.posts_style!true>
                <#include "module/widget/post_cards.ftl">
            <#else>
                <div class="popular-posts">
                    <h3><i class="iconfont icon-hot list-brands"></i>热门文章</h3>
                    <div class="posts grid grid-cols-2 lg:grid-cols-4 md:grid-cols-4  lg:gap-4 md:gap-2 sm:gap-1">
                        <#include "module/widget/popular_cards.ftl">
                    </div>
                </div>
                <h3><i class="iconfont icon-new list-brands"></i>最新文章</h3>
                <#include "module/widget/post_list.ftl">
            </#if>
            <#-- 分页-->
            <nav class="pagination flex flex-row justify-center mt-8" role="navigation" aria-label="pagination">
                <@paginationTag method="index" page="${posts.number}" total="${posts.totalPages}" display="3">
                    <#include "module/widget/pagination.ftl">
                </@paginationTag>
            </nav>
        </div>
    </main>
</@layout>
