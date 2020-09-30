<!-- markdown 插件 -->
<script src="https://cdn.jsdelivr.net/npm/marked/marked.min.js"></script>

<!--图片预览插件-->
<#if settings.enable_image_view!false>
    <script src="//cdn.jsdelivr.net/npm/viewerjs@1.5.0/dist/viewer.min.js"></script>
</#if>
<#if settings.enable_code_highlight!true>
    <#-- 代码高亮-->
    <script src="https://cdn.jsdelivr.net/gh/highlightjs/cdn-release@10.0.0/build/highlight.min.js"></script>
    <#if settings.enable_code_lineNumber!false> 
        <#--代码行数-->
        <script src="https://cdn.jsdelivr.net/gh/xzzai/static@master/js/linesNumber.js"></script>
    </#if>
</#if>
<#--其他语言包-->
<#if settings.more_lang_code!false>
    <script src="https://cdn.jsdelivr.net/gh/xzzai/static@master/js/highlight.lang.js"></script>
</#if>

<#--目录-->
<#if settings.post_toc!true>
    <script src="//cdn.jsdelivr.net/npm/tocbot@4.11.2/dist/tocbot.min.js"></script>
</#if>


<#if settings.enable_photo!false && is_photos??>
<#--相册插件-->
    <script src="//cdn.jsdelivr.net/npm/justifiedGallery@3.7.0/dist/js/jquery.justifiedGallery.min.js"></script>
</#if>

<#if settings.right_corner_circle!true>
    <#--右下角按钮-->
    <script src="https://cdn.jsdelivr.net/gh/xzzai/static@master/js/moon.js"></script>
</#if>


<#if settings.visit_statistics!false>
    <script async src="//busuanzi.ibruce.info/busuanzi/2.3/busuanzi.pure.mini.js"></script>
</#if>



<script type="text/javascript">
  let openKatex = false;
  <#if settings.enabled_mathjax!true>
  const katex_config = {
    delimiters:
        [
          {left: "$$", right: "$$", display: true},
          {left: "$", right: "$", display: false},
          {left: "\\(", right: "\\)", display: false},
          {left: "\\[", right: "\\]", display: true},
        ]
  };
  openKatex = true;
  </#if>

  // 是否开启代码高亮
  let enableCodeHighlight = false;
  <#if settings.enable_code_highlight!true>
    enableCodeHighlight = true;
  </#if>
  let enableLineNumber = false;
  // 是否开启行号
  <#if settings.enable_code_lineNumber!false> 
    enableLineNumber = typeof lineNumbersBlock === 'function';
  </#if>
</script>

${settings.other_script_file!''}