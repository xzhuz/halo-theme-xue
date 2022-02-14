<#include "module/macro.ftl">
<@layout title="${settings.categories_title! 'Categories'} | ${options.blog_title!}">
  <main class="mx-auto" id="container">
    <header class="bg-cover post-cover table relative w-full opacity-95">
        <#if settings.categories_patternimg?? && settings.categories_patternimg!=''>
          <div class="cover-bg bottom-0 left-0 right-0 top-0 opacity-30 absolute">
            <img src="${settings.categories_patternimg!}" class="z-auto"
                 alt="${settings.categories_title! '分类列表'}">
          </div>
        <#else>
          <div class="placeholder-bg">
          </div>
        </#if>
      <div class="cover-content table-cell relative w-full index flex justify-center">
        <!-- 封面内容 -->
        <div class="inner flex flex-col justify-center pt-40 pb-40">
          <p class="cover-title text-white mb-5 mt-4 leading-loose relative w-full text-left text-4xl">${settings.categories_title! '分类列表'}</p>
        </div>
      </div>
    </header>
    <div
      class="mx-auto px-10 mt-16 max-w-6xl tracking-wider md:leading-relaxed sm:leading-normal ct-container cn-pd content-container">
      <h2>分类</h2>
      <p class="flex flex-row justify-start flex-wrap">
          <@categoryTag method="list">
              <#if categories?? && categories?size gt 0>
                  <#list categories as category>
                    <a href="${category.fullPath}" class="post-tag mt-2 mb-2 mr-2">
                        ${category.name} <span class="tag-length">${category.postCount!}</span>
                    </a>
                  </#list>
              </#if>
          </@categoryTag>
      </p>
      <h2 style="margin-bottom: 0;">云</h2>
      <div id="categoryCloud" class="card-content jqcloud jqcloud-hg"></div>
    </div>
  </main>
</@layout>
