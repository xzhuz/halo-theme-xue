<#macro layout title,keywords,description>
    <!DOCTYPE html>
    <html lang="zh">
    <head>
        <meta charset="UTF-8">
        <meta name="keywords" content="${keywords!}"/>
        <meta name="description" content="${description!}"/>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
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
                --header-bg-color: #fff;
                --header-link-color: #504b4d;
                --base-color: #4facfe;
                --base-hover-color: #4facfe;
                --cd-hover-color: #E53A40;
                --btn-pri-bg-color: #E53A40;
                --base-hl-color: #E53A40;
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
                --night-page-a-color: #fffff;
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
                .home-page .bg-cover {
                    height: 100vh !important;
                }
            }

            </#if>

        </style>


        <#--              media='all'/>-->
        <#-- css库 -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/tailwindcss@1.4.6/dist/tailwind.min.css">
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
            <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/katex@0.12.0/dist/katex.min.css">
        </#if>
        <#if settings.Aplayer?? && settings.Aplayer != ''>
            <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/aplayer@1.10.1/dist/APlayer.min.css">
        </#if>

        <#-- 所有的css 开发用 -->
        <#--        <link rel="stylesheet" href="${theme_base!}/dist/style.min.css?ver=${.now?long}">-->
        <#--         发布用 -->
        <link rel="stylesheet" href="${theme_base!}/dist/style.min.css?ver=202007251722">
        <script type="application/javascript">
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

    <#-- 暗夜模式 -->
    <#if settings.auto_night_mode!true>
        <script type="text/javascript">
            var autoNightModeOpen = true;
        </script>
    </#if>
    <#--        <script src="${theme_base!}/source/js/_plugins/utils.js?ver=${.now?long}"></script>-->
    <#--        &lt;#&ndash;模态框&ndash;&gt;-->
    <#--        <script src="${theme_base!}/source/js/_plugins/modal.js?ver=${.now?long}"></script>-->
    <#--        &lt;#&ndash;切换白天/夜晚模式&ndash;&gt;-->
    <#--        <script src="${theme_base!}/source/js/_plugins/night-mode.js?ver=${.now?long}"></script>-->
    <#--        <!-- 右下角按钮&ndash;&gt;-->
    <#--        <script src="${theme_base!}/source/js/_plugins/moon-menu.js?ver=${.now?long}"></script>-->
    <#--        &lt;#&ndash; 相册相关的js &ndash;&gt;-->
    <#--        <script src="${theme_base!}/source/js/gallery.js?ver=${.now?long}"></script>-->
    <#--        &lt;#&ndash;     文章页样式&ndash;&gt;-->
    <#--        <script src="${theme_base!}/source/js/post.js?ver=${.now?long}"></script>-->

    <#--    所有的js-->
    <script src="${theme_base!}/dist/e43a18a7bb2256e8bf0a8dd9c035ccd2.js?ver=202007251722"></script>

    <script src="${theme_base!}/source/js/post.js?ver=202007251722"></script>
    <#include "script.ftl">
    </html>
</#macro>

