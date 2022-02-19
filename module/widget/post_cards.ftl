<div class="posts grid lg:grid-cols-3 md:grid-cols-2 sm:grid-cols-2 xs:grid-cols-1 lg:gap-6 md:gap-4 sm:gap-3 mt-4">
  <#if posts?? && posts.getTotalElements() gt 0>
    <#list posts.content as post>
      <div class="post-card hover:shadow-xl transition-all duration-600 m-auto mt-4 rounded-2xl cursor-pointer w-auto shadow-md">
        <#if post.topPriority gt 0>
          <div class="post-top z-50 w-24 h-24 overflow-hidden absolute">
            <div class="shadow-lg text-center transform -rotate-45 relative py-1 px-0 top-3 -left-8 w-28 bg-red-600 text-gray-100">
              置顶
            </div>
          </div>
        </#if>
        <header class="card-header rounded-t-lg overflow-hidden h-48">
          <#if post.thumbnail?? && post.thumbnail!=''>
            <a href="${post.fullPath!}"
               class="img-cover-bg flex justify-center items-center h-48">
              <img class="lazyload object-cover block relative h-48" src="${theme_base!}/source/images/loading.svg"
                   data-src="${post.thumbnail!''}" alt="${post.title}"/>
            </a>
          <#elseif settings.card_random_cover_list?? && settings.card_random_cover_list != ''>
            <a href="${post.fullPath!}" class="img-cover-bg flex justify-center items-center h-48">
              <img class="object-cover block relative h-48 img-random" index="${post_index}"
                   src="${theme_base!}/source/images/loading.svg" data-src="" alt="${post.title!}"/>
            </a>
          <#else>
            <a data-ajax href="${post.fullPath!}"
               class="object-cover block relative h-48 block relative overflow-hidden ">
              <span class="full-image placeholder-bg" role="img" aria-label=""></span>
            </a>
          </#if>
        </header>
        <div class=" flex-auto py-1 px-2">
          <p class="text-center text-xl tracking-wider svg-f line-clamp-1">
            <a href="${post.fullPath!}"
               class="font-medium text-gray-700 hover:text-red-600 transition-all duration-600 text-left">
              ${post.title!}
            </a>
          </p>
          <#if settings.card_hover_summary!false>
            <p class="pt-4 text-base h-24 text-gray-700 break-all leading-relaxed text-sm tracking-wider line-clamp-3 font-sans">
              ${post.summary!}
            </p>
          </#if>
        </div>
        <footer class="border-gray-100 border-t py-3 px-6 leading-none text-lg font-medium tracking-wider flex justify-between svg-f">
                    <span class="iconfont icon-calendar leading-8 text-base"
                          style="margin-right: 5px"></span>
          <span class="leading-8 mr-auto">
                        <span>${post.createTime?string("yyyy-MM-dd")}</span>
                    </span>
          <div class="leading-8">
                        <span>
                            <span>${post.visits!}</span>
                            <a href="javascript:void(0)" class="eye-sight text-gray-800">
                                <span class="iconfont icon-Eyesight"> </span>
                            </a>
                        </span>
            <span>
                            <span>${post.commentCount}</span>
                            <span class="iconfont icon-comment"> </span>
                        </span>
          </div>
        </footer>
      </div>
    </#list>
  </#if>
</div>