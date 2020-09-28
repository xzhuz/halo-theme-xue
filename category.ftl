<#include "module/macro.ftl">
<@layout title="${category.name} | ${options.blog_title!} " keywords="${options.seo_keywords!}" description="${options.seo_description!}">
    <main class="mx-auto" id="container">
        <header class="bg-cover post-cover">
            <#if settings.categories_patternimg?? && settings.categories_patternimg!=''>
                <div class="cover-bg">
                    <img src="${settings.categories_patternimg!}" class="z-auto"
                         alt="${category.name}">
                </div>
            <#else>
                <div class="placeholder-bg">
                </div>
            </#if>
            <div class="cover-content flex justify-center">
                <!-- 封面内容 -->
                <div class="inner flex flex-col justify-center">
                    <p class="cover-title text-base md:text-4xl lg:text-4xl xl:text-5xl">${category.name}</p>
                </div>
            </div>
        </header>
        <div class="container mx-auto px-4 content-container mx-850 mt-8">
            <div class="posts mt-4">
                <#if posts?? && posts.getTotalElements() gt 0>
                    <#include "module/widget/post_items.ftl">
                </#if>
            </div>
            <#-- 分页-->
            <nav class="pagination flex flex-row justify-center mt-8" role="navigation" aria-label="pagination">
                <@paginationTag method="categoryPosts" page="${posts.number}" total="${posts.totalPages}" display="3" slug="${category.slug!}">
                    <#include "module/widget/pagination.ftl">
                </@paginationTag>
            </nav>
        </div>
    </main>
</@layout>
