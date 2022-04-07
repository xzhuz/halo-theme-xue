<style>
  :root {
    --base-hover-color: #f1404b;
    --base-hl-color: #f1404b;
    --base-code-text-color: #a9b7c6;
    
    --text-color: #333333;
    /*夜晚默认*/
    --night-txt-color: #a9a9b3;

    --tw-skew-x: 0;
    --tw-skew-y: 0;
    --tw-scale-x: 1;
    --tw-scale-y: 1;
    --tw-translate-x: 0;
    --tw-translate-y: 0;
    --tw-rotate: 0;
  }

  <#--向英雄致敬-->
  <#if settings.xiang_ying_xiong_zhi_jing!false>
    html {
      -webkit-filter: grayscale(100%);
      -moz-filter: grayscale(100%);
      -o-filter: grayscale(100%);
      filter: progid:DXImageTransform.Microsoft.BasicImage(grayscale=1);
    }
  </#if>
</style>

<#--标签云-->
<link href="${theme_base!}/source/css/jqcloud.min.css" rel="stylesheet">
<#--  中文排版 -->
<link href="${theme_base!}/source/css/heti.min.css" rel="stylesheet">
<link href="${theme_base!}/source/css/katex.min.css" rel="stylesheet">
<link href="${theme_base!}/source/css/jquery.fancybox.min.css" rel="stylesheet">
<link href="${theme_base!}/source/css/qmsg.css" rel="stylesheet">


<link rel="stylesheet" href="${theme_base!}/dist/style.css?ver=${theme.version!}">

<#--代码风格-->
<link rel="stylesheet" href="${theme_base!}/source/highlight.js/styles/atom-one-dark.css">

