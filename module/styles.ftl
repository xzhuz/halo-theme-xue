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

<#if settings.enable_image_view!false>
  <link rel="stylesheet" href="${theme_base!}/source/css/viewer.min.css">
</#if>
<#if settings.enable_code_highlight!true>
  <link rel="stylesheet"
        href="${theme_base!}/source/highlight.js/styles/${settings.code_style!'tomorrow-night-bright'}.css">
</#if>
<#if settings.enabled_mathjax!true>
  <link rel="stylesheet" href="${theme_base!}/source/css/katex.min.css">
</#if>
<#if settings.Aplayer?? && settings.Aplayer != ''>
  <link rel="stylesheet" href="${theme_base!}/source/css/APlayer.min.css">
</#if>

<#--标签云-->
<link href="${theme_base!}/source/css/jqcloud.min.css" rel="stylesheet">

<link rel="stylesheet" href="${theme_base!}/dist/style.css?ver=${theme.version!}">
<#-- IDEA代码风格 -->
<#if settings.idea_code_style!false>
  <link rel="stylesheet" href="${theme_base!}/src/styles/idea.css?ver=${theme.version!}">
</#if>
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