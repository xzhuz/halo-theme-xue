<#if settings.pjax_enabled!false>
  <script src="${theme_base!}/source/js/plugins/jquery.pjax.js"></script>
  <script src="${theme_base!}/source/js/plugins/nprogress.min.js"></script>
  <link rel="stylesheet" href="${theme_base!}/source/css/nprogress.min.css">
  <script type="text/javascript">
    $(document).pjax(
      'a[href]:not([href^="#"]):not([data-not-pjax]):not([target^="_blank"]), form',
      '#container', {fragment: '#container', timeout: 8000});

    $(document).on('pjax:send', function () {
      NProgress.start();
    })

    $(document).on('pjax:complete', function () {
      NProgress.done();
      
      xueContext.wrapImage();

      xueContext.handleNavActive();

      // 重新加载 评论
      $('script[data-pjax-comment]').each(function () {
        const commentParent = $(this).parent();
        const comment = $(this).remove();
        commentParent.append(comment);
      });

      // 存在 markdown 页面的功能
      if ($("#container").find('.md-content').length > 0) {

        // 高亮代码
        xueContext.highlightCode()

        // 设置代码行号
        // xueContext.setCodeLineNumber()
        
        // 目录相关
        if (typeof tocbot !== "undefined" && document.getElementById("toc")) {
          xueContext.handleContentToc();
        }
      }

      // 相册页面功能
      if ($("#container").find('.photos-page').length > 0) {
        xueContext.gallery()
      }

      // 图片懒加载
      xueContext.lazyloadImage()

      //重载
      if (typeof _hmt !== 'undefined') {
        // support 百度统计
        _hmt.push(['_trackPageview', location.pathname + location.search]);
      }

      if (typeof ga !== 'undefined') {
        // support google analytics
        ga('send', 'pageview', location.pathname + location.search);
      }

      if ($('#container').find('.jqcloud').length > 0) {
        renderTagCloud();
        renderCategoryCloud();

      }

      ${settings.common_js!''};

    });

    $(document).on('pjax:error', function () {
      NProgress.done();
    });

  </script>
</#if>