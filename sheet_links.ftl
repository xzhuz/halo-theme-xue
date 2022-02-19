<#include "module/macro.ftl">
<@layout title="${sheet.title!'友情链接'} | ${options.blog_title!}">
  <main class="mx-auto" id="container">
    <header class="bg-gray-900 table fade-down relative w-full opacity-95 z-10 h-1/2">
      <#if settings.links_placeholder?? && settings.links_placeholder!=''>
        <div class="cover-bg bottom-0 left-0 right-0 top-0 opacity-30 absolute">
          <img src="${settings.links_placeholder!}"
               class="h-full w-full left-0 object-cover absolute top-0"
               alt="${sheet.title!'友情链接'}">
        </div>
      <#else>
        <div class="placeholder-bg">
        </div>
      </#if>
      <div class="h-96 align-middle table-cell relative w-full index flex justify-center">
        <h2 class="text-white mb-5 mt-4 leading-loose relative w-full text-4xl text-center">
          ${sheet.title!'友情链接'}
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
                    <a class="lk-card-im card-item-vel block" href="${link.url}" target="_blank"
                       onfocus="this.blur();">
                      <div class="media">
                        <div class="media-left">
                          <figure class="image is-64x64 block relative">
                              <#if link.logo?? && link.logo != ''>
                                <img src="${link.logo}" alt="${link.name}">
                              <#elseif settings.links_placeholder?? && settings.links_placeholder != ''>
                                <img src="${settings.links_placeholder}"
                                     alt="${link.name}">
                              <#else>
                                <img src="https://cdn.jsdelivr.net/gh/xzzai/static@v1.0.1/placeholder.jpg"
                                     alt="${link.name}">
                              </#if>
                          </figure>
                        </div>
                        <div class="media-content">
                          <p class="lk-title">${link.name}</p>
                          <p class="lk-desc">${link.description}</p>
                        </div>
                      </div>
                    </a>
                  </#list>
              </div>
            </#list>
          <div id="write">
            <!--声明区域-->
              ${sheet.formatContent!}
          </div>
        </@linkTag>
    </div>

    <div
      class="mx-auto px-10 mt-16 max-w-5xl tracking-wider md:leading-relaxed sm:leading-normal ct-container cn-pd">
        <#include "module/comment.ftl">
        <@comment sheet,"sheet" />
    </div>
  </main>
</@layout>
