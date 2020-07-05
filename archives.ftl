<#include "module/macro.ftl">
<@layout title="归档 | ${options.blog_title!} " keywords="${options.seo_keywords!}" description="${options.seo_description!}">
    <main class="mx-auto">
        <header class="bg-cover post-cover">
            <#if settings.archives_patternimg?? && settings.archives_patternimg!=''>
                <div class="w-screen cover-bg">
                    <img src="${settings.archives_patternimg!}" class="z-auto"
                         alt="${settings.achieve_title!'Achieves'}">
                </div>
            <#else>
                <div class="placeholder-bg">
                </div>
            </#if>
            <div class="cover-content">
                <!-- 封面内容 -->
                <div class="inner flex flex-col justify-center">
                    <h2 class="slogan text-center">${settings.achieve_title!'Achieves'}</h2>
                </div>
            </div>
        </header>
        <div class="container mx-auto px-4 mt-16 max-w-6xl tracking-wider md:leading-relaxed sm:leading-normal ct-container cn-pd">
            <@postTag method="archiveMonth">
                <#list archives as archive>
                    <section class="arch-year">
                        <h1 class="year-title bg-fff relative">${archive.year?c}</h1>
                        <div class="relative pl-12">
                            <header class="absolute mh-hd bg-fff af-bg-fff mh-bg "> ${archive.month!} 月</header>
                            <span class="">
                            <#list archive.posts?sort_by("createTime")?reverse as post>
                                <a class="ah-hf ah-hv" href="${post.fullPath!}">
                                    <span class="ah-dt">${post.createTime?string('MM-dd')}</span>
                                    <span class="ah-tt">${post.title!}</span>
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
