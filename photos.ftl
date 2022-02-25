<#include "module/macro.ftl">
<@layout title="相册 | ${options.blog_title!}">
  <main class="mx-auto dark:bg-gray-900" id="container">
    <header class="bg-gray-900 table fade-down relative w-full opacity-95 z-10 h-1/2">
      <#if settings.photos_patternimg?? && settings.photos_patternimg!=''>
        <div class="cover-bg bottom-0 left-0 right-0 top-0 opacity-30 absolute">
          <img src="${settings.photos_patternimg!}"
               class="h-full w-full left-0 object-cover absolute top-0 dark:filter-60"
               alt="${settings.photos_title!'相册'}">
        </div>
      <#else>
        <div class="placeholder-bg">
        </div>
      </#if>
      <div class="h-96 align-middle table-cell relative w-full index flex justify-center">
        <h2 class="text-white mb-5 mt-4 leading-loose relative w-full text-4xl text-center dark:text-gray-300">
          ${settings.photos_title!'相册'}
        </h2>
        <hr class="text-center bg-red-300 h-0.5 border-none w-20 mx-auto -mt-5 mb-3"/>
      </div>
    </header>
    <div
      class="mx-auto px-10 mt-16 tracking-wider md:leading-relaxed sm:leading-normal cn-pd photos-page fade-up">
      <div class="photos-box article-content" id="gallery-content">
        <nav id="gallery-filter">
          <ul>
            <li>
              <a href="javascript:void(0);" data-filter="*" class="active">全部</a>
            </li>
              <@photoTag method="listTeams">
                  <#list teams as item>
                    <li>
                      <a href="javascript:void(0);"
                         data-filter=".${((item.team)?length>0)?string((item.team),'默认')}">${((item.team)?length>0)?string((item.team),'默认')}</a>
                    </li>
                  </#list>
              </@photoTag>
          </ul>
        </nav>
        <div class="gallery masonry-gallery">
            <@photoTag method="list">
                <#list photos?sort_by('name')?reverse as photo>
                  <figure class="gallery-item col-3 ${((photo.team)?length>0)?string((photo.team),'默认')}">
                    <header class="gallery-icon">
                      <a data-fancybox="gallery" href="javascript:void(0);">
                        <img class="lazyload dark:filter-60" src="${theme_base!}/source/images/loading.svg" data-src="${photo.url!}"
                             alt="${photo.name!}"/>
                      </a>
                    </header>
                    <figcaption class="gallery-caption">
                      <div class="entry-summary">
                        <h3>${photo.name}</h3>
                          <#if photo.description?? && photo.description != "">
                            <p>${photo.description!}</p>
                          </#if>
                      </div>
                    </figcaption>
                    <p class="name" style="display: none">${photo.name}</p>
                  </figure>
                </#list>
            </@photoTag>
        </div>
      </div>
    </div>
  </main>
</@layout>
