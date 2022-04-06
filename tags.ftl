<#include "module/macro.ftl">
<@layout title="${settings.tags_title! '标签列表'} | ${options.blog_title!} ">
  <main class="mx-auto" id="container">
    <header class="bg-gray-900 table fade-down relative w-full opacity-95 z-10 h-1/2">
      <#if settings.tag_patternimg?? && settings.tag_patternimg!=''>
        <div class="cover-bg bottom-0 left-0 right-0 top-0 opacity-30 absolute">
          <img src="${settings.tag_patternimg!}"
               class="h-full w-full left-0 object-cover absolute top-0 dark:filter-60 no-zoom"
               alt="${settings.tags_title! '标签列表'}">
        </div>
      <#else>
        <div class="placeholder-bg">
        </div>
      </#if>
      <div class="h-96 align-middle table-cell relative w-full index flex justify-center">
        <h2 class="text-white mb-5 mt-4 leading-loose relative w-full text-4xl text-center dark:text-gray-300">
          ${settings.tags_title! '标签列表'}
          <@tagTag method="list">
            <sup>
              ${tags?size}
            </sup>
          </@tagTag>
        </h2>
      </div>
    </header>
    <div
      class="mx-auto px-10 my-16 max-w-5xl tracking-wider md:leading-relaxed sm:leading-normal fade-up cloud">
      <h2 class="dark:text-gray-300 my-4">标签</h2>
      <p class="flex flex-row justify-start flex-wrap">
          <@tagTag method="list">
              <#if tags?? && tags?size gt 0>
                  <#list tags as tag>
                    <a href="${tag.fullPath}" class="bg-gray-200 hover:shadow-md hover:text-white hover:bg-red-400 dark:bg-gray-600 dark:text-gray-300 dark:hover:bg-red-400 dark:hover:shadow-md dark:hover:text-white mt-2 mb-2 mr-2 block py-0 px-4 rounded leading-10 h-10 text-gray-800 no-underline " style="text-decoration: none !important;">
                        ${tag.name} <span class="ml-4">${tag.postCount!}</span>
                    </a>
                  </#list>
              </#if>
          </@tagTag>
      </p>
      <h2 class="dark:text-gray-300 my-4 hidden md:block">云</h2>
      <div id="tagCloud" class="card-content jqcloud jqcloud-hg w-full h-72 hidden md:block "></div>
    </div>
  </main>
</@layout>
