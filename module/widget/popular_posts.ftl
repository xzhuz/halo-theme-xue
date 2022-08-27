<#list posts.content?sort_by("visits")?reverse as post>
  <#if post_index==4><#break></#if>
  <div class="relative mt-1 md:mt-0 h-28 sm:h-24 md:h-36 dark:filter-60 shadow-lg rounded-md">
    <#if post.thumbnail?? && post.thumbnail!=''>
      <img class="object-cover w-full h-28 sm:h-24 md:h-36 rounded-md" src="${post.thumbnail}" alt="${post.title}"/>
    <#elseif settings.card_random_cover_list?? && settings.card_random_cover_list != ''>
      <img class="object-cover w-full img-random h-28 sm:h-24 md:h-36 dark:filter-60 rounded-md" index="${post_index}"
           src="${theme_base!}/source/images/loading.gif" data-src="" alt="${post.title}"/>
    <#else>
      <span class="full-image placeholder-bg w-full h-28 sm:h-24 md:h-36 rounded-md" role="img" aria-label=""></span>  
    </#if>
    <a href="${post.fullPath!}">
      <div class="absolute top-0 left-0 p-5 w-full h-full rounded-md bg-white bg-opacity-90 text-center cursor-pointer opacity-0 hover:opacity-100 transition-all ease-out">
        <div class="w-full h-full absolute top-5 left-0 p-5 text-center">
          <h2 class="overflow-hidden mb-0.5 text-gray-600 whitespace-nowrap overflow-ellipsis text-sm md:text-base mt-0 font-bold">
            <a href="${post.fullPath!}">${post.title}</a>
          </h2>
          <a href="${post.fullPath!}"><span class="text-center text-gray-400 hidden md:block text-sm">${post.createTime?string("yyyy年MM月dd日")}</span></a>
          <a href="${post.fullPath!}"><span class="iconfont icon-yuedu"></span> </a>
        </div>
      </div>
    </a>
  </div>
</#list>
