<div class="posts pagination-container" id="pageContainer">
  <#if posts?? && posts.getTotalElements() gt 0>
    <ul class="posts-list pl-0">
      <#list posts.content as post>
        <li class="post list-none relative w-full pt-4 pb-2 mt-0 inline-block">
          <div class="post-time-img overflow-hidden float-left relative mt-2 flex-shrink-0">
            <div class="post-date text-7xl font-bold w-full h-full text-center pt-5 flex flex-col items-center justify-center uppercase">
              ${post.createTime?string("dd")}
              <span class="font-medium text-base block mt-3 uppercase">${post.createTime?string("yyyy年MM月")}</span>
            </div>
          </div>
          <div class="post-content pt-2 float-left ml-3">
            <h2 class="text-2xl mb-1 mt-0 font-bold relative pb-3">
              <a href="${post.fullPath!}" rel="bookmark">
                <#if post.topPriority gt 0>
                  <i class="iconfont icon-zhiding zhiding"></i>
                </#if>
                ${post.title}
              </a>
            </h2>
            <p class="leading-normal break-all overflow-hidden overflow-ellipsis m-0">${post.summary!}</p>
            <div class="post-meta flex flex-wrap items-center	mt-2 h-5 items-center mb-1">
              <#if post.categories?? && post.categories?size gt 0>
                  <#list post.categories as category>
                    <a class="post-categories light_link text-sm mr-1" href="${category.fullPath!}"><span class="iconfont icon-tag2" style="font-size:12px"></span> ${category.name!} · </a> 
                  </#list>
              </#if>
              <a class="post-more-link inline-block h-auto " href="${post.fullPath!}">
                <span class="text text-sm inline-block overflow-hidden m-0 font-bold uppercase tracking-wide leading-5 align-middle">查看全文</span>
              </a>
            </div>
           
          </div>
        </li>
      </#list>
    </ul>
  </#if>
</div>
