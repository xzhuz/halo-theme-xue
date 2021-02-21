<#if settings.pjax_enabled!false>
    <script src="https://cdn.jsdelivr.net/gh/xzzai/static@master/js/jquery.pjax.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/nprogress@0.2.0/nprogress.min.js"></script>
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/nprogress@0.2.0/nprogress.min.css">
    <script type="text/javascript">
      $(document).pjax(
          'a[href]:not([href^="#"]):not([data-not-pjax]):not([target^="_blank"]), form',
          '#container', {fragment: '#container', timeout: 8000});

      $(document).on('pjax:send', function () {
        NProgress.start();
      })

      $(document).on('pjax:complete', function () {
        NProgress.done();

        // 检查夜间模式
        checkNightMode()

        // 自动切换夜间模式
        if (autoNightMode) {
          autoDayNight();
        }

        // 删除listener
        removeScrollTocFixed();

        // 重新加载 评论
        $('script[data-pjax-comment]').each(function () {
          var commentParent = $(this).parent()
          var comment = $(this).remove();
          commentParent.append(comment);
        });

        if ($('#container').find('.ziyan').length > 0) {
          // 计算时间
          setTimeAgo();

          // 自言代码高亮
          hljsZiYanCode()

        }

        // 存在 markdown 页面的功能
        if ($("#container").find('.md-content').length > 0) {
          // 格式化内容
          // 格式化markdown文章
          const format = formatContent();

          // 目录相关
          if (typeof tocbot !== "undefined" && document.getElementById("toc")) {
            dealContentToc();
          }

          if ($('#container').find('.md-content').length > 0 && format) {
            return;
          } else {
            loadGallery();
            lazyloadImg();
          }


        }

        // 相册页面功能
        if ($("#container").find('.photos-page').length > 0) {
          loadGallery();
        }

        // 图片懒加载
        lazyloadImg()

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
          if (typeof $.fn.jQCloud !== "function") {
            $.getScript(
                "https://cdn.jsdelivr.net/gh/xzzai/static@master/js/jqcloud-1.0.4.min.js",
                function () {
                  renderTagCloud();
                  renderCategoryCloud();
                });
          } else {
            renderTagCloud();
            renderCategoryCloud();
          }

        }

        ${settings.common_js!''};

      });

      $(document).on('pjax:error', function () {
        NProgress.done();
      });

    </script>
</#if>