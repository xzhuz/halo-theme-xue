<#include "module/macro.ftl">
<@layout title="${settings.jounarls_title!'Journals'} | ${options.blog_title!}">
  <main class="mx-auto" id="container">
    <header class="bg-gray-900 table fade-down relative w-full opacity-95 z-10 h-1/2">
      <#if settings.journals_patternimg?? && settings.journals_patternimg!=''>
        <div class="cover-bg bottom-0 left-0 right-0 top-0 opacity-30 absolute">
          <img src="${settings.journals_patternimg!}"
               class="h-full w-full left-0 object-cover absolute top-0 dark:filter-60"
               alt="${settings.jounarls_title! '日志'}">
        </div>
      <#else>
        <div class="placeholder-bg">
        </div>
      </#if>
      <div class="h-96 align-middle table-cell relative w-full index flex justify-center">
        <h2 class="text-white mb-5 mt-4 leading-loose relative w-full text-4xl text-center dark:text-gray-300">
          ${settings.jounarls_title! '日志'} <sup>${journals.totalElements}</sup>
        </h2>
        <hr class="text-center bg-red-300 h-0.5 border-none w-20 mx-auto -mt-5 mb-3"/>
      </div>
    </header>
    <div class="mx-auto px-10 mt-16 max-w-5xl tracking-wider md:leading-relaxed sm:leading-normal
                ct-container cn-pd fade-up is-container" id="moreContainer">
      <div id="ziyan-list">
        <div style="position: relative">
            <#list journals.content as journal>
              <div class="relative flex py-2.5 px-0 " style="transform-origin: center top;">
                <div class="flex-auto py-4 px-6 overflow-auto cursor-pointer rounded-md transition duration-300 ease-linear bg-gray-100 dark:bg-gray-700 shadow-xs hover:shadow-lg">
                  <div class="text-base relative mb-2">
                    <span class="text-gray-800 dark:text-gray-400 font-semibold text-lg no-underline">${user.nickname!}</span>
                    <span class="font-semibold my-auto mx-1.5 dark:text-gray-400">·</span>
                    <span class="text-gray-400 dark:text-gray-400">${journal.createTime?string("yyyy-MM-dd HH:mm:ss")}</span>
                  </div>
                  <div class="ziyan md-content text-gray-800 break-words text-lg md-content tracking-widest dark:text-gray-300">
                      ${journal.content!}
                  </div>
                  <div class="relative select-none text-base float-right">
                      <div class="relative inline-block rounded-full transition duration-500 ease-in-out p-0.5 outline-none">
                        <span class="iconfont icon-round_like_fill cursor-pointer text-lg dark:text-gray-300" onclick="likeJournal(this);" 
                              data-path="${blog_url!}/api/content/journals/${journal.id}/likes">
                        </span>
                        <span class="is-reaction-count cursor-text text-lg dark:text-gray-300">${journal.likes}</span>
                      </div>
                  </div>
                </div>
              </div>
            </#list>
        </div>
      </div>
    </div>
    <div class="mx-auto px-10 fade-up <#if !(settings.posts_style!true)>mx-850</#if>">
      <nav class="pagination flex flex-row justify-center my-8" role="navigation"
           aria-label="pagination">
          <#if journals.totalPages gt 1>
              <@paginationTag method="journals" page="${journals.number}" total="${journals.totalPages}" display="3">
                  <#include "module/widget/more.ftl">
              </@paginationTag>
          </#if>
      </nav>
    </div>
  </main>
</@layout>
