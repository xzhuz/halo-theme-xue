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
            <@postTag method="archiveMonth">
                <#assign year="">
                <#list archives as archive>
                    <section class="arch-year">
                         <#if archive.year?c != year>
                            <h1 class="year-title bg-fff relative">${archive.year?c}</h1>
                            <#assign year="${archive.year?c}">
                         </#if>   
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
