
<#if is_categories?? || is_tags ??>
    <#--标签云-->
    <script src="https://cdn.jsdelivr.net/gh/xzzai/static@master/js/jqcloud-1.0.4.min.js"></script>
    <script type='text/javascript'>
      $(function () {
        renderTagCloud();
        renderCategoryCloud();
      });
    </script>
</#if>

<#if settings.Aplayer?? && settings.Aplayer != ''>
    <script src="https://cdn.jsdelivr.net/npm/aplayer@1.10.1/dist/APlayer.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/meting@2/dist/Meting.min.js"></script>
</#if>

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

<script type="text/javascript">
  ${settings.common_js!''}
</script>

<#-- Pjax 相关代码 -->
<#include "pjax.ftl">