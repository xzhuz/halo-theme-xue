<ul class="posts-list">
    <#list posts.content as post>
        <li class="post">
            <div class="post-time-img">
                <div class="post-date">
                    ${post.createTime?string("dd")}
                    <span>${post.createTime?string("yyyy年MM月")}</span>
                </div>
                <div class="post-preview">
                    <a href="${post.fullPath!}">
                        <img src="${post.thumbnail}" alt="${post.title}"/>
                    </a>
                </div>
            </div>
            <div class="post-content">
                <h2>
                    <a href="${post.fullPath!}" rel="bookmark"><#if post.topPriority gt 0>🔝</#if> ${post.title}</a>
                </h2>
                <div class="post-meta">
                    <#if post.categories?? && post.categories?size gt 0>
                        <span class="post-category">
                            <#list post.categories as category>
                                <a href="${category.fullPath!}"
                                   rel="category tag">${category.name!}</a>
                            </#list>
                        </span>
                    </#if>
                    <span class="post-mobile-date">${post.createTime?string("yyyy年MM月dd日")}</span>
                </div>
                <p>${post.summary!}</p>
            </div>
        </li>
    </#list>
</ul>