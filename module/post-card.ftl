<#list posts.content as post>
    <a href="${post.fullPath!}" class="PostItem">
        <div>
            <img src="${post.thumbnail}" class="PostItem-TitleImage" alt="${post.title}" />
            <h1 class="PostItem-Title">${post.title}</h1>
            <div class="PostItem-Footer">
                <span>${post.createTime?string("yyyy-MM-dd")}</span>
<#--                <span class="PostItem-FooterTitle">发表于笔译ＭＴＩ...</span>-->
            </div>
        </div>
    </a>












<#--    <div class="post mt-4 <#if post_index % 7 == 0>global_feature_list cover</#if>"-->
<#--         <#if post_index % 7 == 0>style="background-image: url(${post.thumbnail});"</#if>-->
<#--    >-->
<#--        <#if post.topPriority gt 0>-->
<#--            <div class="post-top">-->
<#--                <div>置顶</div>-->
<#--            </div>-->
<#--        </#if>-->
<#--        <header class="entry-media">-->
<#--            <#if post_index % 7 == 0>-->

<#--            <#else>-->
<#--                <#if post.thumbnail?? && post.thumbnail!=''>-->
<#--                    <a href="${post.fullPath!}" rel="nofollow">-->
<#--                        <img class="lazyloaded" src="${post.thumbnail}" alt="${post.title}"/>-->
<#--                    </a>-->
<#--                <#elseif settings.card_random_cover!false>-->
<#--                    <#assign x = "${settings.card_random_cover_img_num?number}" />-->
<#--                    <#assign thumbnailIndex ="${post_index % (x?number)}"/>-->
<#--                    <a href="${post.fullPath!}" rel="nofollow">-->
<#--                        <img class="lazyloaded"-->
<#--                             src="${blog_url!}/thumbnail/thumbnail-${thumbnailIndex?number?abs}.${settings.card_random_cover_img_suffix}"-->
<#--                             alt="${post.title}">-->
<#--                    </a>-->
<#--                <#else>-->
<#--                    <a href="${post.fullPath!}" rel="nofollow">-->
<#--                        <img class="lazyloaded" src="${post.thumbnail}" alt="${post.title}"/>-->
<#--                    </a>-->
<#--                </#if>-->
<#--            </#if>-->
<#--        </header>-->
<#--        <div class="entry-wrapper">-->
<#--            <header class="entry-header">-->
<#--                <p class="entry-title"><a href="${post.fullPath!}" rel="bookmark"-->
<#--                                          class="font-bold text-gray-700 post-title">${post.title}</a>-->
<#--                </p>-->
<#--            </header>-->
<#--            <div class="entry-excerpt">-->
<#--                <p>${post.summary!}</p>-->
<#--            </div>-->
<#--        </div>-->
<#--        <div class="entry-action">-->
<#--            <div>-->
<#--                <i class="cst-icon icon-calendar"></i><span-->
<#--                        class="count">${post.createTime?string("yyyy-MM-dd")}</span>-->

<#--                <i class="iconfont icon-Eyesight"></i><span-->
<#--                        class="count">${post.visits!}</span>-->

<#--                <i class="iconfont icon-comment"></i><span class="count">${post.commentCount}</span>-->
<#--            </div>-->
<#--            <div>-->

<#--            </div>-->
<#--        </div>-->
<#--        <a class="u-permalink" href="http://autumn-pro.xintheme.cn/fenlei-d/252.html"-->
<#--           rel="nofollow"></a>-->
<#--    </div>-->
</#list>