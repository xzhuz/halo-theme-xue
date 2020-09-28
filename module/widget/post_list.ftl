<div class="popular-posts">
    <h3><i class="iconfont icon-hot list-brands"></i>热门文章</h3>
    <div class="posts grid grid-cols-2 lg:grid-cols-4 md:grid-cols-4  lg:gap-4 md:gap-2 sm:gap-1">
        <#include "popular_cards.ftl">
    </div>
</div>
<h3><i class="iconfont icon-new list-brands"></i>最新文章</h3>
<div class="posts mt-4 pagination-container">
    <#if posts?? && posts.getTotalElements() gt 0>
        <#include "post_items.ftl">
    </#if>
</div>

<nav class="pagination flex flex-row justify-center mt-8" role="navigation"
     aria-label="pagination">
    <@paginationTag method="index" page="${posts.number}" total="${posts.totalPages}" display="3">
        <#include "more.ftl">
    </@paginationTag>
</nav>