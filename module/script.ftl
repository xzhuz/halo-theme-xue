<#include "plugins.ftl"/>

<#--  顶部菜单  -->
<script src="https://cdn.jsdelivr.net/gh/xzzai/static@master/js/simply-nav.js"></script>

<#if is_category?? || is_tags ??>
<#--标签云-->
    <script data-pjax-cloud
            src="https://cdn.jsdelivr.net/gh/xzzai/static@master/js/jqcloud-1.0.4.min.js"></script>
    <script type='text/javascript'>
      // 标签
      var tagArray = [
        <@tagTag method="list">
        <#list tags as tag>
        {'text': '${tag.name!}', 'weight': '${tag.postCount!}', 'link': '${tag.fullPath!}'},
        </#list>
        </@tagTag>
      ];

      // 分类
      var categoryArray = [
        <@categoryTag method="list">
        <#list categories as category>
        {
          'text': '${category.name!}',
          'weight': '${category.postCount!}',
          'link': '${category.fullPath!}'
        },
        </#list>
        </@categoryTag>
      ];

      $(function () {
        var tagCloud = $("#tagCloud");
        if (tagCloud && tagCloud.children().length === 0) {
          tagCloud.jQCloud(tagArray, {autoResize: true, delayedMode: true});
        }

        var categoryCloud = $("#categoryCloud");
        if (categoryCloud && categoryCloud.children().length === 0) {
          categoryCloud.jQCloud(categoryArray, {autoResize: true, delayedMode: true});
        }
      });
    </script>
</#if>

<#if settings.Aplayer?? && settings.Aplayer != ''>
    <script src="//cdn.jsdelivr.net/npm/aplayer@1.10.1/dist/APlayer.min.js"></script>
    <script src="//cdn.jsdelivr.net/npm/meting@2/dist/Meting.min.js"></script>
</#if>

<script type="text/javascript">
    $('.arrow-down').on('click', function () {
        var postHeight = $('#homeHeader').height();
        window.scroll({top: postHeight, behavior: 'smooth'});
    })
</script>

<script type="text/javascript">
  var katex_config = {
    delimiters:
        [
          {left: "$$", right: "$$", display: true},
          {left: "$", right: "$", display: false},
          {left: "\\(", right: "\\)", display: false},
          {left: "\\[", right: "\\]", display: true},
        ]
  };
  var openToc;
  <#if settings.post_toc!true>
    openToc = true;
  </#if>
</script>


<script type="text/javascript">
  // console.clear();
  console.log("%c 有朋自远方来, 不亦说乎.", "background:#24272A; color:#ffffff", "");
  <#if settings.github??>
  console.log("%c Github %c", "background:#24272A; color:#ffffff", "", "${settings.github!}");
  </#if>
</script>


<#-- Pjax 相关代码 -->
<#include "pjax.ftl">