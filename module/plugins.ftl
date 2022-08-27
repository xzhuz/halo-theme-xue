<script>
  function initComment() {
    $('script[data-pjax-comment]').each(function () {
      const commentParent = $(this).parent();
      const comment = $(this).remove();
      commentParent.append(comment);
    });
  }
  var configs = {
    autoLoad: true,
    showUserAgent: true,
    darkMode: localStorage.getItem('dark') === 'dark'
  }
</script>
<script src="${theme_base!}/source/js/plugins/vue.min.js" onload="initComment();"></script>
<script src="${'${theme_base!}/source/js/plugins/halo-comment.min.js'}"></script>

<#-- 代码高亮-->
<script src="${theme_base!}/source/highlight.js/highlight.min.js"></script>

<#--其他语言包-->
<#if settings.more_lang_code!false>
  <script src="${theme_base!}/source/highlight.js/highlight.lang.js"></script>
</#if>
<#--代码行数-->
<script src="${theme_base!}/source/highlight.js/linesNumber.js"></script>

<#--标签云-->
<script src="${theme_base!}/source/js/plugins/jqcloud-1.0.4.min.js"></script>

<#-- 图片 -->
<script src="${theme_base!}/source/js/plugins/jquery.fancybox.min.js"></script>

<#--目录-->
<#if settings.post_toc!true>
  <script src="${theme_base!}/source/js/plugins/tocbot.min.js"></script>
</#if>

<#--相册-->
<script src="${theme_base!}/source/js/plugins/isotope.pkgd.min.js"></script>

<#--复制按钮-->
<script src="${theme_base!}/source/js/plugins/clipboard.min.js"></script>

<#--消息弹出框-->
<script src="${theme_base!}/source/js/plugins/qmsg.js"></script>

<script src="${theme_base!}/source/js/plugins/scrollreveal.js"></script>


<#if settings.visit_statistics!false>
  <script async src="//busuanzi.ibruce.info/busuanzi/2.3/busuanzi.pure.mini.js"></script>
</#if>

<script type="text/javascript">
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
      {
        'text': '${tag.name!}',
        'weight': '${tag.postCount!}',
        'link': '${tag.fullPath!}'
      },
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
  
  const loadingGif = '${theme_base!}/source/images/loading.gif';
</script>

${settings.other_script_file!''}
