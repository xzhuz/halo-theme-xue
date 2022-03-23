<style>
  :root {
    --header-bg-color: #fff;
    --base-hover-color: #f1404b;
    --base-hl-color: #f1404b;
    --page-text-color: #fff;
    --cover-no-img-bg: #fff;
    --cover-default-bg: #101012;
    --menu-btn-color: #52616a;
    --header-sub-bg-color: #f0f5f9;
    --header-sub-hover-bg-color: #c9d6de;
    --base-color: #4facfe;
    --btn-pri-bg-color: #E53A40;
    --base-code-text-color: #a9b7c6;
    --base-code-block-bg-color: #282c34;


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
    --night-code-bg-color: #282c34;
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

  <#--  <#if settings.enabled_index_cover_height!true>-->
  <#--  @media only screen and (min-width: 861px) {-->
  <#--    .home-cover {-->
  <#--      height: 100vh !important;-->
  <#--    }-->
  <#--  }-->

  <#--  </#if>-->
</style>

<#--标签云-->
<link href="${theme_base!}/source/css/jqcloud.min.css" rel="stylesheet">
<#--  中文排版 -->
<link href="${theme_base!}/source/css/heti.min.css" rel="stylesheet">
<link href="${theme_base!}/source/css/katex.min.css" rel="stylesheet">
<link href="${theme_base!}/source/css/lightGallery.css" rel="stylesheet">


<link rel="stylesheet" href="${theme_base!}/dist/style.css?ver=${theme.version!}">

<#--代码风格-->
<link rel="stylesheet" href="${theme_base!}/source/highlight.js/styles/atom-one-dark.css">

