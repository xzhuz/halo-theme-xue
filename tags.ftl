<#include "module/macro.ftl">
<@layout title="${settings.tags_title! '标签列表'} | ${options.blog_title!} ">
  <main class="mx-auto" id="container">
    <header class="bg-cover post-cover table relative w-full opacity-95">
        <#if settings.tag_patternimg?? && settings.tag_patternimg!=''>
          <div class="cover-bg bottom-0 left-0 right-0 top-0 opacity-30 absolute">
            <img src="${settings.tag_patternimg!}" class="z-auto"
                 alt="${settings.tags_title! '标签列表'}">
          </div>
        <#else>
          <div class="placeholder-bg">
          </div>
        </#if>
      <div class="cover-content table-cell relative w-full index flex justify-center">
        <!-- 封面内容 -->
        <div class="inner flex flex-col justify-center pt-40 pb-40">
          <p class="cover-title text-white mb-5 mt-4 leading-loose relative w-full text-left text-4xl">${settings.tags_title! '标签列表'}</p>
        </div>
      </div>
    </header>
    <div
      class="mx-auto px-10 mt-16 max-w-5xl tracking-wider md:leading-relaxed sm:leading-normal ct-container cn-pd fade-up cloud">
      <h2>标签</h2>
      <p class="flex flex-row justify-start flex-wrap">
          <@tagTag method="list">
              <#if tags?? && tags?size gt 0>
                  <#list tags as tag>
                    <a href="${tag.fullPath}" class="post-tag mt-2 mb-2 mr-2">
                        ${tag.name} <span class="tag-length">${tag.postCount!}</span>
                    </a>
                  </#list>
              </#if>
          </@tagTag>
      </p>
      <h2 style="margin-bottom: 0;">云</h2>
      <div id="tagCloud" class="card-content jqcloud jqcloud-hg"></div>
    </div>
  </main>
</@layout>
