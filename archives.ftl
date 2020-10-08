<#include "module/macro.ftl">
<@layout title="${settings.achieve_title!'归档'} | ${options.blog_title!} " keywords="${options.seo_keywords!}" description="${options.seo_description!}">
    <main class="mx-auto" id="container">
        <header class="bg-cover post-cover">
            <#if settings.archives_patternimg?? && settings.archives_patternimg!=''>
                <div class="cover-bg">
                    <img src="${settings.archives_patternimg!}" class="z-auto"
                         alt="${settings.achieve_title!'归档'}">
                </div>
            <#else>
                <div class="placeholder-bg">
                </div>
            </#if>
            <div class="cover-content flex justify-center">
                <!-- 封面内容 -->
                <div class="inner flex flex-col justify-center">
                    <p class="cover-title text-base md:text-4xl lg:text-4xl xl:text-5xl">${settings.achieve_title!'归档'}</p>
                </div>
            </div>
        </header>
        <div class="container mx-auto px-4 mt-16 max-w-6xl tracking-wider md:leading-relaxed sm:leading-normal ct-container cn-pd content-container"
             id="pageContainer">
            <#list archives as archive>
                <section class="arch-year">
                    <h1 class="year-title relative">${archive.year?c}</h1>
                    <div class="relative pl-12">
                        <#assign month="">
                        <#-- 年份归档后又进行月份归档 -->
                        <#list archive.posts?sort_by("createTime")?reverse as post>
                        <#--需要判断当前月份是否和上一个月份相等-->
                            <#if post.createTime?string('MM') != month>
                                <header class="absolute mh-hd af-bg-fff mh-bg "> ${post.createTime?string('MM')!}
                                    月
                                </header>
                                <#assign month="${post.createTime?string('MM')}">
                            </#if>
                            <a class="ah-hf ah-hv" href="${post.fullPath!}">
                                <span class="ah-dt">${post.createTime?string('MM-dd')}</span>
                                <span class="ah-tt">${post.title!}</span>
                            </a>
                        </#list>
                    </div>
                </section>
            </#list>
            <#if posts.totalPages gt 1>
            <#-- 分页-->
                <nav class="pagination flex flex-row justify-center mt-8" role="navigation"
                     aria-label="pagination">
                    <@paginationTag method="archives" page="${posts.number}" total="${posts.totalPages}" display="3">
                        <#include "module/widget/pagination.ftl">
                    </@paginationTag>
                </nav>
            </#if>
        </div>
    </main>
</@layout>
