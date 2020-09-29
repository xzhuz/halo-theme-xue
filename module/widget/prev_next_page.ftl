 <div class="container mx-auto mt-4 pb-8  ct-container">
     <#assign x = "${settings.card_random_cover_list}"?trim />
     <#assign thumbnails = x?trim?split(";") />
     <#assign thumbnailSize = thumbnails?size />
     <#if settings.card_random_cover_list?ends_with(";")>
         <#assign thumbnailSize =thumbnailSize - 1 />
     </#if>
        <div class="entry-navigation">
            <div class="nav previous">
                <#if prevPost??>
                     <#if prevPost.thumbnail?? && prevPost.thumbnail!=''>
                        <img class="lazyloaded" src="${prevPost.thumbnail}" alt="${prevPost.title!}"/>
                     <#elseif settings.card_random_cover_list?? && settings.card_random_cover_list != ''>
                        <#assign preThumbnailIndex ="${.now?long / prevPost.id % thumbnailSize}"/>
                        <img class="lazyloaded" src="${thumbnails[preThumbnailIndex?number?abs]?trim}" alt="${prevPost.title!}"/>
                     </#if>
                    <span>上一篇</span>
                    <h4 class="entry-title">${prevPost.title!}</h4>
                    <a class="u-permalink" href="${prevPost.fullPath!}"></a>
                </#if>
            </div>
            <div class="nav next">
                <#if nextPost??>
                    <#if nextPost.thumbnail?? && nextPost.thumbnail!=''>
                        <img class="lazyloaded" src="${nextPost.thumbnail}" alt="${nextPost.title!}"/>
                     <#elseif settings.card_random_cover_list?? && settings.card_random_cover_list != ''>
                        <#assign nextThumbnailIndex ="${.now?long / nextPost.id % thumbnailSize}"/>
                        <img class="lazyloaded" src="${thumbnails[nextThumbnailIndex?number?abs]?trim}" alt="${nextPost.title!}"/>
                     </#if>
                    <span>下一篇</span>
                    <h4 class="entry-title">${nextPost.title!}</h4>
                    <a class="u-permalink" href="${nextPost.fullPath}"></a>
                </#if>
            </div>
        </div>
    </div>