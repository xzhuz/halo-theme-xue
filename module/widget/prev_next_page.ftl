<div class="container mx-auto mt-4 pb-8  ct-container">
    <div class="entry-navigation">
        <div class="nav previous">
            <#if prevPost??>
                <#if prevPost.thumbnail?? && prevPost.thumbnail!=''>
                    <img class="lazyload" src="${theme_base!}/source/images/loading.svg" data-src="${prevPost.thumbnail}" alt="${prevPost.title!}" />
                <#elseif settings.card_random_cover_list?? && settings.card_random_cover_list != ''>
                    <img class="img-random lazyloaded" index="${.now?string['ss']?number - 1}" src="${theme_base!}/source/images/loading.svg"
                         alt="${prevPost.title!}"/>
                </#if>
                <span>上一篇</span>
                <h4 class="entry-title">${prevPost.title!}</h4>
                <a class="u-permalink" href="${prevPost.fullPath!}"></a>
             <#else>
                 <#if settings.card_random_cover_list?? && settings.card_random_cover_list != ''>
                     <img class="img-random lazyloaded" index="${.now?string['ss']?number - 1}" src="${theme_base!}/source/images/loading.svg"/>
                 </#if>
                 <span>上一篇</span>
                 <h4 class="entry-title">无</h4>
            </#if>
        </div>
        <div class="nav next">
            <#if nextPost??>
                <#if nextPost.thumbnail?? && nextPost.thumbnail!=''>
                    <img class="lazyload" src="${theme_base!}/source/images/loading.svg" data-src="${nextPost.thumbnail}" alt="${nextPost.title!}"/>
                <#elseif settings.card_random_cover_list?? && settings.card_random_cover_list != ''>
                    <img class="img-random lazyloaded" index="${.now?string['ss']?number + 1}" src="${theme_base!}/source/images/loading.svg"
                         alt="${nextPost.title!}"/>
                </#if>
                <span>下一篇</span>
                <h4 class="entry-title">${nextPost.title!}</h4>
                <a class="u-permalink" href="${nextPost.fullPath}"></a>
            <#else>
                <#if settings.card_random_cover_list?? && settings.card_random_cover_list != ''>
                    <img class="img-random lazyloaded" index="${.now?string['ss']?number + 1}" src="${theme_base!}/source/images/loading.svg"/>
                </#if>
                <span>下一篇</span>
                <h4 class="entry-title">无</h4>
            </#if>
        </div>
    </div>
</div>
