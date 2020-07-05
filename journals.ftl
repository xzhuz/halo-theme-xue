<#include "module/macro.ftl">
<@layout title="${blog_title!} | ${settings.jounarls_title!'Journals'} " keywords="${options.seo_keywords!}" description="${options.seo_description!}">
    <main class="mx-auto">
        <header class="bg-cover post-cover">
            <#if settings.journals_patternimg?? && settings.journals_patternimg!=''>
                <div class="w-screen cover-bg">
                    <img src="${settings.journals_patternimg!}" class="z-auto"
                         alt="${settings.jounarls_title! 'Journals'}">
                </div>
            <#else>
                <div class="placeholder-bg">
                </div>
            </#if>
            <div class="cover-content">
                <!-- 封面内容 -->
                <div class="inner flex flex-col justify-center">
                    <h2 class="slogan text-center">${settings.jounarls_title! 'Journals'}</h2>
                </div>
            </div>
        </header>
        <div class="container mx-auto px-4 mt-16 max-w-6xl tracking-wider md:leading-relaxed sm:leading-normal ct-container cn-pd">
            <div id="tree-hole">
                <ol class="comment-list">
                    <#list journals.content as journal>
                        <li id="li-comment-611"
                            class="tree-hole-body tree-hole-<#if (journal_index % 2)==0>odd<#else>even</#if>">
                            <div id="comment-611">
                                <img class="avatar" src="${user.avatar!}" alt="${user.nickname!}" width="40"
                                     height="40">
                                <div class="tree-hole-box">
                                    <div class="tree-hole-author">
                                        <a href="${blog_url!}" data-ajax
                                           rel="external nofollow">${user.nickname}</a> ${journal.createTime?string('yyyy年MM月dd日')}
                                    </div>
                                    <p>${journal.content!}</p>
                                </div>
                            </div>
                        </li>
                    </#list>
                </ol>
                <div class="tree-hole-go">
                    <span class="tree-hole-go-aircraft"><i class="fa fa-paper-plane fa-lg"></i></span><br>
                </div>
                <div class="comment-page">
                    <#if journals.totalPages gt 1>
                        <@paginationTag method="journals" page="${journals.number}" total="${journals.totalPages}" display="3">
                            <ol class="page-navigator">
                                <#if pagination.hasPrev>
                                    <li class="prev">
                                        <a href="${pagination.prevPageFullPath!}" data-ajax>
                                            <i class="fa fa-angle-left fa-lg"></i>
                                        </a>
                                    </li>
                                </#if>
                                <#list pagination.rainbowPages as number>
                                    <#if number.isCurrent>
                                        <li class="current"><a href="${number.fullPath!}" data-ajax>${number.page!}</a>
                                        </li>
                                    <#else>
                                        <li><a class="" href="${number.fullPath!}" data-ajax>${number.page!}</a></li>
                                    </#if>
                                </#list>
                                <#if pagination.hasNext>
                                    <li class="next">
                                        <a href="${pagination.nextPageFullPath!}" data-ajax>
                                            <i class="fa fa-angle-right fa-lg"></i>
                                        </a>
                                    </li>
                                </#if>
                            </ol>
                        </@paginationTag>
                    </#if>
                </div>
            </div>
        </div>
    </main>
</@layout>