<!--图片预览插件-->
<script src="//cdn.jsdelivr.net/npm/viewerjs@1.5.0/dist/viewer.min.js"></script>
<#-- 代码高亮-->
<script src="https://cdn.jsdelivr.net/gh/highlightjs/cdn-release@10.0.0/build/highlight.min.js"></script>
<#--其他语言包-->
<script
        src="https://cdn.jsdelivr.net/gh/xzzai/static@master/js/highlight.lang.js"></script>
<#--代码行数-->
<script
        src="https://cdn.jsdelivr.net/npm/highlightjs-line-numbers.js@2.7.0/dist/highlightjs-line-numbers.min.js"></script>

<#-- 文章页 -->
<#if is_post??>
<#--目录-->
    <#if settings.post_toc!true>
        <script
                src="//cdn.jsdelivr.net/npm/tocbot@4.11.2/dist/tocbot.min.js"></script>
    </#if>
</#if>


<#if is_photos??>
<#--相册插件-->
    <script data-pjax-photo
            src="//cdn.jsdelivr.net/npm/justifiedGallery@3.7.0/dist/js/jquery.justifiedGallery.min.js"></script>
</#if>



<#if settings.visit_statistics!false>
    <script async src="//busuanzi.ibruce.info/busuanzi/2.3/busuanzi.pure.mini.js"></script>
</#if>
