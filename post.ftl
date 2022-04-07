<#include "module/macro.ftl">
<@layout title="${post.title!} | ${options.blog_title!}">
  <main class="mx-auto" id="container">
    <header class="bg-gray-900 table fade-down relative w-full opacity-95 z-10 h-1/2" id="postHeader">
      <#if post.thumbnail?? && post.thumbnail!=''>
        <div class="cover-bg bottom-0 left-0 right-0 top-0 opacity-30 absolute">
          <img src="${post.thumbnail!}" class="h-full w-full left-0 object-cover absolute top-0 dark:filter-60 no-zoom"
               alt="${post.title!}">
        </div>
      <#elseif settings.card_random_cover_list?? && settings.card_random_cover_list != ''>
        <div class="cover-bg bottom-0 left-0 right-0 top-0 opacity-30 absolute">
          <img src="${theme_base!}/source/images/loading.gif"
               class="h-full w-full left-0 object-cover absolute top-0 img-random dark:filter-60 no-zoom" alt="${post.title}"/>
        </div>
      <#else>
        <div class="placeholder-bg">
        </div>
      </#if>
      <div class="h-96 align-middle table-cell relative w-full index flex justify-center">
        <h2 class="text-white mb-5 mt-4 leading-loose relative w-full text-2xl md:text-4xl text-center dark:text-gray-300">
          ${post.title!}
        </h2>
        <!-- 封面内容 -->
        <div class=" text-white">
          <div class="text-center">
            <span class="iconfont icon-people "></span> ${user.nickname!}
            <span class="iconfont icon-see2 ml-3"></span> ${post.visits}
            <span class="iconfont icon-time ml-3"></span> ${post.createTime?string("yyyy-MM-dd")}
          </div>
        </div>
      </div>
    </header>
    <div class="article-content fade-up">
      <div class="mx-auto bg-white dark:bg-gray-800 rounded-md px-10 py-10 md-content mt-8 max-w-4xl tracking-wider md:leading-relaxed sm:leading-normal heti text-gray-800 dark:text-gray-300"
           id="lightGallery">
        ${post.content!}
        <hr class="bg-gray-100 dark:bg-gray-700 ">
        <p class="flex flex-row justify-start flex-wrap">
          <#if post.tags?? && post.tags?size gt 0>
            <#list post.tags as tag>
              <a href="${tag.fullPath!}"
                 class="bg-gray-200 hover:shadow-md hover:text-white hover:bg-red-400 dark:bg-gray-600 dark:text-gray-300 dark:hover:bg-red-400 dark:hover:shadow-md dark:hover:text-white mt-2 mb-2 mr-2 block py-0 px-4 rounded leading-10 h-10 text-gray-800 no-underline "
                 style="text-decoration: none !important; box-shadow: none !important;">
                #&nbsp;${tag.name!}
              </a>
            </#list>
          </#if>
        </p>
      </div>
      <div id="tocFlag"></div>
      <#if settings.post_toc!true>
        <aside id="toc" class="toc"></aside>
      </#if>
    </div>

    <div class="mx-auto md-content mt-8 text-center max-w-4xl tracking-wider md:leading-relaxed sm:leading-normal">
      <#include "module/widget/sponsor.ftl">
      <div class="inline-block text-center my-4  " >
        <span role="button" class="iconfont icon-heart text-white relative inline-block bg-red-600 hover:bg-red-500 rounded-full py-3 z-50 w-28 h-full cursor-pointer like-btn" 
             style="font-size: 1.5rem; line-height: 1.7rem;padding-top: 15px;"
             data-path="${blog_url!}/api/content/posts/${post.id}/likes"
             data-count="${post.likes}"
        >
        </span>
      </div>
      <hr class="bg-gray-100 dark:bg-gray-700 ">
    </div>

    <!-- 上一篇和下一篇 -->
    <#if settings.post_nepre!true>
      <div class="mx-4 md:mx-auto mt-8 max-w-4xl tracking-wider md:leading-relaxed sm:leading-normal">
        <#include "module/widget/prev_next_page.ftl">
      </div>
    </#if>

    <div class="mx-4 md:mx-auto md-content mt-8 max-w-4xl tracking-wider md:leading-relaxed sm:leading-normal">

      <#if !post.disallowComment!false>
        <#include "module/comment.ftl">
        <@comment post,"post" />
      </#if>
    </div>
  </main>
</@layout>



