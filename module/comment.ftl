<#macro comment target,type>
    <#if !post.disallowComment!false>
        <script src="//cdn.jsdelivr.net/npm/vue@2.6.10/dist/vue.min.js"></script>
        <script src="${options.comment_internal_plugin_js!'//cdn.jsdelivr.net/gh/hshanx/halo-comment-hshan@latest/dist/halo-comment.min.js'}"></script>
        <section class="comments-area">
            <div class="inner" id="commentInner">
                <div id="haloComment"></div>
            </div>
        </section>

        <script type="application/javascript" data-pjax-comment>
            function getLocalStorage(key) {
                var exp = 60 * 60 * 1000; // 一个小时的秒数
                if (localStorage.getItem(key)) {
                    var vals = localStorage.getItem(key); // 获取本地存储的值
                    var dataObj = JSON.parse(vals); // 将字符串转换成JSON对象
                    // 如果(当前时间 - 存储的元素在创建时候设置的时间) > 过期时间
                    var isTimed = (new Date().getTime() - dataObj.timer) > exp;
                    if (isTimed) {
                        console.log("存储已过期");
                        localStorage.removeItem(key);
                        return null;
                    } else {
                        var newValue = dataObj.val;
                    }
                    return newValue;
                } else {
                    return null;
                }
            }
            function renderComment() {
                var  haloComment = document.getElementById('haloComment');
                if (!haloComment) {
                    $('#' + '${target.id?c}').remove();
                    $('#commentInner').append('<div id="haloComment"></div>');
                }

                new Vue({
                    el: '#haloComment',
                    data() {
                        return {
                            configs: {
                                darkMode: getLocalStorage('nightMode')
                            }
                        };
                    },
                    template: `<halo-comment id="${target.id?c}" type="${type}" :configs="JSON.stringify(configs)" />`,
                });
            }

            renderComment();
        </script>
    </#if>
</#macro>