<#macro layout title,keywords,description>
    <!DOCTYPE html>
    <html lang="zh">
    <head>
        <meta charset="UTF-8">
        <meta name="keywords" content="${keywords!}"/>
        <meta name="description" content="${description!}"/>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <@global.head />
        <title>${title}</title>

        <#--  不打印错误日志  -->
        <script language=javascript>
            <!--
            window.onerror = function () {
                return true;
            }
            // -->
        </script>

        <#--  公共的js,必须写到这边,因为有配置项 -->
        <style type="text/css">
            :root {
                --base-color: #2474b5;
                --text-color: #333333;
                --text-hover-color: #B5D6FC;
                --toc-bg-color: #8e8787;
                --night-toc-bg-color: #e5e5e5;
                --select-text-bg-color: #B5D6FC;
                --select-text-font-color: auto;
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

        </style>

        <#--   font-awesome css -->
        <#--    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/css/bootstrap.min.css">-->
        <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/font-awesome@4.7.0/css/font-awesome.min.css" type='text/css'
              media='all'/>
        <#-- css库 -->
        <link rel="stylesheet" href="https://unpkg.com/tailwindcss@^1.0/dist/tailwind.min.css">
        <#-- 引入的头部header -->
        <link rel="stylesheet" href="https://cdn.rawgit.com/balzss/luxbar/ae5835e2/build/luxbar.min.css">
        <#-- 图片预览   -->
        <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/viewerjs@1.5.0/dist/viewer.min.css">
        <!-- 相册 -->
        <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/lightgallery@1.6.8/dist/css/lightgallery.min.css">
        <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/justifiedGallery@3.7.0/dist/css/justifiedGallery.min.css">
        <#--  代码高亮样式  -->
        <#--    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/highlight.js@10.1.1/styles/atom-one-light.css">-->
        <#--    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/highlight.js@10.1.1/styles/github.css">-->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/highlight.js@10.1.1/styles/github-gist.css">

        <#if settings.enabled_mathjax!true>
            <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/katex@0.11.1/dist/katex.min.css" >
        </#if>

        <#-- 所有的css -->
        <link rel="stylesheet" href="${theme_base!}/source/css/style.css?ver=${.now?long}">
        <#--  <link rel="stylesheet" href="${theme_base!}/source/css/style.less">  -->
        <script language=javascript>
            <!--
            window.onerror = function () {
                return true;
            }
            // -->
        </script>
    </head>
    <body>

    <#include "header.ftl">

    <#nested >

    <#include "menu.ftl">
    <#include "footer.ftl">


    <#--<@global.footer />-->
    </body>
    <#-- jquery工具类 -->
    <script src="//cdn.jsdelivr.net/npm/jquery@3.2.1/dist/jquery.min.js"></script>
    <#-- icon -->
    <script defer src="https://use.fontawesome.com/releases/v5.3.1/js/all.js"></script>


    <#-- 暗夜模式 -->
    <#if settings.auto_night_mode!true>
        <script type="text/javascript">
            var autoNightModeOpen = true;
        </script>
    </#if>
    <script src="${theme_base!}/source/js/index.js?ver=${.now?long}"></script>
    <script src="${theme_base!}/source/js/_plugins/utils.js?ver=${.now?long}"></script>
    <#--模态框-->
    <script src="${theme_base!}/source/js/_plugins/modal.js?ver=${.now?long}"></script>
    <#--  顶部菜单  -->
    <script src="${theme_base!}/source/js/_plugins/simply-nav.js?ver=${.now?long}"></script>
    <#--切换白天/夜晚模式-->
    <script src="${theme_base!}/source/js/_plugins/night-mode.js?ver=${.now?long}"></script>
    <!-- 右下角按钮-->
    <script src="${theme_base!}/source/js/_plugins/moon-menu.js?ver=${.now?long}"></script>


    <#-- 文章页样式 -->
    <script src="${theme_base!}/source/js/post.js?ver=${.now?long}"></script>

    <#include "script.ftl">
    </html>
</#macro>

