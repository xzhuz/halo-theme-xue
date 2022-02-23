<#include "module/macro.ftl">
<@layout title="${post.title!} | ${options.blog_title!}">
  <main class="mx-auto dark:bg-gray-900" id="container">
    <header class="bg-gray-900 table fade-down relative w-full opacity-95 z-10 h-1/2" id="postHeader">
        <#if post.thumbnail?? && post.thumbnail!=''>
          <div class="cover-bg bottom-0 left-0 right-0 top-0 opacity-30 absolute">
            <img src="${post.thumbnail!}" class="h-full w-full left-0 object-cover absolute top-0 dark:filter-60" alt="${post.title!}">
          </div>
        <#elseif settings.card_random_cover_list?? && settings.card_random_cover_list != ''>
          <div class="cover-bg bottom-0 left-0 right-0 top-0 opacity-30 absolute">
            <img src="${theme_base!}/source/images/loading.svg" class="h-full w-full left-0 object-cover absolute top-0 img-random dark:filter-60" alt="${post.title}"/>
          </div>
        <#else>
          <div class="placeholder-bg">
          </div>
        </#if>
      <div class="h-96 align-middle table-cell relative w-full index flex justify-center">
        <h2 class="text-white mb-5 mt-4 leading-loose relative w-full text-2xl md:text-4xl text-center dark:text-gray-300">
          ${post.title!}
        </h2>
        <hr class="text-center bg-red-300 h-0.5 border-none w-20 mx-auto -mt-4 mb-3"/>
        <!-- 封面内容 -->
        <div class="post-meta text-white">
          <div class="post-meta-wrap absolute h-24 text-right w-full bottom-2.5 right-2.5">
            <img class="rounded-full float-right h-16 md:h-20 h-16 md:w-20 mt-1 md:mt-0 border-2 border-white mx-1 ml-3 dark:filter-60"
                 srcset="${user.avatar!}, ${user.avatar!} 2x"
                 src="${user.avatar!}" alt=""/>
            <span class="tracking-wide uppercase block text-sm my-1 md:my-2 dark:text-gray-300">${post.visits} 次访问</span>
            <time class="tracking-wide uppercase block text-sm my-1 md:my-2 dark:text-gray-300"> 发布: ${post.createTime?string("yyyy-MM-dd")}</time>
            <time class="tracking-wide uppercase block text-sm my-1 md:my-2 dark:text-gray-300" >更新: ${post.editTime?string("yyyy-MM-dd")}</time>
          </div>
          <div class="text-center">
            <#if post.categories?? && post.categories?size gt 0>
              <span class="iconfont icon-folder"> </span>
            </#if>
            <#if post.categories?? && post.categories?size gt 0>
              <#list post.categories as category>
                <a href="${category.fullPath!}" class="text-white no-underline">
                  · ${category.name!}
                </a>
              </#list>
            </#if>
          </div>
        </div>
      </div>
    </header>
    <div class="article-content fade-up">
      <div  class="mx-auto px-10 md-content mt-8 max-w-5xl tracking-wider md:leading-relaxed sm:leading-normal heti text-gray-800 dark:text-gray-300" id="gallery-content">
        ${post.formatContent!}
      </div>
      <div id="tocFlag"></div>
        <#if settings.post_toc!true>
          <aside id="toc" class="toc"></aside>
        </#if>
    </div>

    <div class="mx-auto px-10 md-content mt-8 max-w-5xl tracking-wider md:leading-relaxed sm:leading-normal coffee-tags">
      <blockquote class="post-copyright py-4">
        <p class="m-0 text-base"><b>Copyright: </b> 采用 <a href="https://creativecommons.org/licenses/by/4.0/"
                                    target="_blank"
                                    rel="external nofollow">知识共享署名4.0</a> 国际许可协议进行许可</p>
        <p class="m-0 text-base"><b>Links: </b> <a href="${post.fullPath!}">${post.fullPath!}</a></p>
      </blockquote>
        <#include "module/widget/sponsor.ftl">
    </div>
    <div class="mx-auto px-10 md-content mt-8 max-w-5xl tracking-wider md:leading-relaxed sm:leading-normal">
      <p class="flex flex-row justify-start flex-wrap">
          <#if post.tags?? && post.tags?size gt 0>
              <#list post.tags as tag>
                <a href="${tag.fullPath!}"class="bg-gray-200 hover:shadow-md hover:text-white hover:bg-red-400 dark:bg-gray-600 dark:text-gray-300 dark:hover:bg-red-400 dark:hover:shadow-md dark:hover:text-white mt-2 mb-2 mr-2 block py-0 px-4 rounded leading-10 h-10 transition text-gray-800 no-underline" style="text-decoration: none !important;">
                  #&nbsp;${tag.name!}
                </a>
              </#list>
          </#if>
      </p>
      <hr class="mt-4" style="background-color: rgba(96, 125, 139, .05); size: 2px;">
    </div>

    <!-- 上一篇和下一篇 -->
      <#if settings.post_nepre!true>
          <#include "module/widget/prev_next_page.ftl">
      </#if>

    <div
      class="mx-auto px-10 md-content mt-8 max-w-5xl tracking-wider md:leading-relaxed sm:leading-normal">
        <#include "module/comment.ftl">
        <@comment post,"post" />
    </div>
  </main>
</@layout>



