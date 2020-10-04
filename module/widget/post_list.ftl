<div class="posts mt-4 pagination-container" id="pageContainer">
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