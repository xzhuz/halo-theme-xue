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
               class="h-full w-full left-0 object-cover absolute top-0 img-random dark:filter-60 no-zoom"
               alt="${post.title}"/>
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
        <div class="flex flex-row justify-between flex-wrap">
          <div class="tag-list leading-9">
            <#if post.tags?? && post.tags?size gt 0>
              <#list post.tags as tag>
                <a href="${tag.fullPath!}" class="relative inline-block badge shadow-none mr-1 post-tag mb-2"
                   style="box-shadow: none !important;">
                  <i class="bg-red-400 opacity-10 hover:opacity-20 absolute top-0 left-0 w-full h-full"
                     style="background-color: ${tag.color!'rgba(248,113,113,1)'}"></i>
                  <span class="badge-outline text-red-400 h-5 px-2 py-0.5 rounded-sm cursor-pointer"
                        style="color: ${tag.color!'rgba(248,113,113,1)'}"
                        data-value="${tag.name}">
                        ${tag.name}
                      </span>
                </a>
              </#list>
            </#if>
          </div>
          <#if settings.allow_share!true>
            <div class="share-items">
              <a class="share-link" href="javascript:;" data-clipboard-text="${blog_url!}${post.fullPath!}"
                 rel="noopener noreferrer" title="复制文章链接">
                <span class="iconfont icon-round_link_fill text-3xl"></span>
              </a>
              <a class="share-item" href="http://service.weibo.com/share/share.php?sharesource=weibo&title=分享：${post.title!}，原文链接：{url}&pic=${post.thumbnail!}"
                 target="_blank" rel="noopener noreferrer" title="分享到新浪微博">
                <span class="iconfont icon-xinlang text-3xl" style="color:rgb(245, 100, 103);"></span>
              </a>
              <a class="share-item" href="https://sns.qzone.qq.com/cgi-bin/qzshare/cgi_qzshare_onekey?url={url}&sharesource=qzone&title=${post.title!}&pics=${post.thumbnail!}"
                 target="_blank" rel="noopener noreferrer" title="分享到QQ空间">
                <span class="iconfont icon-Qzone text-3xl" style="color: rgb(245, 190, 63);"></span>
              </a>
              <a class="share-item" href="https://connect.qq.com/widget/shareqq/index.html?url={url}&title=${post.title!}&pics=${post.thumbnail!}"
                 target="_blank" rel="noopener noreferrer" title="分享到QQ">
                <span class="iconfont icon-QQ text-3xl" style=" color: rgb(104, 165, 225);"></span>
              </a>
            </div>
          </#if>
        </div>
      </div>
      <div id="tocFlag"></div>
      <#if settings.post_toc!true>
        <aside id="toc" class="toc"></aside>
      </#if>
    </div>

    <div class="mx-auto md-content mt-8 text-center max-w-4xl tracking-wider md:leading-relaxed sm:leading-normal">
      <#include "module/widget/sponsor.ftl">
      <div class="inline-block text-center my-4  ">
        <span role="button"
              class="iconfont icon-heart text-white relative inline-block bg-red-600 hover:bg-red-500 rounded-full py-3 z-50 w-28 h-full cursor-pointer like-btn"
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



