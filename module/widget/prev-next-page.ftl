<#if settings.post_nepre!true>
        <div class="nextprev-postlink">
           <div class="container mx-auto mt-8 pb-8 max-w-6xl grid grid-cols-2 flex flex-row justify-between  ct-container cn-pd post-navigation">
                    <div class="prev-post-link">
                        <a href="${prevPost.fullPath!}" title="${prevPost.title!}" class='post-link'>
                            <div class="post-thumb">
                                <div style="background-image: url(${prevPost.thumbnail})"></div>
                            </div>
                            <h4>${prevPost.title!}</h4>
                            <span class="nextprev-meta">
                            <i class="iconfont icon-left"></i>上一篇</span>
                        </a>
                    </div>
                    <div class="next-post-link">
                            <a href="${nextPost.fullPath!}" alt="${nextPost.title!}" class='post-link'>
                                <div class="post-thumb">
                                <div style="background-image: url(${nextPost.thumbnail}"></div>
                                </div>
                                <h4>${nextPost.title!}</h4>
                                <span class="nextprev-meta">下一篇<i class="iconfont icon-right"></i></span>
                            </a>
                    </div>
            </div>
        </div>
</#if>