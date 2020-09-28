<#if settings.post_nepre!true>
<div class="container mx-auto mt-8 pb-8 max-w-6xl flex flex-row justify-between ct-container">
    <div class="entry-navigation">
        <div class="nav previous">
            <#if prevPost??>
                <img class=" lazyloaded" src="${prevPost.thumbnail}"/>
                <span>上一篇</span>
                <h4 class="entry-title">${prevPost.title!}</h4>
                <a class="u-permalink" href="${prevPost.fullPath!}"></a>
            </#if>
        </div>
        <div class="nav next">
            <#if nextPost??>
                <img class=" lazyloaded" src="${nextPost.thumbnail}">
                <span>下一篇</span>
                <h4 class="entry-title">${nextPost.title!}</h4>
                <a class="u-permalink" href="${nextPost.fullPath}"></a>
            </#if>
        </div>
    </div>
</div>
</#if>