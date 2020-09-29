 <div class="container mx-auto mt-4 pb-8  ct-container">
        <div class="entry-navigation">
            <div class="nav previous">
                <#if prevPost??>
                     <#if prevPost.thumbnail?? && prevPost.thumbnail!=''>
                        <img class="lazyloaded" src="${prevPost.thumbnail}" alt="${prevPost.title!}"/>
                     <#elseif settings.card_random_cover!false>
                        <#assign x = "${settings.card_random_cover_img_num?number}" />
                        <#assign thumbnailIndex ="${prevPost.id % (x?number)}"/>
                        <img class="lazyloaded" src="${blog_url!}/thumbnail/thumbnail-${thumbnailIndex?number?abs}.${settings.card_random_cover_img_suffix}" alt="${prevPost.title!}"/>
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
                     <#elseif settings.card_random_cover!false>
                        <#assign x = "${settings.card_random_cover_img_num?number}" />
                        <#assign thumbnailIndex ="${nextPost.id % (x?number)}"/>
                        <img class="lazyloaded" src="${blog_url!}/thumbnail/thumbnail-${thumbnailIndex?number?abs}.${settings.card_random_cover_img_suffix}" alt="${nextPost.title!}"/>
                     </#if>
                    <span>下一篇</span>
                    <h4 class="entry-title">${nextPost.title!}</h4>
                    <a class="u-permalink" href="${nextPost.fullPath}"></a>
                </#if>
            </div>
        </div>
    </div>