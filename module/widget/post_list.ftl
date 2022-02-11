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
          </div>
          <div class="post-content ">
            <h2>
              <a href="${post.fullPath!}" rel="bookmark">
                <#if post.topPriority gt 0>
                  <i class="iconfont icon-zhiding zhiding"></i>
                </#if>
                ${post.title}
              </a>
            </h2>
            <p>${post.summary!}</p>
            <div class="post-meta flex flex-wrap items-center	mt-2">
              <#if post.categories?? && post.categories?size gt 0>
                  <#list post.categories as category>
                    <a class="post-categories light_link" href="${category.fullPath!}"><span class="iconfont icon-tag2" style="font-size:12px"></span> ${category.name!} · </a> 
                  </#list>
              </#if>
              <a class="post-more-link" href="${post.fullPath!}">
                <span class="text">查看全文</span>
              </a>
            </div>
           
          </div>
        </li>
      </#list>
    </ul>
  </#if>
</div>
