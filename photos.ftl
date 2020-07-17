<#include "module/macro.ftl">
<@layout title="相册 | ${options.blog_title!}" keywords="${options.seo_keywords!}" description="${options.seo_description!}">
    <main class="mx-auto" id="container">
        <header class="bg-cover post-cover">
            <#if settings.photos_patternimg?? && settings.photos_patternimg!=''>
                <div class="cover-bg">
                    <img src="${settings.photos_patternimg!}" class="z-auto"
                         alt="${settings.photos_title!'Photos'}">
                </div>
            <#else>
                <div class="placeholder-bg">
                </div>
            </#if>
            <div class="cover-content flex justify-center">
                <!-- 封面内容 -->
                <div class="inner flex flex-col justify-center">
                    <p class="cover-title text-base md:text-4xl lg:text-4xl xl:text-5xl">${settings.photos_title!'Photos'}</p>
                </div>
            </div>
        </header>
        <div class="container mx-auto px-4 mt-16 max-w-6xl tracking-wider md:leading-relaxed sm:leading-normal ph-container cn-pd photos-page" >
            <div class="photos-box article-content" id="gallery-content">
                <@photoTag method="listTeams">
                    <#list teams as item>
                        <#if item.team?? && item.team!=''>
                            <h3 class="w-full m-4">${item.team}</h3>
                        </#if>
                        <div class="justified-gallery">
                            <#list item.photos as photo>
                                <a class="gallery-item jg-entry entry-visible"
                                   href="javascript:void(0)">
                                    <img src="${photo.url!}" data-src="${photo.url!}" alt="${photo.name!}"/>
                                    <p class="has-text-centered is-size-6 caption">${photo.name}</p>
                                </a>
                            </#list>
                        </div>
                    </#list>
                </@photoTag>
            </div>
        </div>
    </main>
</@layout>
