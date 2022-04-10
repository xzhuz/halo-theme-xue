<#include "module/macro.ftl">
<@layout title="${options.blog_title!}">
  <main class="mx-auto" id="container">
    <header id="hero" class="bg-gray-900 table fade-down relative w-full opacity-95 z-10 <#if settings.enabled_index_cover_height!true>h-1/2 sm:h-1/2 md:h-screen full-screen<#else> h-1/2</#if>">
      <#if settings.home_cover?? && settings.home_cover!=''>
        <div class="cover-bg bottom-0 left-0 right-0 top-0 opacity-30 absolute">
          <img src="${settings.home_cover!}"
               alt="${settings.home_title!options.blog_title!}"
               class="h-full w-full left-0 object-cover absolute top-0 dark:filter-60 no-zoom"
          />
        </div>
      <#else>
        <div class="placeholder-bg"></div>
      </#if>
      <div class="h-96 align-middle table-cell relative w-full index flex justify-center">
        <!-- 封面内容 -->
        <h2 class="text-white dark:text-gray-300 mb-5 mt-4 leading-loose relative w-full text-4xl text-center">
          ${settings.home_title!options.blog_title!}
        </h2>
        <hr class="text-center bg-red-300 h-0.5 border-none w-20 mx-auto -mt-5 mb-3"/>
        <p class="slogan text-center text-white dark:text-gray-300 text-lg md:text-xl text-center" id="slogan">${settings.home_description!}</p>
        <#if settings.enabled_index_cover_height!true>
          <p class="w-full text-4xl absolute bottom-11 text-center">
            <a class="arrow-down z-50 <#if settings.enabled_index_cover_height!true>hidden sm:hidden md:block <#else>hidden</#if>" href="javascript:void(0)">
              <span class="iconfont icon-toBottom text-white dark:text-gray-300"></span>
            </a>
          </p>
        </#if>
      </div>
    </header>
    <div id="postList" class="mx-auto fade-up <#if settings.posts_style!true>px-5 md:px-0 max-w-xl sm:max-w-2xl md:max-w-3xl lg:max-w-5xl <#else> px-5 max-w-4xl flex flex-col</#if>">
      <#if settings.posts_style!true>
        <h3 class="mb-4 mt-8 dark:text-gray-300 hidden md:block"><span class="iconfont icon-new text-red-600 mr-2 text-base "></span>最新文章</h3>
        <#include "module/widget/post_cards.ftl">
      <#else>
        <#if settings.show_popular!true>
          <div class="popular-posts">
            <h3 class="mb-4 mt-8 dark:text-gray-300"><span class="iconfont icon-hot text-red-600 mr-2 text-base "></span>热门文章</h3>
            <div class="posts grid grid-cols-2 md:grid-cols-4 gap-2 md:gap-4">
              <#include "module/widget/popular_posts.ftl">
            </div>
          </div>
        </#if>
        <h3 class="mb-4 mt-8 dark:text-gray-300"><span class="iconfont icon-new text-red-600 mr-2 text-base "></span>最新文章</h3>
        <#include "module/widget/post_list.ftl">
      </#if>
      <#-- 分页-->
      <nav class="pagination flex flex-row justify-center my-8" role="navigation" aria-label="pagination">
        <@paginationTag method="index" page="${posts.number}" total="${posts.totalPages}" display="3">
          <#include "module/widget/pagination.ftl">
        </@paginationTag>
      </nav>
    </div>
  </main>
</@layout>
