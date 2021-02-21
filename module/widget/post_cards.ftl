<div class="posts grid lg:grid-cols-3 md:grid-cols-2 sm:grid-cols-2 xs:grid-cols-1 lg:gap-6 md:gap-4 sm:gap-3 mt-4">
    <#if posts?? && posts.getTotalElements() gt 0>
        <#list posts.content as post>
            <div class="post-card m-auto mt-4">
                <#if post.topPriority gt 0>
                    <div class="post-top">
                        <div>置顶</div>
                    </div>
                </#if>
                <header class="card-header card-img">
                    <#if post.thumbnail?? && post.thumbnail!=''>
                        <a href="${post.fullPath!}"
                           class="img-cover-bg lazyload-link">
                            <img class="lazyload img-cover img-200" src="${theme_base!}/source/images/loading.svg" data-src="${post.thumbnail!''}" alt="${post.title}" />
                        </a>
                    <#elseif settings.card_random_cover_list?? && settings.card_random_cover_list != ''>
                        <a href="${post.fullPath!}" class="img-cover-bg lazyload-link">
                            <img class="img-cover img-200 img-random" index="${post_index}" src="${theme_base!}/source/images/loading.svg" data-src="" alt="${post.title!}" />
                        </a>
                    <#else>
                        <a data-ajax href="${post.fullPath!}" class="img-cover img-200 no-thumb">
                            <span class="full-image  placeholder-bg" role="img" aria-label=""></span>
                        </a>
                    </#if>
                </header>
                <div class="card-body">
                    <p class="text-center text-xl tracking-wider svg-f text-clamp-1">
                        <a href="${post.fullPath!}" class="font-medium text-gray-700 post-title">
                            ${post.title!}
                        </a>
                    </p>
                    <#if settings.card_hover_summary!false>
                        <p class="post-excerpt text-sm tracking-wider text-clamp-3 font-sans">
                            ${post.summary!}
                        </p>
                    </#if>
                </div>
                <footer class="card-footer svg-f">
                    <span class="iconfont icon-calendar lh-25 f-10"
                          style="margin-right: 5px"></span>
                    <span class="post-time lh-25 mr-auto">
                        <span class="published">${post.createTime?string("yyyy-MM-dd")}</span>
                    </span>
                    <div class="lh-25">
                        <span class="visitors-count">
                            <span>${post.visits!}</span>
                            <a href="javascript:void(0)" class="eye-sight">
                                <span class="iconfont icon-Eyesight"> </span>
                            </a>
                        </span>
                        <span class="visitors-comment">
                            <span>${post.commentCount}</span>
                            <span class="iconfont icon-comment"> </span>
                        </span>
                    </div>
                </footer>
            </div>
        </#list>
    </#if>
</div>