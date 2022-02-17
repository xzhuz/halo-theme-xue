<#include "module/macro.ftl">
<@layout title="${settings.links_title!'友情链接'} | ${options.blog_title!}">
  <main class="mx-auto" id="container">
    <header class="bg-cover post-cover table relative w-full opacity-95">
        <#if settings.links_patternimg?? && settings.links_patternimg!=''>
          <div class="cover-bg bottom-0 left-0 right-0 top-0 opacity-30 absolute">
            <img src="${settings.links_patternimg!}" class="z-auto"
                 alt="${settings.links_title!'友情链接'}">
          </div>
        <#else>
          <div class="placeholder-bg">
          </div>
        </#if>
      <div class="cover-content table-cell relative w-full index flex justify-center">
        <!-- 封面内容 -->
        <div class="inner flex flex-col justify-center pt-40 pb-40">
          <p class="cover-title text-white mb-5 mt-4 leading-loose relative w-full text-left text-4xl">${settings.links_title!'友情链接'}</p>
        </div>
      </div>
    </header>
    <div
      class="mx-auto px-10 mt-16 max-w-6xl tracking-wider md:leading-relaxed sm:leading-normal mx-850 cn-pd content-container">
        <@linkTag method="listTeams">
            <#list teams as item>
                <#if item.team?? && item.team!=''>
                  <h2 class="w-full m-4 text-3xl">${item.team}</h2>
                </#if>
              <div class="flex flex-row flex-wrap justify-items-center grid lg:grid-cols-3 md:grid-cols-2">
                  <#list item.links?sort_by('priority')?reverse  as link>
                    <a class="lk-card-im card-item-vel block" href="${link.url}" target="_blank"
                       onfocus="this.blur();">
                      <div class="media">
                        <div class="media-left">
                          <figure class="image is-64x64">
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
        </@linkTag>
    </div>
  </main>
</@layout>
