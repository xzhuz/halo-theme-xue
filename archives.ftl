<#include "module/macro.ftl">
<@layout title="${settings.achieve_title!'归档'} | ${options.blog_title!}">
  <main class="mx-auto" id="container">
    <header class="bg-cover post-cover table relative w-full opacity-95 z-10">
      <#if settings.archives_patternimg?? && settings.archives_patternimg!=''>
        <div class="cover-bg bottom-0 left-0 right-0 top-0 opacity-30 absolute">
          <img src="${settings.archives_patternimg!}" class="z-auto"
               alt="${settings.achieve_title!'归档'}">
        </div>
      <#else>
        <div class="placeholder-bg">
        </div>
      </#if>
      <div class="cover-content table-cell relative w-full index flex justify-center">
        <!-- 封面内容 -->
        <div class="inner flex flex-col justify-center pt-40 pb-40">
          <p class="cover-title text-white mb-5 mt-4 leading-loose relative w-full text-left text-4xl">${settings.achieve_title!'归档'}</p>
        </div>
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
              <header class="absolute mh-hd py-0 pl-2.5 pr-2.5 rounded left-6 text-white uppercase font-semibold leading-loose mt-6 af-bg-fff mh-bg "> ${archive.month!}
                月
              </header>
              <span class="">
                            <#list archive.posts?sort_by("createTime")?reverse as post>
                              <a class="ah-hf transition-colors ah-hv relative block ml-6 px-0 pt-2 pb-2 leading-8" href="${post.fullPath!}">
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
