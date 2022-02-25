<#include "module/macro.ftl">
<@layout title="${settings.links_title!'友情链接'} | ${options.blog_title!}">
  <main class="mx-auto" id="container">
    <header class="bg-gray-900 table fade-down relative w-full opacity-95 z-10 h-1/2">
      <#if settings.links_placeholder?? && settings.links_placeholder!=''>
        <div class="cover-bg bottom-0 left-0 right-0 top-0 opacity-30 absolute">
          <img src="${settings.links_placeholder!}"
               class="h-full w-full left-0 object-cover absolute top-0 dark:filter-60"
               alt="${settings.links_title!'友情链接'}">
        </div>
      <#else>
        <div class="placeholder-bg">
        </div>
      </#if>
      <div class="h-96 align-middle table-cell relative w-full index flex justify-center">
        <h2 class="text-white mb-5 mt-4 leading-loose relative w-full text-4xl text-center dark:text-gray-300">
          ${settings.links_title!'友情链接'}
        </h2>
        <hr class="text-center bg-red-300 h-0.5 border-none w-20 mx-auto -mt-5 mb-3"/>
      </div>
    </header>
    <div
            class="mx-auto px-10 mt-16 max-w-5xl tracking-wider md:leading-relaxed sm:leading-normal max-w-5xl cn-pd fade-up">
      <@linkTag method="listTeams">
        <#list teams as item>
          <#if item.team?? && item.team!=''>
            <h3 class="w-full m-4">${item.team}</h3>
          </#if>
          <div class="flex flex-row flex-wrap justify-items-center grid lg:grid-cols-3 md:grid-cols-2 sm:grid-cols-1">
            <#list item.links?sort_by('priority')?reverse  as link>
              <a href="${link.url}"
                 class="bg-gray-200 w-56 hover:shadow-md hover:text-white hover:bg-red-400 dark:bg-gray-600 dark:text-gray-300 dark:hover:bg-red-400 dark:hover:shadow-md dark:hover:text-white mt-2 mb-2 mr-2 block py-0 px-4 rounded leading-10 h-10 text-gray-800 no-underline "
                 style="text-decoration: none !important;">
                ${link.name} <span class="ml-4">${link.description}</span>
              </a>
            </#list>
          </div>
        </#list>
      </@linkTag>
    </div>
  </main>
</@layout>
