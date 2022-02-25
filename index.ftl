<#include "module/macro.ftl">
<@layout title="${options.blog_title!}">
  <main class="mx-auto" id="container">
    <header class="bg-gray-900 table fade-down relative w-full opacity-95 z-10 <#if settings.enabled_index_cover_height!true>h-1/2 sm:h-1/2 md:h-screen <#else> h-1/2</#if>"
            id="homeHeader">
      <#if settings.home_cover?? && settings.home_cover!=''>
        <div class="cover-bg bottom-0 left-0 right-0 top-0 opacity-30 absolute">
          <img src="${settings.home_cover!}"
               alt="${settings.home_title!options.blog_title!}"
               class="h-full w-full left-0 object-cover absolute top-0 dark:filter-60"
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
          <a class="arrow-down absolute bottom-11 left-2/4 -m-5 <#if settings.enabled_index_cover_height!true>hidden sm:hidden md:inline-block <#else>hidden</#if>" href="javascript:" onClick="scollTo()">
            <span class="screen-reader-text border-none h-px w-px overflow-hidden absolute p-0">Scroll Down</span>
          </a>
        </#if>
      </div>
    </header>
    <div class="mx-auto fade-up  <#if settings.posts_style!true>px-5 md:px-0 max-w-xl sm:max-w-2xl md:max-w-3xl lg:max-w-5xl <#else> px-5 max-w-4xl</#if>">
      <h3 class="mt-4 mb-0 dark:text-gray-300 hidden md:block"><span class="iconfont icon-new text-red-600 mr-2 text-base "></span>最新文章</h3>
<#--      <hr class="text-center w-full mx-auto mt-2 mb-2 hidden md:block bg-gray-300 dark:bg-gray-700"/>-->
      <#if settings.posts_style!true>
        <#include "module/widget/post_cards.ftl">
      <#else>
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
