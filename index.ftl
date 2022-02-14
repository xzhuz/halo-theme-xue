<#include "module/macro.ftl">
<@layout title="${options.blog_title!}">
  <main class="mx-auto home-page" id="container">
    <header class="bg-cover home-cover table relative w-full opacity-95 h-1/2 z-10" id="homeHeader">
      <#if settings.home_cover?? && settings.home_cover!=''>
        <div class="cover-bg bottom-0 left-0 right-0 top-0 opacity-30 absolute">
          <img src="${settings.home_cover!}"
               alt="${settings.home_title!options.blog_title!}">
        </div>
      <#else>
        <div class="placeholder-bg"></div>
      </#if>
      <div class="cover-content table-cell relative w-full index flex justify-center">
        <!-- 封面内容 -->
        <h2 class="cover-title text-white mb-5 mt-4 leading-loose relative w-full text-left text-4xl">
          ${settings.home_title!options.blog_title!}
        </h2>
        <p class="slogan text-center text-white text-xl" id="slogan">${settings.home_description!}</p>
        <#if settings.enabled_index_cover_height!true>
          <a class="arrow-down" href="javascript:" onClick="scollTo()">
            <span class="screen-reader-text">Scroll Down</span>
          </a>
        </#if>
      </div>
    </header>
    <div class="mx-auto px-10 content-container postList mx-850">
      <h3 class="mt-4 mb-0"><span class="iconfont icon-new list-brands mr-2 text-base"></span>最新文章</h3>
      <#if settings.posts_style!true>
        <#include "module/widget/post_cards.ftl">
      <#else>
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
