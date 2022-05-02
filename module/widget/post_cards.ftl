<div class="posts grid lg:grid-cols-3 md:grid-cols-2 sm:grid-cols-2 xs:grid-cols-1 lg:gap-6 md:gap-4 sm:gap-3 mt-4 pagination-container"
     id="pageContainer">
  <#if posts?? && posts.getTotalElements() gt 0>
    <#list posts.content as post>
      <div class="relative flex flex-col slide-up overflow-hidden rounded-lg w-full bg-base-100 shadow-xl mt-4">
        <#if post.topPriority gt 0>
          <div class="post-top w-24 h-24 overflow-hidden absolute">
            <div class="shadow-lg text-center transform -rotate-45 relative py-1 px-0 top-3 -left-8 w-28 bg-red-600 text-gray-100">
              置顶
            </div>
          </div>
        </#if>
        <figure class="flex items-center justify-center h-56 cursor-pointer">
          <a href="${post.fullPath!}" class="w-full">
            <#if post.thumbnail?? && post.thumbnail!=''>
              <img class="lazyload object-cover w-full h-56 no-zoom"
                   src="${theme_base!}/source/images/loading.gif"
                   data-src="${post.thumbnail!''}" alt="${post.title}"/>
            <#elseif settings.card_random_cover_list?? && settings.card_random_cover_list != ''>
              <img class="object-cover w-full h-56 img-random no-zoom"
                   index="${post_index}"
                   src="${theme_base!}/source/images/loading.gif"
                   alt="${post.title!}"
              />
            <#else>
              <span class="full-image placeholder-bg w-full h-56" role="img" aria-label=""></span>
            </#if>
          </a>
        </figure>
        <div class="flex flex-col gap-2 px-4 py-6 bg-white dark:bg-gray-800" style="flex: 1 1 auto; ">
          <#if settings.post_card_tag!false>
            <div class="text-sm h-5 overflow-hidden">
              <#if post.tags?size gt 0>
                <#list post.tags as tag>
<#--                  <#if tag_index &lt; 1>-->
                    <a href="${tag.fullPath!}" class="relative inline-block badge">
                      <i class="bg-red-400 opacity-10 absolute top-0 left-0 w-full h-full" style="background-color: ${tag.color!'rgba(248,113,113,1)'}"></i>
                      <span class="badge-outline text-red-400 h-5 px-2 py-0.5 rounded-sm cursor-pointer"
                            style="color: ${tag.color!'rgba(248,113,113,1)'}"
                            data-value="${tag.name}">
                        ${tag.name}
                      </span>
                    </a>
<#--                  </#if>-->
                </#list>
              </#if>
            </div>
          </#if>
          <h2 class="flex items-center gap-2 text-xl leading-7 <#if settings.post_card_tag>mb-2 mt-3 <#else> my-4 </#if>">
            <a href="${post.fullPath!}" class="text-gray-800 dark:text-gray-300">${post.title!}</a>
          </h2>
          <#if settings.post_card_meta_info!false>
            <div class="grad grid-cols-2 text-sm">
              <div class="inline-block text-gray-500">
                <span>${post.createTime?string("yyyy-MM-dd")}</span>
              </div>
              <div class="inline-block float-right">
                <span class="iconfont icon-see2 text-gray-500">
                  <label>${post.visits}</label>
                </span>
                <span class="iconfont icon-uqur text-gray-500">
                   <label>${post.commentCount}</label>
                </span>
                <span class="iconfont icon-like text-gray-500">
                  <label>${post.likes}</label>
                </span>
              </div>
            </div>
          </#if>
        </div>
      </div>
    </#list>
  </#if>
</div>