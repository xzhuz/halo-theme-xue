<div class="entry-navigation bg-white rounded shadow-md flex flex-wrap mt-10 overflow-hidden w-full ">
  <div class="nav previous flex flex-col justify-center min-h-100 py-0 px-4 relative w-full sm:w-6/12 break-word">
    <#if prevPost??>
      <#if prevPost.thumbnail?? && prevPost.thumbnail!=''>
        <img class="lazyload h-full w-full left-0 top-0 object-cover absolute dark:filter-60 no-zoom"
             src="${theme_base!}/source/images/loading.gif" data-src="${prevPost.thumbnail}" alt="${prevPost.title!}"/>
      <#elseif settings.card_random_cover_list?? && settings.card_random_cover_list != ''>
        <img class="img-random lazyloaded h-full w-full left-0 top-0 object-cover absolute dark:filter-60 no-zoom"
             index="${.now?string['ss']?number - 1}" src="${theme_base!}/source/images/loading.gif"
             alt="${prevPost.title!}"/>
      </#if>
      <span class="text-white font-medium text-lg pt-8 relative uppercase z-10 dark:text-gray-300">上一篇</span>
      <h4 class="text-white text-lg mt-1 mx-0 mb-0 pb-8 relative z-10 dark:text-gray-300">${prevPost.title!}</h4>
      <a class="absolute bottom-0 left-0 right-0 top-0 z-10 dark:text-gray-300" href="${prevPost.fullPath!}"></a>
    <#else>
      <#if settings.card_random_cover_list?? && settings.card_random_cover_list != ''>
        <img class="img-random lazyloaded h-full w-full left-0 top-0 object-cover absolute dark:filter-60 no-zoom"
             index="${.now?string['ss']?number - 1}" src="${theme_base!}/source/images/loading.gif"/>
      </#if>
      <span class="text-white font-medium text-lg pt-8 relative uppercase z-10 dark:text-gray-300">上一篇</span>
      <h4 class="text-white text-lg mt-1 mx-0 mb-0 pb-8 relative z-10 dark:text-gray-300">无</h4>
    </#if>
  </div>
  <div class="nav next items-end text-right flex flex-col justify-center min-h-100 py-0 px-4 relative w-full sm:w-6/12 break-word">
    <#if nextPost??>
      <#if nextPost.thumbnail?? && nextPost.thumbnail!=''>
        <img class="lazyload h-full w-full left-0 top-0 object-cover absolute dark:filter-60 no-zoom"
             src="${theme_base!}/source/images/loading.gif" data-src="${nextPost.thumbnail}" alt="${nextPost.title!}"/>
      <#elseif settings.card_random_cover_list?? && settings.card_random_cover_list != ''>
        <img class="img-random lazyloaded h-full w-full left-0 top-0 object-cover absolute dark:filter-60 no-zoom"
             index="${.now?string['ss']?number + 1}" src="${theme_base!}/source/images/loading.gif"
             alt="${nextPost.title!}"/>
      </#if>
      <span class="text-white font-medium text-lg pt-8 relative uppercase z-10 dark:text-gray-300">下一篇</span>
      <h4 class="text-white text-lg mt-1 mx-0 mb-0 pb-8 relative z-10 dark:text-gray-300">${nextPost.title!}</h4>
      <a class="absolute bottom-0 left-0 right-0 top-0 z-10 dark:text-gray-300" href="${nextPost.fullPath}"></a>
    <#else>
      <#if settings.card_random_cover_list?? && settings.card_random_cover_list != ''>
        <img class="img-random lazyloaded h-full w-full left-0 top-0 object-cover absolute dark:filter-60 no-zoom"
             index="${.now?string['ss']?number + 1}" src="${theme_base!}/source/images/loading.gif" alt=""/>
      </#if>
      <span class="text-white font-medium text-lg pt-8 relative uppercase z-10 dark:text-gray-300">下一篇</span>
      <h4 class="text-white text-lg mt-1 mx-0 mb-0 pb-8 relative z-10 dark:text-gray-300">无</h4>
    </#if>
  </div>
</div>
