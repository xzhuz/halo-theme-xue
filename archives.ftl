<#include "module/macro.ftl">
<@layout title="${settings.achieve_title!'归档'} | ${options.blog_title!}">
  <main class="mx-auto" id="container">
    <header class="bg-gray-900 table fade-down relative w-full opacity-95 z-10 h-1/2">
      <#if settings.archives_patternimg?? && settings.archives_patternimg!=''>
        <div class="cover-bg bottom-0 left-0 right-0 top-0 opacity-30 absolute">
          <img src="${settings.archives_patternimg!}"
               class="h-full w-full left-0 object-cover absolute top-0"
               alt="${settings.achieve_title!'归档'}">
        </div>
      <#else>
        <div class="placeholder-bg">
        </div>
      </#if>
      <div class="h-96 align-middle table-cell relative w-full index flex justify-center">
        <h2 class="text-white mb-5 mt-4 leading-loose relative w-full text-4xl text-center">
          ${settings.achieve_title!'归档'}
        </h2>
        <hr class="text-center bg-red-300 h-0.5 border-none w-20 mx-auto -mt-5 mb-3"/>
      </div>
    </header>
    <div
            class="mx-auto px-10 mt-16 max-w-5xl tracking-wider md:leading-relaxed sm:leading-normal ct-container cn-pd fade-up"
            id="pageContainer">
      <@postTag method="archiveMonth">
        <#assign year="">
        <#list archives as archive>
          <section class="arch-year pt-0.5 pb-0.5 px-0 relative">
            <#if archive.year?c != year>
              <h1 class="m-0 leading-9 bg-white relative">${archive.year?c}</h1>
              <#assign year="${archive.year?c}">
            </#if>
            <div class="relative pl-12">
              <header class="absolute mh-hd py-0 pl-2.5 pr-2.5 rounded left-6 text-white uppercase font-semibold leading-loose mt-6 af-bg-fff bg-gray-400 bg-none"> ${archive.month!}
                月
              </header>
              <span class="">
                            <#list archive.posts?sort_by("createTime")?reverse as post>
                              <a class="ah-hf transition-colors hover:opacity-70 relative block ml-6 px-0 pt-2 pb-2 leading-8" href="${post.fullPath!}">
                                    <span class="ah-dt float-left pr-2 whitespace-nowrap tracking-wide text-sm opacity-60" style="line-height: inherit !important;">${post.createTime?string('MM-dd')}</span>
                                    <span class="ah-tt table-cell text-lg" style="line-height: inherit !important;">${post.title!}</span>
                                </a>
                            </#list>
                        </span>
            </div>
          </section>
        </#list>
      </@postTag>
    </div>
  </main>
</@layout>
