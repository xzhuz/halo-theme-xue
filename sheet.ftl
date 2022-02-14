<#include "module/macro.ftl">
<@layout title="${sheet.title!} | ${options.blog_title!}">
  <main class="mx-auto" id="container">
    <header class="bg-cover post-cover table relative w-full opacity-95">
        <#if sheet.thumbnail?? && sheet.thumbnail!=''>
          <div class="cover-bg bottom-0 left-0 right-0 top-0 opacity-30 absolute">
            <img src="${sheet.thumbnail!}" class="z-auto"
                 alt="${sheet.title!}">
          </div>
        <#else>
          <div class="placeholder-bg">
          </div>
        </#if>
      <div class="cover-content table-cell relative w-full index flex justify-center">
        <!-- 封面内容 -->
        <div class="inner flex flex-col justify-center pt-40 pb-40">
          <p class="cover-title text-white mb-5 mt-4 leading-loose relative w-full text-left text-4xl">${sheet.title!}</p>
        </div>
      </div>
    </header>
    <div
      class="px-10 mx-auto md-content px-4 mt-16 max-w-6xl tracking-wider md:leading-relaxed sm:leading-normal ct-container cn-pd content-container"
      id="write">
        ${sheet.formatContent!}
    </div>

    <div
      class="mx-auto px-10 mt-16 max-w-6xl tracking-wider md:leading-relaxed sm:leading-normal ct-container cn-pd">
        <#include "module/comment.ftl">
        <@comment sheet,"sheet" />
    </div>
  </main>
</@layout>
