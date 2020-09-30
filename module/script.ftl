
<#if is_category?? || is_tags ??>
<#--标签云-->
    <script src="https://cdn.jsdelivr.net/gh/xzzai/static@master/js/jqcloud-1.0.4.min.js"></script>
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
  $(function () {
    pageScroll();
  });

  /**
   * header scroll 事件
   */
  function pageScroll() {
    var start = 0;
    var scrollFunc = function () {
      const scrollTop = getScrollTop();
      if (start > scrollTop) {
        addBg();
      } else {
        removeBg();
      }
      // 到顶部, 取消展示
      if (scrollTop === 0) {
        remove()
        start = scrollTop;
      }
    }

      var addBg = function () {
        $('.slide.header-nav').removeClass('hidden').addClass('bg-fff');
      }

      var removeBg = function () {
        $('.slide.header-nav').addClass('hidden').removeClass('bg-fff');
      };

      var remove = function () {
        $('.slide.header-nav').removeClass('hidden').removeClass('bg-fff');
      };

      document.addEventListener('scroll', scrollFunc, false);
  }

</script>


<#if settings.enabled_mathjax!true>
    <script defer src="https://cdn.jsdelivr.net/npm/katex@0.12.0/dist/katex.min.js"
            integrity="sha384-g7c+Jr9ZivxKLnZTDUhnkOnsh30B4H0rpLUpJ4jAIKs4fnJI+sEnkvrMWph2EDg4"
            crossorigin="anonymous"></script>
    <script defer src="https://cdn.jsdelivr.net/npm/katex@0.12.0/dist/contrib/auto-render.min.js"
            integrity="sha384-mll67QQFJfxn0IYznZYonOWZ644AWYC+Pt2cHqMaRhXVrursRwvLnLaebdGIlYNa"
            crossorigin="anonymous"
            onload="if (document.getElementById('write') && openKatex)
            { renderMathInElement(document.getElementById('write'), katex_config)}
            else if (document.getElementById('tree-hole') && openKatex)
            {renderMathInElement(document.getElementById('tree-hole'), katex_config)}"></script>
</#if>


<script type="text/javascript">
  // console.clear();
  console.log("%c 有朋自远方来, 不亦说乎.", "background:#24272A; color:#ffffff", "");
  <#if settings.github??>
    console.log("%c Github %c", "background:#24272A; color:#ffffff", "", "${settings.github!}");
  </#if>
</script>

<#-- Pjax 相关代码 -->
<#include "pjax.ftl">