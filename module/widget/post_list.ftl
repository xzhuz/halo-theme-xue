<div class="posts mt-4 pagination-container" id="pageContainer">
    <#if posts?? && posts.getTotalElements() gt 0>
        <ul class="posts-list">
            <#list posts.content as post>
                <li class="post">
                    <div class="post-time-img">
                        <div class="post-date">
                            ${post.createTime?string("dd")}
                            <span>${post.createTime?string("yyyy年MM月")}</span>
                        </div>
                        <div class="post-preview">
                            <#if post.thumbnail?? && post.thumbnail!=''>
                                <a href="${post.fullPath!}">
                                    <img class="lazyload" src="${theme_base!}/source/images/loading.svg" data-src="${post.thumbnail}" alt="${post.title}"/>
                                </a>
                            <#elseif settings.card_random_cover_list?? && settings.card_random_cover_list != ''>
                                <a href="${post.fullPath!}">
                                    <img class="img-random" src="${theme_base!}/source/images/loading.svg" data-src="" index="${post_index}" alt="${post.title}"/>
                                </a>
                            </#if>
                        </div>
                    </div>
                    <div class="post-content <#if post.categories?? && post.categories?size gt 0>has-category</#if> ">
                        <#if post.categories?? && post.categories?size gt 0>
                            <div class="post-meta">
                                <#list post.categories as category>
                                    <span class="post-categories">#${category.name!} </span>
                                </#list>
                            </div>
                        <#else>
                            <span class="post-mobile-date">${post.createTime?string("yyyy年MM月dd日")}</span>
                        </#if>

                        <h2>
                            <a href="${post.fullPath!}" rel="bookmark">
                                <#if post.topPriority gt 0>
                                    <i class="iconfont icon-zhiding zhiding"></i>
                                </#if>
                                ${post.title}
                            </a>
                        </h2>
                        <p>${post.summary!}</p>
                        <a class="post-more-link" href="${post.fullPath!}">
                            <span class="text">查看全文</span>
                        </a>
                    </div>
                </li>
            </#list>
        </ul>
    </#if>
</div>
