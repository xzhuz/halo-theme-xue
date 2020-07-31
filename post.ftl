<#include "module/macro.ftl">
<@layout title="${post.title!} | ${options.blog_title!} " keywords="${options.seo_keywords!}" description="${options.seo_description!}">
    <main class="mx-auto" id="container">
        <header class="bg-cover post-cover" id="postHeader">
            <#if post.thumbnail?? && post.thumbnail!=''>
                <div class="cover-bg">
                    <img src="${post.thumbnail!}" class="z-auto" alt="${post.title!}">
                </div>
            <#else>
                <div class="placeholder-bg">
                </div>
            </#if>
            <div class="cover-content post-cover-content flex justify-center">
                <!-- 封面内容 -->
                <div class="inner flex flex-col justify-center">
                    <p class="post-title cover-title text-base lg:text-4xl xl:text-5xl md:text-3xl">${post.title!}</p>
                    <div class="post-meta">
                        <div class="post-meta-wrap">
                            <img class="author-avatar"
                                 srcset="${user.avatar!}, ${user.avatar!} 2x"
                                 src="${user.avatar!}" alt=""/>
                            <span class="post-author">${post.visits} 次访问</span>
                            <time class="published"
                                  datetime="${post.createTime?string("yyyy-MM-dd")}">${post.createTime?string("yyyy-MM-dd")}</time>
                        </div>
                        <div class="text-center post-categories">
                            <#if post.categories?? && post.categories?size gt 0>
                                <#include "module/icon/folder.ftl">
                            </#if>
                            <#if post.categories?? && post.categories?size gt 0>

                                <#list post.categories as category>
                                    <a href="${category.fullPath!}" class="post-category">
                                        · ${category.name!}
                                    </a>
                                </#list>
                            </#if>
                        </div>
                    </div>
                </div>
            </div>
        </header>
        <div class="article-content content-container">
            <div class="container mx-auto px-4 md-content mt-8 max-w-6xl tracking-wider md:leading-relaxed sm:leading-normal ct-container cn-pd"
                 id="write">
                ${post.formatContent!}
            </div>
            <div id="tocFlag"></div>
            <#if settings.post_toc!true>
                <aside id="toc" class="toc"></aside>
            </#if>
        </div>

        <div class="container mx-auto px-4 mt-8 max-w-6xl tracking-wider md:leading-relaxed sm:leading-normal ct-container cn-pd">
            <blockquote class="post-copyright">
                <p><b>Copyright: </b> 采用 <a href="https://creativecommons.org/licenses/by/4.0/" target="_blank"
                                            rel="external nofollow">知识共享署名4.0</a> 国际许可协议进行许可</p>
                <p><b>Links: </b> <a href="${post.fullPath!}">${post.fullPath!}</a></p>
            </blockquote>
        </div>


        <div class="container mx-auto px-4 mt-8 pb-4 max-w-6xl tracking-wider md:leading-relaxed sm:leading-normal ct-container cn-pd coffee-tags">
            <#if settings.QR_code_zfb?? || settings.QR_code_wx??>
                <p class="flex flex-col justify-center pt-8 pb-8">
                    <span class="text-center block pb-2">Buy me a cup of coffee ☕.</span>
                    <button id="buyCoffee"
                            class="btn-primary rounded h-10 leading-10 w-32 mg-auto">
                        <img src="${theme_base!}/source/images/cuplogo-sm.png" style="height: 13px"/>
                        <span class="pt-1 pl-2">Coffee</span>
                    </button>
                </p>
            </#if>
            <#--            </#if>-->
            <p class="flex flex-row justify-start flex-wrap">
                <#if post.tags?? && post.tags?size gt 0>
                    <#list post.tags as tag>
                        <a href="${tag.fullPath!}" class="post-tag mt-2 mb-2 mr-2">
                            #&nbsp;${tag.name!}
                        </a>
                    </#list>
                </#if>
                <#if settings.social_share!false>
                    <span class="share-btn">
                        <#include "module/icon/share.ftl">
                    </span>
                </#if>
            </p>
            <hr class="mt-4" style="background-color: rgba(96, 125, 139, .05); size: 2px;">
            <#if settings.social_share!false>
                <div id="socialShare" class="no-show mt-4 share-area">
                    <div class="social-share" data-disabled="${settings.share_disabeld!''}"></div>
                </div>
            </#if>
        </div>

        <!-- 上一篇和下一篇 -->
        <#if settings.post_nepre!true>
            <div class="container mx-auto mt-8 pb-8 max-w-6xl grid grid-cols-2 flex flex-row justify-between  ct-container cn-pd post-navigation">
                <div class="pre-post pt-4 ">
                    <#if prevPost??>
                        <a href="${prevPost.fullPath!}" class="nav-previous">
                            <div class="nav-inside">
                                <span class="nav-before"><span class="cst-icon icon-previous"> </span></span>
                                <span class="nav-title">${prevPost.title!}</span>
                            </div>
                        </a>
                    </#if>
                </div>
                <div class="next-post pt-4 text-right">
                    <#if nextPost??>
                        <a href="${nextPost.fullPath!}" class="nav-previous">
                            <div class="nav-inside">
                                <span class="nav-title">${nextPost.title!}</span>
                                <span class="nav-before"> <span class="cst-icon icon-next"> </span></span>
                            </div>
                        </a>
                    </#if>
                </div>
            </div>
        </#if>
        <div class="container mx-auto px-4 mt-16 max-w-6xl tracking-wider md:leading-relaxed sm:leading-normal ct-container cn-pd">
            <#include "module/comment.ftl">
            <#if is_post??>
                <@comment post,"post" />
            <#elseif is_sheet??>
                <@comment sheet,"sheet" />
            </#if>
        </div>

    </main>
</@layout>
