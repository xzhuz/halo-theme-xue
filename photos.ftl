<#include "module/macro.ftl">
<@layout title="相册 | ${options.blog_title!}" keywords="${options.seo_keywords!}" description="${options.seo_description!}">
    <main class="mx-auto" id="container">
        <header class="bg-cover post-cover">
            <#if settings.photos_patternimg?? && settings.photos_patternimg!=''>
                <div class="cover-bg">
                    <img src="${settings.photos_patternimg!}" class="z-auto"
                         alt="${settings.photos_title!'相册'}">
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
        <div class="container mx-auto px-4 mt-16 tracking-wider md:leading-relaxed sm:leading-normal cn-pd photos-page content-container">
            <div class="photos-box article-content" id="gallery-content">
                <nav id="gallery-filter">
                    <ul>
                        <li>
                            <a href="javascript:void(0);" data-filter="*" onclick="switchGallery(this)" class="active">全部</a>
                        </li>
                        <@photoTag method="listTeams">
                            <#list teams as item>
                                <li>
                                    <a href="javascript:void(0);" onclick="switchGallery(this)"
                                       data-filter=".${((item.team)?length>0)?string((item.team),'默认')}">${((item.team)?length>0)?string((item.team),'默认')}</a>
                                </li>
                            </#list>
                        </@photoTag>
                    </ul>
                </nav>
                <nav id="grid-changer">
                    <ul>
                        <li class="col-3">
                            <a href="javascript:void(0)" class="active" onclick="switchGalleryStyle(this)">
                                <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" viewBox="0 0 30 30">
                                    <rect width="10" height="10" x="8" y="8"></rect>
                                </svg>
                            </a>
                        </li>
                        <li class="col-5">
                            <a href="javascript:void(0)" onclick="switchGalleryStyle(this)">
                                <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" viewBox="0 0 30 30">
                                    <rect width="7" height="7" x="6" y="6"></rect>
                                    <rect width="7" height="7" x="14" y="6"></rect>
                                    <rect width="7" height="7" x="6" y="14"></rect>
                                    <rect width="7" height="7" x="14" y="14"></rect>
                                </svg>
                            </a>
                        </li>
                    </ul>
                </nav>
                <div class="gallery masonry-gallery">
                    <@photoTag method="list">
                        <#list photos as photo>
                            <figure class="gallery-item col-3 ${((photo.team)?length>0)?string((photo.team),'默认')}">
                                <header class="gallery-icon">
                                    <a data-fancybox="gallery" href="javascript:void(0);">
                                        <img class="lazyload" src="${theme_base!}/source/images/loading.svg" data-src="${photo.url!}" alt="${photo.name!}"/>
                                    </a>
                                </header>
                                <figcaption class="gallery-caption">
                                    <div class="entry-summary">
                                        <h3>${photo.name}</h3>
                                        <#if photo.description?? && photo.description != "">
                                            <p>${photo.description!}</p>
                                        </#if>
                                    </div>
                                </figcaption>
                            </figure>
                        </#list>
                    </@photoTag>
                </div>
            </div>
        </div>
    </main>
</@layout>
