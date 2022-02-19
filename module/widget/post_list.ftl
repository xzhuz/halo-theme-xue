<div class="posts pagination-container" id="pageContainer">
  <#if posts?? && posts.getTotalElements() gt 0>
    <ul class="posts-list pl-0">
      <#list posts.content as post>
        <li class="post flex list-none relative w-full pt-4 pb-2 mt-0 inline-block border-t border-solid text-gray-200">
          <div class="overflow-hidden float-left relative flex-shrink-0 h-40 w-40 bg-gray-100 hidden md:inline-block">
            <#if post.thumbnail?? && post.thumbnail!=''>
              <a href="${post.fullPath!}">
                <img class="lazyload object-cover w-full h-full " src="${theme_base!}/source/images/loading.svg" data-src="${post.thumbnail}"
                     alt="${post.title}"/>
              </a>
            <#elseif settings.card_random_cover_list?? && settings.card_random_cover_list != ''>
              <a href="${post.fullPath!}">
                <img class="img-random object-cover w-full h-full" src="${theme_base!}/source/images/loading.svg" data-src=""
                     index="${post_index}" alt="${post.title}"/>
              </a>
            <#else>
              <div class="post-date text-7xl font-bold w-full h-full text-center pt-5 flex flex-col items-center justify-center uppercase text-gray-800">
                ${post.createTime?string("dd")}
                <span class="font-medium text-base block mt-3 uppercase">${post.createTime?string("yyyy年MM月")}</span>
              </div>
            </#if>
          </div>
          <div class="flex-left flex flex-col justify-between p-0 md:pl-3 h-32 md:h-40 w-full transition-all ease-in-out duration-300">
            <a href="${post.fullPath!}" rel="bookmark" class="text-gray-800 hover:text-red-600 z-50 flex-none">
              <h2 class="text-2xl mb-0 mt-0 relative hover:text-red-600">
                ${post.title}
                <#if post.topPriority gt 0>
                  <i class="iconfont icon-zhiding zhiding text-red-600 text-2xl"></i>
                </#if>
              </h2>
            </a>
            <p class="leading-normal break-all overflow-hidden overflow-ellipsis m-0 text-sm md:text-lg text-gray-800 line-clamp-3 ">${post.summary!}</p>
            <div class="post-meta items-center items-center mr-auto w-full">
              <#if post.categories?? && post.categories?size gt 0>
                <#list post.categories as category>
                  <a class="float-left text-sm mr-1 text-gray-400 hover:text-red-600" href="${category.fullPath!}">
                    <#if category_index != 0> · </#if>
                    <span class="iconfont icon-tag2 "></span>
                    <span >${category.name!} </span> </a>
                </#list>
              </#if>
              <a class="post-more-link h-auto text-sm whitespace-nowrap text-gray-400 float-right" href="${post.fullPath!}">
                <span class="text text-gray-400 uppercase tracking-wide 
                transition-all ease duration-400 hover:text-red-600">查看全文</span>
<#--                <span class="iconfont icon-Rightxiangyou35  text-gray-400 hover:text-red-600"></span>-->
              </a>
            </div>
          </div>
        </li>
      </#list>
    </ul>
  </#if>
</div>
