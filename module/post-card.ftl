<#list posts.content as post>
    <div class="post-card m-auto mt-4">
        <#if post.topPriority gt 0>
            <div class="post-top">
                <div>置顶</div>
            </div>
        </#if>
        <header class="card-header card-img">
            <#if post.thumbnail?? && post.thumbnail!=''>
                <a href="${post.fullPath!}" rel="nofollow">
                    <img class="lazyloaded" src="${post.thumbnail}"
                         alt="${post.title}">
                </a>
            <#elseif settings.card_random_cover!false>
                <#assign x = "${settings.card_random_cover_img_num?number}" />
                <#assign thumbnailIndex ="${post_index % (x?number)}"/>
                <a href="${post.fullPath!}" rel="nofollow">
                    <img class="lazyloaded"
                         src="${blog_url!}/thumbnail/thumbnail-${thumbnailIndex?number?abs}.${settings.card_random_cover_img_suffix}"
                         alt="${post.title}">
                </a>
            <#else>
                <a href="${post.fullPath!}" rel="nofollow">
                    <img class="lazyloaded" src="${post.thumbnail}"
                         alt="${post.title}">
                </a>
            </#if>
        </header>
        <div class="card-body">
            <header class="body-header">
                <#if post.topPriority gt 0>
                    <div class="body-category-2"><a href="javascript:void(0)"
                                                    rel="category tag">置顶</a>
                    </div>
                </#if>
                <p class="body-title"><a href="${post.fullPath!}" rel="bookmark"
                                         class="font-bold text-gray-700 post-title">${post.title}</a>
                </p>
            </header>
            <div class="post-excerpt text-sm tracking-wider">
                <p>${post.summary!}</p>
            </div>
        </div>
        <footer class="card-footer svg-f">
                                <span class="cst-icon icon-calendar lh-25 f-10"
                                      style="margin-right: 5px"></span>
            <span class="post-time lh-25 mr-auto">
                                        <span class="published"
                                              datetime="${post.createTime?string("yyyy-MM-dd")}">${post.createTime?string("yyyy-MM-dd")}</span>
                                    </span>
            <div class="lh-25">
                                    <span class="visitors-count">
                                        <span>${post.visits!}</span>
                                        <a href="javascript:void(0)" class="eye-sight">
                                            <span class="iconfont icon-Eyesight"> </span>
                                        </a>
                                    </span>
                <span class="visitors-comment">
                                        <span>${post.commentCount}</span> <span
                            class="iconfont icon-comment"> </span>
                                    </span>
            </div>
        </footer>
    </div>
</#list>