<#macro layout title,keywords,description>
    <!DOCTYPE html>
    <html lang="zh">
    <head>
        <meta charset="UTF-8">
        <meta name="keywords" content="${keywords!}"/>
        <meta name="description" content="${description!}"/>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport"
              content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
        <@global.head />
        <title>${title}</title>

        <#--  公共的js,必须写到这边,因为有配置项 -->
        <style type="text/css">
          :root {
            --base-bg-color: #fff;
            --header-bg-color: #fff;
            --link-color: #52616a;
            --header-text-color: #252c41;
            --header-link-color: #252c41;
            --toc-active-color: #dddfe6;
            --base-hover-color: #f1404b;
            --base-hl-color: #f1404b;
            --page-text-color: #fff;
            --cover-no-img-bg: #fff;
            --cover-default-bg: #101012;
            --menu-btn-color: #52616a;
            --header-sub-bg-color: #f0f5f9;
            --header-sub-hover-bg-color: #c9d6de;
            --base-color: #4facfe;
            --cd-hover-color: #E53A40;
            --btn-pri-bg-color: #E53A40;
            --base-txt-color: #363636;


            /*--btn-pri-bg-color: #ff5f5f;*/
            --text-color: #333333;
            --text-hover-color: #4facfe;
            --toc-bg-color: #8e8787;
            /*夜晚默认*/
            --night-toc-bg-color: #e5e5e5;
            --night-tag-txt-color: #e5e5e5;
            --night-tag-bg-color: #555;
            --night-link-card-bg-color: rgba(0, 0, 0, .4);
            --night-background: #292a2d;
            --night-txt-color: #a9a9b3;
            --night-input-backgrround: #2d2d2d;
            --night-code-txt-color: #c5c8c6;
            --night-code-color: #969896;
            --night-code-bg-color: #2d2d2d;
            --night-code-hljs-string-color: #0857b3;
            --night-page-a-color: #fff;
            --monospace: "Lucida Console", Consolas, "Courier", monospace;
          }

          <#--向英雄致敬-->
          <#if settings.xiang_ying_xiong_zhi_jing!false>
          html {
            -webkit-filter: grayscale(100%);
            -moz-filter: grayscale(100%);
            -ms-filter: grayscale(100%);
            -o-filter: grayscale(100%);
            filter: grayscale(100%);
            filter: progid:DXImageTransform.Microsoft.BasicImage(grayscale=1);
          }

          </#if>

          <#if settings.enabled_index_cover_height!true>
          @media only screen and (min-width: 861px) {
            .home-cover {
              height: 100vh !important;
            }
          }

          </#if>
        </style>


        <link rel="stylesheet"
              href="https://cdn.jsdelivr.net/npm/tailwindcss@1.4.6/dist/tailwind.min.css">

        <#if settings.enable_image_view!false>
            <link rel="stylesheet"
                  href="https://cdn.jsdelivr.net/npm/viewerjs@1.5.0/dist/viewer.min.css">
        </#if>
        <#if settings.enable_code_highlight!true>
            <link rel="stylesheet"
                  href="https://cdn.jsdelivr.net/npm/highlight.js@10.1.2/styles/${settings.code_style!'tomorrow-night-bright'}.css">
        </#if>
        <#if settings.enabled_mathjax!true>
            <link rel="stylesheet"
                  href="https://cdn.jsdelivr.net/npm/katex@0.12.0/dist/katex.min.css"
                  integrity="sha384-AfEj0r4/OFrOo5t7NnNe46zW/tFgW6x/bCJG8FqQCEo3+Aro6EYUG4+cU+KJWu/X"
                  crossorigin="anonymous">
        </#if>
        <#if settings.Aplayer?? && settings.Aplayer != ''>
            <link rel="stylesheet"
                  href="https://cdn.jsdelivr.net/npm/aplayer@1.10.1/dist/APlayer.min.css">
        </#if>

        <#--标签云-->
        <link href="https://cdn.jsdelivr.net/gh/xzzai/static@master/css/jqcloud.min.css"
              rel="stylesheet">

        <#--  <link rel="stylesheet" href="${theme_base!}/dist/style.min.css?ver=${.now?long}">  -->
        <link rel="stylesheet" href="${theme_base!}/dist/style.min.css?ver=202012182202">
        <#if settings.list_show_date!true>
            <style type="text/css">
              .posts-list .post:hover .post-preview {
                transform: translateY(0);
              }

              .posts-list .post:hover .post-date {
                transform: translateY(100%);
              }

              .posts-list .post-preview {
                transform: translateY(-100%);
              }
            </style>
        <#else>
            <style type="text/css">
              .posts-list .post:hover .post-preview {
                transform: translateY(100%);
              }

              .posts-list .post:hover .post-date {
                transform: translateY(0);
              }

              .posts-list .post-date {
                transform: translateY(-100%);
              }
            </style>
        </#if>
        <#-- IDEA代码风格 -->
        <#if settings.idea_code_style!false>
            <link rel="stylesheet" href="${theme_base!}/dist/idea.css?ver=202012102234">
        </#if>
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.2.1/dist/jquery.min.js"></script>
    </head>
    <body class="<#if settings.default_night_mode!false>night</#if>">
    <#include "header.ftl">
    <#nested >
    <#include "footer.ftl">

    </body>
    <#include "plugins.ftl"/>
<#--    <script src="${theme_base!}/source/js/main.js?ver=${.now?long}"></script>-->
        <script src="${theme_base!}/source/js/main.js?ver=202012182202"></script>

    <#include "script.ftl">

    </html>
</#macro>

