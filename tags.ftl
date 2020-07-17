<#include "module/macro.ftl">
<@layout title="标签列表 | ${options.blog_title!} " keywords="${options.seo_keywords!}" description="${options.seo_description!}">
    <main class="mx-auto" id="container">
        <header class="bg-cover post-cover">
            <#if settings.tag_patternimg?? && settings.tag_patternimg!=''>
                <div class="cover-bg">
                    <img src="${settings.tag_patternimg!}" class="z-auto"
                         alt="${settings.tags_title! 'Tags'}">
                </div>
            <#else>
                <div class="placeholder-bg">
                </div>
            </#if>
            <div class="cover-content flex justify-center">
                <!-- 封面内容 -->
                <div class="inner flex flex-col justify-center">
                    <p class="cover-title text-base md:text-4xl lg:text-4xl xl:text-5xl">${settings.tags_title! 'Tags'}</p>
                </div>
            </div>
        </header>
        <div class="container mx-auto px-4 mt-16 max-w-6xl tracking-wider md:leading-relaxed sm:leading-normal ct-container cn-pd">
            <@tagTag method="list">
                <#if tags?? && tags?size gt 0>
                    <#list tags as tag>
                        <a href="${tag.fullPath}" class="ah-hf ah-hv">
                            <span class="ah-dt ct-f-size op-10"># ${tag.name}</span>
                            <span class="ah-tt h-6 op-06"></span>
                        </a>
                    </#list>
                </#if>
            </@tagTag>
        </div>
    </main>
</@layout>
