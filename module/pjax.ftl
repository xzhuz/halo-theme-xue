<#if settings.pjax_enabled!false>
    <script src="https://tanyaodan.com/wp-includes/js/jquery.pjax.js"></script>
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
        if ($("#container").find('.photos-page').length > 0) {
          $.getScript(
              "https://cdn.jsdelivr.net/npm/justifiedGallery@3.7.0/dist/js/jquery.justifiedGallery.min.js",
              function () {
                loadGallery();
              });
        }

        // 重新加载 评论
        $('script[data-pjax-comment]').each(function () {
          var commentParent = $(this).parent()
          var comment = $(this).remove();
          commentParent.append(comment);
        });

        if ($("#container").find('.md-content').length > 0) {
          loadGallery();

          $.when(
              $.getScript(
                  "https://cdn.jsdelivr.net/gh/highlightjs/cdn-release@10.0.0/build/highlight.min.js"),
              $.getScript(
                  "https://cdn.jsdelivr.net/gh/xzzai/static@master/js/highlight.lang.js"),
              $.getScript(
                  "https://cdn.jsdelivr.net/npm/highlightjs-line-numbers.js@2.7.0/dist/highlightjs-line-numbers.min.js"),
              $.Deferred(function (deferred) {
                $(deferred.resolve);
              })).done(function () {
            loadHighlight();
          });
        }

        //重载
        if (typeof _hmt !== 'undefined') {
          // support 百度统计
          _hmt.push(['_trackPageview', location.pathname + location.search]);
        }
        if (typeof ga !== 'undefined') {
          // support google analytics
          ga('send', 'pageview', location.pathname + location.search);
        }

      });

      $(document).on('pjax:error', function () {
        NProgress.done();
      });

      // 标签云
      function renderCloud() {
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

        // 标签云
        var tagCloud = $("#tagCloud");
        if (tagCloud && tagCloud.children().length === 0) {
          tagCloud.jQCloud(tagArray, {autoResize: true, delayedMode: true});
        }

        // 分类云
        var categoryCloud = $("#categoryCloud");
        if (categoryCloud && categoryCloud.children().length === 0) {
          categoryCloud.jQCloud(categoryArray, {autoResize: true, delayedMode: true});
        }
      }
    </script>
</#if>