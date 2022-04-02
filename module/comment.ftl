<#macro comment post,type>
  <section class="comments-area">
    <div class="inner" id="commentInner${post.id}">
      <div id="haloComment${post.id}"></div>
    </div>
  </section>

  <script defer type="application/javascript" data-pjax-comment>
    function renderComment() {
      var haloComment = document.getElementById('haloComment${post.id}');
      if (!haloComment) {
        $('#' + '${post.id?c}').remove();
        $('#commentInner${post.id}').append('<div id="haloComment${post.id}"></div>');
      }
      if (!localStorage.theme) {
        localStorage.setItem('theme', 'light')
      }
      if (typeof Vue === "undefined") {
        // console.error('Vue is not defined')
        return
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