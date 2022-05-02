<#macro layout title>
  <!DOCTYPE html>
  <html lang="zh" class="p-0 m-0 h-full text-base sm:text-sm">
  <head>
    <meta charset="UTF-8">
    <meta name="keywords" content="${meta_keywords!}"/>
    <meta name="description" content="${meta_description!}"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <@global.head />
    <title>${title}</title>
    <#include "styles.ftl">
    <script src="${theme_base!}/source/js/plugins/jquery.min.js"></script>
  </head>
  <body class="p-0 m-0 h-full font-sans">
  <div class="flex flex-col h-full">
    <#include "header.ftl">
    <div class="bg-gray-50 dark:bg-gray-900" style="flex: 1 0 auto;">
    <#nested >
    </div>
    <#include "footer.ftl">
  </div>
  </body>
  <#include "plugins.ftl"/>
  <script src="${theme_base!}/source/js/utils.js?ver=${theme.version!}"></script>
  <script src="${theme_base!}/source/js/main.js?ver=${theme.version!}"></script>
  <#include "script.ftl">

  </html>
</#macro>

