<#include "module/macro.ftl">
<@layout title="分类：${category.name} | ${options.blog_title!} " keywords="${options.seo_keywords!}" description="${options.seo_description!}">
    <main class="mx-auto">
        <header class="bg-cover post-cover">
            <#if settings.categories_patternimg?? && settings.categories_patternimg!=''>
                <div class="w-screen cover-bg">
                    <img src="${settings.categories_patternimg!}" class="z-auto"
                         alt="${category.name}">
                </div>
            <#else>
                <div class="placeholder-bg">
                </div>
            </#if>
            <div class="cover-content">
                <!-- 封面内容 -->
                <div class="inner flex flex-col justify-center">
                    <h2 class="slogan text-center">${category.name}</h2>
                </div>
            </div>
        </header>
        <div class="container mx-auto px-4">
            <div class="posts grid lg:grid-cols-3 md:grid-cols-2 sm:grid-cols-1 lg:gap-8 md:gap-4 mt-4">
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
                                <p class="text-center text-2xl tracking-wider text-clamp-1 svg-f">
                                    <a href="${post.fullPath!}">
                                        <#if post.topPriority gt 0>
                                            <#include "module/icon/zhiding.ftl">
                                        </#if>
                                        ${post.title!}
                                    </a>
                                </p>
                                <p class="post-excerpt text-sm tracking-wider text-clamp-4">
                                    ${post.summary!}
                                </p>
                            </div>
                            <footer class="card-footer svg-f">
                                <a href="" class="author" title="">
                                    <span class="author-image cover"
                                          style="background-image: url(${user.avatar!});"></span>
                                    <span class="author-name">${user.nickname!}</span>
                                </a>
                                <div>
                                <span class="visitors-count">
                                    <span>${post.visits!}</span> <#include "module/icon/eye-sight.ftl">
                                </span>
                                    <span class="visitors-comment" style="margin-left: 10px;">
                                    <span>${post.commentCount}</span> <#include "module/icon/comment.ftl">
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
