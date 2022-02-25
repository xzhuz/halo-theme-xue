<#include "module/macro.ftl">
<@layout title="${sheet.title!} | ${options.blog_title!}">
  <main class="mx-auto dark:bg-gray-900" id="container">
    <header class="bg-gray-900 table fade-down relative w-full opacity-95 z-10 h-1/2">
      <#if sheet.thumbnail?? && sheet.thumbnail!=''>
        <div class="cover-bg bottom-0 left-0 right-0 top-0 opacity-30 absolute">
          <img src="${sheet.thumbnail!}"
               class="h-full w-full left-0 object-cover absolute top-0 dark:filter-60"
               alt="${sheet.title!}">
        </div>
      <#else>
        <div class="placeholder-bg">
        </div>
      </#if>
      <div class="h-96 align-middle table-cell relative w-full index flex justify-center">
        <h2 class="text-white mb-5 mt-4 leading-loose relative w-full text-4xl text-center dark:text-gray-300 ">
          ${sheet.title!}
        </h2>
        <hr class="text-center bg-red-300 h-0.5 border-none w-20 mx-auto -mt-5 mb-3"/>
      </div>
    </header>
    <div
      class="px-10 mx-auto md-content text-gray-800 dark:text-gray-300 px-4 mt-16 max-w-5xl tracking-wider md:leading-relaxed sm:leading-normal ct-container cn-pd fade-up"
      id="write">
        ${sheet.formatContent!}
    </div>

    <div
      class="mx-auto px-10 mt-16 max-w-5xl tracking-wider md:leading-relaxed sm:leading-normal ct-container cn-pd">
        <#include "module/comment.ftl">
        <@comment sheet,"sheet" />
    </div>
  </main>
</@layout>
