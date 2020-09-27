<div class="mg-auto" id="pagination">
    <#if pagination.hasNext>
        <span href="javascript:void(0)" class="more-post" path="${pagination.nextPageFullPath!}"
              onClick="getData(this)"
              data-not-pjax>查看更多</span>
    <#else>
        <span>你已经到底了</span>
    </#if>
</div>

<script type="text/javascript">
  function getData(e) {
    console.log(e);
    $('#pagination span').addClass('loading').text("");
    $.ajax({
      type: "GET",
      url: $('#pagination span').attr("path"),
      success: function (data) {
        let result = $(data).find("#container .pagination-container");
        let nextHref = $(data).find("#pagination span").attr("href");
        // In the new content
        $("#container .pagination-container").append(result);
        $("#pagination .more-post").removeClass("loading").text("下一页");
        if (nextHref !== undefined) {
          $("#pagination span").attr("path", nextHref);
        } else {
          $("#pagination").html("<span>你已经到底了</span>");
        }
      }
    });
  }
</script>
