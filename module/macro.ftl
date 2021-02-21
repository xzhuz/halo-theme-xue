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
        <#--样式文件-->
        <#include "styles.ftl">
        <#-- jquery -->
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.2.1/dist/jquery.min.js"></script>
    </head>
    <body class="<#if settings.default_night_mode!false>night</#if>">
    <#include "header.ftl">
    <#nested >
    <#include "footer.ftl">

    </body>
    <#include "plugins.ftl"/>
<#--    <script src="${theme_base!}/source/js/main.js?ver=${.now?long}"></script>-->
        <script src="${theme_base!}/source/js/main.js?ver=202101052201"></script>

    <#include "script.ftl">

    </html>
</#macro>

