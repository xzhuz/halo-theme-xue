<#include "module/macro.ftl">
<@layout title="${blog_title!} | ${settings.jounarls_title!'Journals'} " keywords="${options.seo_keywords!}" description="${options.seo_description!}">
    <main class="mx-auto" id="container">
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
            <div class="cover-content flex justify-center">
                <!-- 封面内容 -->
                <div class="inner flex flex-col justify-center">
                    <p class="cover-title text-base md:text-4xl lg:text-4xl xl:text-5xl">${settings.jounarls_title! 'Journals'}</p>
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
                                        <a href="${blog_url!}"
                                           rel="external nofollow">${user.nickname}</a> ${journal.createTime?string('yyyy年MM月dd日')}
                                    </div>
                                    <p>${journal.content!}</p>
                                </div>
                            </div>
                        </li>
                    </#list>
                </ol>
                <#--                <div class="tree-hole-go">-->
                <#--                    <span class="tree-hole-go-aircraft"><i class="fa fa-paper-plane fa-lg"></i></span><br>-->
                <#--                </div>-->
                <nav class="pagination flex flex-row justify-center mt-8" role="navigation" aria-label="pagination">
                    <#if journals.totalPages gt 1>
                        <@paginationTag method="journals" page="${journals.number}" total="${journals.totalPages}" display="3">
                            <ul class="pagination-list flex flex-row ">
                                <li class="pagination-previous<#if pagination.hasPrev><#else > is-invisible </#if>">
                                    <a class="pagination-circle " href="${pagination.prevPageFullPath!}">
                                        <#--            <#include "icon/arrow-left.ftl">-->
                                        <span class="cst-icon icon-previous"> </span>
                                    </a>
                                </li>
                                <#list pagination.rainbowPages as number>
                                    <#if number.isCurrent>
                                        <li>
                                            <a class="pagination-circle is-current"
                                               href="${number.fullPath!}">${number.page!}</a>
                                        </li>
                                    <#else>
                                        <li>
                                            <a class="pagination-circle" href="${number.fullPath!}">${number.page!}</a>
                                        </li>
                                    </#if>
                                </#list>
                                <li class="pagination-next<#if pagination.hasNext><#else > is-invisible </#if>">
                                    <a class="pagination-circle" href="${pagination.nextPageFullPath!}">
                                        <#--            <#include "icon/arrow-right.ftl">-->
                                        <span class="cst-icon icon-next"> </span>
                                    </a>
                                </li>
                            </ul>
                        </@paginationTag>
                    </#if>
                </nav>
            </div>
        </div>
    </main>
</@layout>