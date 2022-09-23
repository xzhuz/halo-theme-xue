<#include "module/macro.ftl">
<@layout title="${sheet.title!'友情链接'} | ${options.blog_title!}">
  <main class="mx-auto" id="container">
    <header class="bg-gray-900 table fade-down relative w-full opacity-95 z-10 h-1/2">
      <#if settings.links_patternimg?? && settings.links_patternimg!=''>
        <div class="cover-bg bottom-0 left-0 right-0 top-0 opacity-30 absolute">
          <img src="${settings.links_patternimg!}"
               class="h-full w-full left-0 object-cover absolute top-0 dark:filter-60"
               alt="${sheet.title!'友情链接'}">
        </div>
      <#else>
        <div class="placeholder-bg">
        </div>
      </#if>
      <div class="h-96 align-middle table-cell relative w-full index flex justify-center">
        <img class=" object-cover  my-4 ring-2 ring-white m-avatar w-20 h-20 rounded-full bg-white max-w-full border-2 border-white border-solid mx-auto no-zoom" src="${user.avatar}" alt="${user.nickname!}">
        <#if sheet.summary!='' || settings.home_description!=''>
          <p class="slogan text-center text-white dark:text-gray-300 text-lg md:text-xl text-center">
            <#if sheet.summary!='' >${sheet.summary}<#else>${settings.home_description!}</#if>
          </p>
        </#if>
      </div>
    </header>
    <div
      class="mx-auto px-10 my-16 max-w-5xl tracking-wider md:leading-relaxed sm:leading-normal max-w-5xl fade-up">
        <@linkTag method="listTeams">
            <#list teams as item>
                <#if item.team?? && item.team!=''>
                  <h3 class="w-full m-4">${item.team}</h3>
                </#if>
              <div class="flex flex-row flex-wrap justify-items-center grid lg:grid-cols-3 md:grid-cols-2 sm:grid-cols-1">
                  <#list item.links?sort_by('priority')?reverse  as link>
                    <a class="m-card slide-up flex p-1.5 text-gray-600 bg-white dark:bg-gray-800 rounded shadow-md justify-start content-start flex-col w-full max-w-16" target="_blank"
                       href="${link.url}">
                      <div class="flex self-center">
                        <img class="lazyload object-cover m-avatar w-20 h-20 dark:filter-60 rounded-full bg-white max-w-full border-2 border-white border-solid no-zoom"
                             data-src="${link.logo}" src="${theme_base!}/source/images/loading.gif"
                             onerror="onerror=null;src='${settings.links_placeholder!'${theme_base!}/source/images/placeholder.png'}'" alt="">                      </div>
                      <div class=" my-1.5 mx-3.5 flex flex-col text-center">
                        <p class="pt-3 pb-1.5 font-semibold text-gray-800 dark:text-gray-300">${link.name}</p>
                        <div class=" py-1.5 break-all flex items-center">
                          <p class=" inline-block w-full text-gray-600 dark:text-gray-500 overflow-hidden overflow-ellipsis whitespace-nowrap break-words m-0 text-center" title="${link.description}">${link.description}</p>
                        </div>
                      </div>
                    </a>
                  </#list>
              </div>
            </#list>
          <#if sheet.content != ''>
            <div class="mx-auto bg-white dark:bg-gray-800 rounded-md px-10 py-10 md-content mt-8 max-w-4xl tracking-wider md:leading-relaxed sm:leading-normal heti text-gray-800 dark:text-gray-300"
                 id="lightGallery">
                ${sheet.content!}
            </div>
          </#if>
        </@linkTag>
    </div>
    <div class="mx-4 md:mx-auto md-content mt-8 max-w-4xl tracking-wider md:leading-relaxed sm:leading-normal">
      <#if !sheet.disallowComment!false>
        <#include "module/comment.ftl">
        <@comment sheet,"sheet" />
      </#if>
    </div>
  </main>
</@layout>
