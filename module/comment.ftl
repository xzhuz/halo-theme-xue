<#macro comment post,type>
    <#if !post.disallowComment!false>
        <script src="${theme_base!}/source/js/vue.min.js"></script>
        <script src="${options.comment_internal_plugin_js!'//cdn.jsdelivr.net/gh/halo-dev/halo-comment@latest/dist/halo-comment.min.js'}"></script>
      <section class="comments-area">
        <div class="inner" id="commentInner">
          <div id="haloComment"></div>
        </div>
      </section>

      <script type="application/javascript" data-pjax-comment>
        function renderComment() {
          var  haloComment = document.getElementById('haloComment');
          if (!haloComment) {
            $('#' + '${post.id?c}').remove();
            $('#commentInner').append('<div id="haloComment"></div>');
          }
          if (!localStorage.theme) {
            localStorage.setItem('theme', 'light')
          }
          new Vue({
            el: '#haloComment',
            data() {
              return {
                configs: {
                  darkMode: localStorage.theme === 'dark'
                }
              };
            },
            template: `<halo-comment id="${post.id?c}" type="${type}" :configs="JSON.stringify(configs)" />`,
          });
        }

        renderComment();
      </script>
    </#if>
</#macro>