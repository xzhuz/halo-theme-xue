// 夜间模式
function dayNightSwitch() {
  // 夜晚模式开关
  const daySwitch = $('#daySwitch')
  daySwitch.toggleClass('daySwitch')
  $(document.body).toggleClass('night');
}

document.addEventListener('DOMContentLoaded', function () {
  loadGallery();
  loadHighlight();
  loadCodeLineNumber()
  removeFirstUL()
});


// 图片
function loadGallery() {
  if (document.getElementById('gallery-content')) {
    new Viewer(document.getElementById('gallery-content'), {
      toolbar: true,
    });
  }

  if ($('.justified-gallery').length > 0) {
    if (typeof ($.fn.justifiedGallery) === 'function') {
      if ($('.justified-gallery > p > .gallery-item').length) {
        $('.justified-gallery > p > .gallery-item').unwrap();
      }
      $('.justified-gallery').justifiedGallery({rowHeight: 230, margins: 4});
    }
  }
}

/********************************
 *
 *  文章页面相关
 *
 *******************************/

// 代码高亮
function loadHighlight() {
  $('.md-content pre code').each(function () {
    hljs.highlightBlock(this);
  });
}

function loadCodeLineNumber() {
  // 行号
  $('.md-content pre code.hljs').each(function (i, block) {
    hljs.lineNumbersBlock(this);
  });

}

//获取滚动条距离顶部位置
function getScrollTop () {
  return document.documentElement.scrollTop || document.body.scrollTop;
}

function tocScroll (event) {
  var tocId = '#toc';
  var Obj = $('#tocFlag');

  //判断元素是否存在
  if (Obj.length !== 1) {
    return false;
  }

  var tocFixed = $(tocId);
  var ObjTop = Obj.offset().top - $(window).height() * 0.5;

  // 滚动条离页面顶端的距离
  var scrollTop = getScrollTop();
  var postHeaderHeight = $('#postHeader').height();
  if (scrollTop > postHeaderHeight) {
    tocFixed.show();
  } else {
    tocFixed.hide();
  }

  var tocEle = document.querySelector(tocId);
  if (!tocEle || !tocEle.getBoundingClientRect()) {
    return;
  }
  var tocHeight = tocEle.getBoundingClientRect().height;
  if (scrollTop > ObjTop - tocHeight * 0.5) {
    tocFixed.addClass('toc-right-fixed');
  } else {
    tocFixed.removeClass('toc-right-fixed');
  }

  // 设置目录right
  tocEleRight();

  event.preventDefault();
}

function scrollTocFixed () {
  window.addEventListener('scroll', tocScroll, false);
}

function initToc () {
  var headerEl = 'h1,h2,h3,h4,h5,h6',  //headers
      content = '.md-content';//文章容器
  tocbot.init({
    tocSelector: '#toc',
    contentSelector: content,
    headingSelector: headerEl,
    scrollSmooth: true,
    headingsOffset: 0 - $('#postHeader').height(),
    // scrollSmoothOffset: -80, // 实现点击目录精准跳转到header
    hasInnerContainers: false,
  });

  $('.toc-link').each(function () {
    var linkContent = $(this).html();
    $(this).html('<span class="toc-link-dot"></span>' + linkContent);
  });
  // 设置目录right
  tocEleRight();
}

function tocEleRight () {
  var screenWidth = document.body.clientWidth;
  var tocEle = document.getElementById('toc');
  if (tocEle) {
    tocEle.style.left = (screenWidth - 800) / 2 + 820 + "px";
  }
}

// 因为不使用后端渲染目录, 所以如果在发布文章的时候在文章开头加上 [TOC] 会在文章页面开头有一个ul 标签
// 这里粗暴的去除
function removeFirstUL () {
  var post_content = document.getElementById('write');
  if (!post_content) {
    return;
  }
  var firstNodeName = post_content.firstElementChild.nodeName;
  if (firstNodeName === 'UL') {
    $(post_content.firstElementChild).remove();
  }
}

function getData(e) {
  const path = $(e).attr("path");
  var pageContainer = "#container .pagination-container";
  $.ajax({
    type: "GET",
    url: path,
    beforeSend: function () {
      $(pageContainer).empty();
      $(pageContainer).addClass('loading');
    },
    success: function (data) {
      $(pageContainer).removeClass('loading');
      $(pageContainer).empty();
      let result = $(data).find(pageContainer);
      $(pageContainer).append(result.children());
      let page = '#pagination';
      let pagination = $(data).find(page);
      $(page).empty();
      $(page).append(pagination.children());
    },
    error: function () {
      $(pageContainer).empty();
      $(pageContainer).addClass('loading');
    }
  });
}

