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
        <script src="${theme_base!}/source/js/jquery.min.js"></script>
    </head>
    <body class="dark p-0 m-0 h-full font-sans bg-white">
    <#include "header.ftl">
    <#nested >
    <#include "footer.ftl">

    </body>
    <#include "plugins.ftl"/>
    <script src="${theme_base!}/source/js/main.js?ver=${theme.version!}"></script>

    <#include "script.ftl">

    </html>
</#macro>

