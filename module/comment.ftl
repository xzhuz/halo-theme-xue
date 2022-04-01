<#macro comment post,type>
  <script src="${theme_base!}/source/js/plugins/vue.min.js"></script>
  <script src="${options.comment_internal_plugin_js!'${theme_base!}/source/js/plugins/halo-comment.min.js'}"></script>
  <section class="comments-area">
    <div class="inner" id="commentInner${post.id}">
      <div id="haloComment${post.id}"></div>
    </div>
  </section>

  <script type="application/javascript" data-pjax-comment>
    function renderComment() {
      var haloComment = document.getElementById('haloComment${post.id}');
      if (!haloComment) {
        $('#' + '${post.id?c}').remove();
        $('#commentInner${post.id}').append('<div id="haloComment${post.id}"></div>');
      }
      if (!localStorage.theme) {
        localStorage.setItem('theme', 'light')
      }
      new Vue({
        el: '#haloComment${post.id}',
        data() {
          return {
            configs: {
              darkMode: localStorage.getItem('theme') === 'dark'
            }
          };
        },
        template: `<halo-comment id="${post.id?c}" type="${type}" :configs="JSON.stringify(configs)" />`,
      });
    }

    renderComment();
  </script>
</#macro>