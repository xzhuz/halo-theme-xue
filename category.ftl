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
        <div class="container mx-auto px-4 content-container">
            <div class="posts grid lg:grid-cols-3 md:grid-cols-2 sm:grid-cols-2 xs:grid-cols-1 lg:gap-6 md:gap-4 sm:gap-3 mt-4">
                <#if posts?? && posts.getTotalElements() gt 0>
                    <#list posts.content as post>
                        <div class="post-card mt-4">
                            <header class="card-header card-img">
                                <#if post.thumbnail?? && post.thumbnail!=''>
                                    <a  href="${post.fullPath!}"
                                        style=" background-image: url(${post.thumbnail!''});"
                                        class="img-cover img-cover-bg">
                                    </a>
                                <#elseif settings.card_random_cover!false>
                                    <#assign x = "${settings.card_random_cover_img_num?number}" />
                                    <#assign thumbnailIndex ="${post_index % (x?number)}"/>
                                    <a href="${post.fullPath!}" class="img-cover img-cover-bg"
                                       style="background-image: url(${blog_url!}/thumbnail/thumbnail-${thumbnailIndex?number?abs}.${settings.card_random_cover_img_suffix});"
                                    >
                                    </a>
                                <#else>
                                    <a data-ajax href="${post.fullPath!}" class= "img-cover no-thumb">
                                        <span class="full-image placeholder-bg" role="img" aria-label=""></span>
                                    </a>
                                </#if>
                            </header>
                            <div class="card-body">
                                <p class="text-center text-xl tracking-wider svg-f text-clamp-1">
                                    <a href="${post.fullPath!}" class="font-medium text-gray-700 post-title font-sans">
                                        ${post.title!}
                                    </a>
                                </p>
                                <#if settings.card_hover_summary!false>
                                    <p class="post-excerpt text-sm tracking-wider text-clamp-3 font-sans">
                                        ${post.summary!}
                                    </p>
                                </#if>
                            </div>
                            <footer class="card-footer svg-f">
                                <span class="cst-icon icon-calendar lh-25 f-10" style="margin-right: 5px"></span>
                                <span class="post-time lh-25 mr-auto">
                                        <span class="published"
                                              datetime="${post.createTime?string("yyyy-MM-dd")}">${post.createTime?string("yyyy-MM-dd")}</span>
                                    </span>
                                <div class="lh-25">
                                    <span class="visitors-count">
                                        <span>${post.visits!}</span> <span class="iconfont icon-Eyesight"> </span>
                                    </span>
                                    <span class="visitors-comment">
                                        <span>${post.commentCount}</span> <span class="iconfont icon-comment"> </span>
                                    </span>
                                </div>
                            </footer>
                        </div>
                    </#list>
                </#if>
            </div>
            <#-- 分页-->
            <nav class="pagination flex flex-row justify-center mt-8" role="navigation" aria-label="pagination">
                <@paginationTag method="categoryPosts" page="${posts.number}" total="${posts.totalPages}" display="3" slug="${category.slug!}">
                    <#include "module/pagination.ftl">
                </@paginationTag>
            </nav>
        </div>
    </main>
</@layout>
