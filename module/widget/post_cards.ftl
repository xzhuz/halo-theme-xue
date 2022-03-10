<div class="posts grid lg:grid-cols-3 md:grid-cols-2 sm:grid-cols-2 xs:grid-cols-1 lg:gap-6 md:gap-4 sm:gap-3 mt-4">
  <#if posts?? && posts.getTotalElements() gt 0>
    <#list posts.content as post>
      <div class="flex justify-between shadow hover:shadow-md rounded-md mt-4">
        <#if post.topPriority gt 0>
          <div class="post-top z-50 w-24 h-24 overflow-hidden absolute">
            <div class="shadow-lg text-center transform -rotate-45 relative py-1 px-0 top-3 -left-8 w-28 bg-red-600 text-gray-100">
              置顶
            </div>
          </div>
        </#if>
        <div class="flex flex-col h-full max-w-lg mx-auto bg-white dark:bg-gray-800 rounded-lg">
          <div class="h-48">
            <#if post.thumbnail?? && post.thumbnail!=''>
              <img class="lazyload object-cover block h-48 rounded-lg rounded-b-none"
                   src="${theme_base!}/source/images/loading.svg"
                   data-src="${post.thumbnail!''}" alt="${post.title}"/>
            <#elseif settings.card_random_cover_list?? && settings.card_random_cover_list != ''>
              <img class="rounded-lg rounded-b-none object-cover block img-random h-48"
                   index="${post_index}"
                   src="${theme_base!}/source/images/loading.svg" data-src="" alt="${post.title!}"
              />
            <#else>
              <span class="full-image placeholder-bg" role="img" aria-label=""></span>
            </#if>
          </div>
          <div class="flex justify-between -mt-4 px-4">
            <span class="inline-block ring-4 bg-red-500 ring-white dark:ring-gray-800  rounded-full text-sm font-medium tracking-wide text-gray-100 px-3 pt-0.5">
              <#if post.categories?size gt 0>
                ${post.categories[0].name}
              <#elseif post.tags?size gt 0>
                ${post.tags[0].name}
              <#else>
                ${user.nickname!}
              </#if>
            </span>
            <span class="flex h-min space-x-1 items-center rounded-full text-gray-400 bg-white dark:bg-gray-800 py-1 px-2 text-xs font-medium">
              <svg
                      xmlns="http://www.w3.org/2000/svg"
                      class="h-5 w-5 text-blue-500"
                      fill="none"
                      viewBox="0 0 24 24"
                      stroke="currentColor"
              >
                <path
                        stroke-linecap="round"
                        stroke-linejoin="round"
                        stroke-width="2"
                        d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z"
                />
              </svg>
              <p class="text-blue-500 font-semibold text-xs">
                ${(post.wordCount / 300) ?int} 分钟
              </p>
            </span>
          </div>
          <div class="py-4 px-4">
            <p class="cursor-pointer">
              <a href="${post.fullPath!}"
                 class="text-gray-800 dark:text-gray-300 font-bold hover:text-blue-500 tracking-wide text-center text-xl tracking-wider line-clamp-1 font-medium leading-6">${post.title!}</a>
            </p>
          </div>
          <div class="px-4 py-3 space-y-2">
            <p class="text-gray-800 dark:text-gray-400 font-normal leading-5 tracking-wider line-clamp-2">
              ${post.summary!}
            </p>
          </div>
          <div class="flex flex-row items-end h-full w-full px-4 mt-4">
            <div class="flex border-t border-gray-700 w-full py-2">
              <div class="flex items-center space-x-3 border-r border-gray-700 w-full">
                <img
                        class="object-cover w-8 h-8 border-2 border-white rounded-full"
                        src="${user.avatar!}"
                        alt="${user.nickname!}"
                        loading="lazy"
                />
                <div class="">
                  <p class="text-sm font-semibold tracking-wide text-gray-800 dark:text-gray-400">
                    ${user.nickname!}
                  </p>
                  <p class="text-xs font-light tracking-wider text-gray-800 dark:text-gray-400">
                    ${post.createTime?string("yyyy-MM-dd")}
                  </p>
                </div>
              </div>
              <div class="flex items-center flex-shrink-0 px-2">
                <div class="flex items-center space-x-1 text-gray-800 dark:text-gray-400">
                  <svg
                          xmlns="http://www.w3.org/2000/svg"
                          class="h-5 w-5"
                          fill="none"
                          viewBox="0 0 24 24"
                          stroke="currentColor"
                  >
                    <path
                            stroke-linecap="round"
                            stroke-linejoin="round"
                            stroke-width="2"
                            d="M4.318 6.318a4.5 4.5 0 000 6.364L12 20.364l7.682-7.682a4.5 4.5 0 00-6.364-6.364L12 7.636l-1.318-1.318a4.5 4.5 0 00-6.364 0z"
                    />
                  </svg>
                  <p class="font-medium text-gray-800 dark:text-gray-400">${post.likes}</p>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </#list>
  </#if>
</div>