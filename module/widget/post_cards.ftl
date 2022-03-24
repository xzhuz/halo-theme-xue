<div class="posts grid lg:grid-cols-3 md:grid-cols-2 sm:grid-cols-2 xs:grid-cols-1 lg:gap-6 md:gap-4 sm:gap-3 mt-4">
  <#if posts?? && posts.getTotalElements() gt 0>
    <#list posts.content as post>
      <div class="relative flex flex-col overflow-hidden rounded-lg w-full bg-base-100 shadow-xl">
        <figure class="flex items-center justify-center">
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
            <span class="full-image placeholder-bg w-full" role="img" aria-label=""></span>
          </#if>
        </figure>
        <div class="flex flex-col gap-2 px-4 py-6" style="flex: 1 1 auto; ">
          <h2 class="flex items-center gap-2 text-xl leading-7 font-bold my-4 z-50">
            <a href="${post.fullPath!}" class="text-gray-800 dark:text-gray-600">${post.title!}</a>
          </h2>
          <div class="flex flex-wrap items-end gap-2 justify-end text-sm">
            <#if post.tags?size gt 0>
              <#list post.tags as tag>
                <div class="badge-outline bg-transparent text-gray-800 dark:text-gray-600 h-5 inline-flex items-center justify-center transition duration-200 ease-in-out px-2 border rounded-full border-gray-800 dark:border-gray-600">
                  ${tag.name}
                </div>
              </#list>
            </#if>
          </div>
        </div>
      </div>
    </#list>
  </#if>
</div>