<!-- markdown 插件 -->
<script src="${theme_base!}/source/js/marked.min.js"></script>

<!--图片预览插件-->
<#if settings.enable_image_view!false>
    <script src="${theme_base!}/source/js/viewer.min.js"></script>
</#if>
<#if settings.enable_code_highlight!true>
    <#-- 代码高亮-->
    <script src="${theme_base!}/source/highlight.js/highlight.min.js"></script>
    <#--其他语言包-->
    <#if settings.more_lang_code!false>
        <script src="${theme_base!}/source/highlight.js/highlight.lang.js"></script>
    </#if>
    <#if settings.enable_code_lineNumber!false> 
        <#--代码行数-->
        <script src="${theme_base!}/source/highlight.js/linesNumber.js"></script>
    </#if>
</#if>

<#--目录-->
<#if settings.post_toc!true>
    <script src="${theme_base!}/source/js/tocbot.min.js"></script>
</#if>

<#if settings.enable_photo!false>
    <script src="${theme_base!}/source/js/isotope.pkgd.min.js"></script>
</#if>

<#if settings.right_corner_circle!true>
    <#--右下角按钮-->
    <script src="${theme_base!}/source/js/moon.js"></script>
</#if>


<#if settings.visit_statistics!false>
    <script async src="//busuanzi.ibruce.info/busuanzi/2.3/busuanzi.pure.mini.js"></script>
</#if>

<script src="${theme_base!}/source/js/simply-nav.js"></script>

<script type="text/javascript">
  let openKatex = false;
  <#if settings.enabled_mathjax!true>
      openKatex = true;
  </#if>

  // 是否开启代码高亮
  let enableCodeHighlight = false;
  let collpaseCode = false;
  <#if settings.enable_code_highlight!true>
    enableCodeHighlight = true;
  </#if>
  let enableLineNumber = false;
  // 是否开启行号
  <#if settings.enable_code_lineNumber!false> 
    enableLineNumber = typeof lineNumbersBlock === 'function';
  </#if>

  <#if settings.collpaseCode!false>
     collpaseCode = true
  </#if>

  function renderTagCloud() {
    // 标签云
    var tagCloud = $("#tagCloud");
    if (!(tagCloud && tagCloud.children().length === 0)) {
      return;
    }
    // 标签
    var tagArray = [
      <@tagTag method="list">
      <#list tags as tag>
      {'text': '${tag.name!}', 'weight': '${tag.postCount!}', 'link': '${tag.fullPath!}'},
      </#list>
      </@tagTag>
    ];

    // 标签云
    tagCloud.jQCloud(tagArray, {autoResize: true, delayedMode: true});

  }

  function renderCategoryCloud() {
    // 分类云
    var categoryCloud = $("#categoryCloud");
    if (!(categoryCloud && categoryCloud.children().length === 0)) {
      return;
    }
    // 分类
    var array = [
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

    categoryCloud.jQCloud(array, {autoResize: true, delayedMode: true});
  }
</script>

${settings.other_script_file!''}
