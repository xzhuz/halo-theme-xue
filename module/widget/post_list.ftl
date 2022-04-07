<div class="posts pagination-container" id="pageContainer">
  <#if posts?? && posts.getTotalElements() gt 0>
    <ul class="posts-list pl-0 ">
      <#list posts.content as post>
        <li class="post slide-up flex list-none relative w-full py-3 md:py-5 inline-block text-gray-200 bg-white dark:bg-gray-800 rounded-lg my-4 p-4 hover:shadow">
          <div class="overflow-hidden float-left relative flex-shrink-0 h-16 md:h-36 w-28 md:w-56 bg-gray-100 inline-block dark:filter-60">
            <#if post.thumbnail?? && post.thumbnail!=''>
              <#assign hasImg = true />
              <a href="${post.fullPath!}">
                <img class="lazyload object-cover w-full h-full transform hover:scale-110 transition-transform duration-700 dark:filter-60 no-zoom"
                     src="${theme_base!}/source/images/loading.gif" data-src="${post.thumbnail}"
                     alt="${post.title}"/>
              </a>
            <#elseif settings.card_random_cover_list?? && settings.card_random_cover_list != ''>
              <#assign hasImg = true />
              <a href="${post.fullPath!}">
                <img class="img-random object-cover w-full h-full transform hover:scale-110 transition-transform duration-700 no-zoom"
                     src="${theme_base!}/source/images/loading.gif" data-src=""
                     index="${post_index}" alt="${post.title}"/>
              </a>
            <#else>
              <#assign hasImg = false />
              <div class="post-date text-6xl font-bold w-full h-full text-center pt-8 md:pt-5  flex flex-col items-center justify-center uppercase text-gray-800">
                ${post.createTime?string("dd")}
                <span class="font-medium text-base block mt-3 uppercase">${post.createTime?string("yyyy年MM月")}</span>
              </div>
            </#if>
          </div>
          <div class="flex-left flex flex-col justify-between pl-4 md:pl-4 h-16 md:h-36 w-full ">
            <a href="${post.fullPath!}" rel="bookmark"
               class="text-gray-800 hover:text-red-600 dark:text-gray-300 flex-none">
              <h2 class="text-base md:text-2xl hover:text-red-500 mb-0 mt-0 relative z-50 dark:text-gray-300 inline-block">
                <#if post.topPriority gt 0>
                  <i class="iconfont icon-pin-fill text-sm md:text-base text-gray-400"></i>
                </#if>
                ${post.title}
              </h2>
            </a>
            <p class="leading-normal break-all overflow-hidden overflow-ellipsis m-0 text-sm md:text-base text-gray-400 md:line-clamp-2 text-justify hidden md:block font-normal">${post.summary!}</p>
            <div class="post-meta flex items-center items-center mr-auto w-full">
              <#if post.categories?? && post.categories?size gt 0>
                <#list post.categories as category>
                  <a class="text-sm mr-1 text-gray-500 hover:text-red-600 hidden md:inline-block" href="${category.fullPath!}">
                    <#if category_index != 0> · </#if>
                    <span class="iconfont icon-tag2"></span>
                    <span>${category.name!} </span> </a>
                </#list>
              </#if>
              <span class="iconfont icon-comment text-xs mr-1 text-gray-500 inline-block md:hidden"></span>
              <span class=" text-xs mr-1 text-gray-500 inline-block md:hidden">${post.commentCount!} </span>
              <span class="iconfont icon-round_like_fill  text-xs mr-1 text-gray-500 inline-block md:hidden"></span>
              <span class=" text-xs mr-1 text-gray-500 inline-block md:hidden">${post.likes!} </span>
              <span class="text text-gray-500 uppercase text-sm ml-auto tracking-wide hidden md:inline-block">${post.createTime?string("yyyy-MM-dd HH:mm")}</span>
              <span class="text text-gray-500 uppercase text-xs ml-auto tracking-wide inline-block md:hidden">${post.createTime?string("yyyy-MM")}</span>
            </div>
          </div>
        </li>
      </#list>
    </ul>
  </#if>
</div>
