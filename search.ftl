<#include "module/macro.ftl">
<@layout title="${keyword!} - 搜索结果 - ${blog_title!}" keywords="${options.seo_keywords!}" description="${options.seo_description!}">
    <main class="mx-auto" id="container">
        <header class="bg-cover post-cover">
            <#if settings.search_patternimg?? && settings.search_patternimg!=''>
                <div class="cover-bg">
                    <img src="${settings.search_patternimg!}" class="z-auto"
                         alt="${keyword!}">
                </div>
            <#else>
                <div class="placeholder-bg">
                </div>
            </#if>
            <div class="cover-content">
                <!-- 封面内容 -->
                <div class="inner flex flex-col justify-center">
                    <h2 class="cover-title text-base md:text-4xl lg:text-4xl xl:text-5xl">关于「${keyword!}」的搜索结果</h2>
                </div>
            </div>
        </header>

        <#if posts?? && posts.content?size gt 0>
            <div class="container mx-auto px-4 mt-16 max-w-6xl tracking-wider md:leading-relaxed sm:leading-normal ph-container cn-pd" id="pageContainer">
                <#list posts.content as post>
                    <a href="${post.fullPath}" class="ah-hf ah-hv">
                        <span class="ah-dt">${post.createTime?string('MM-dd')}</span>
                        <span class="ah-tt">${post.title!}</span>
                    </a>
                </#list>
            </div>
            <#if posts.totalPages gt 1>
            <#-- 分页-->
                <nav class="pagination flex flex-row justify-center mt-8" role="navigation" aria-label="pagination">
                    <@paginationTag method="search" page="${posts.number}" total="${posts.totalPages}" display="3" keyword="${keyword}">
                        <#include "module/widget/pagination.ftl">
                    </@paginationTag>
                </nav>
            </#if>
        <#else >
            <div class="container mx-auto px-4 mt-16 max-w-6xl tracking-wider md:leading-relaxed sm:leading-normal ph-container cn-pd">
            <div id="post-list" class="post-list inner">
                <div class="">
                    <!-- search start -->
                    <form class="s-search">
                        <label class="sh-lab sh-br">
                            <input class="sh-ipt" maxlength="30" name="keyword" spellcheck="false"
                                   placeholder="Search" autocomplete="off">
                            <i class="sh-icon iconfont icon-search"></i>
                        </label>
                    </form>
                    <!-- search end -->
                </div>
                <section class="no-results not-found">
                    <header class="not-found-header">
                        <h1 class="not-found-title">Sorry! Nothing Found...</h1>
                    </header><!-- .page-header -->

                    <div class="page-content">
                        <#if is_search??>
                            <div class="sorry">
                                <p>没有找到你想要的，看看其他的吧。</p>
                                <div class="sorry-inner">
                                    <ul class="search-no-results">
                                        <@postTag method="latest" top="10">
                                            <#list posts as post>
                                                <li>
                                                    <a class="ah-hf ah-hv" href="${post.fullPath!}">
                                                        <span class="ah-dt">${post.createTime?string('MM-dd')}</span>
                                                        <span class="ah-tt">${post.title!}</span>
                                                    </a>
                                                </li>
                                            </#list>
                                        </@postTag>
                                    </ul>
                                </div>
                            </div>
                        <#else>
                            <p>我们似乎没有找到你想要的东西. 或许你可以搜索一下试试.</p>
                        </#if>
                    </div><!-- .page-content -->
                </section>
            </div>
            </div>
        </#if>

    </main>
</@layout>