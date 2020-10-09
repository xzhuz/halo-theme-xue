// 夜间模式
function dayNightSwitch() {
  // 夜晚模式开关
  const daySwitch = $("#daySwitch");
  daySwitch.toggleClass("daySwitch");
  $(document.body).toggleClass("night");
}

/**
 * 点击页面处理小屏幕目录事件
 * @param target
 */
function documentClickToc(target) {
  var moonToc = $('#moonToc')
  if (moonToc && moonToc.hasClass('mm-active')) {
    if (target.id && target.id === "moonToc") {
    } else if (target.id && target.id === "moonMenu") {
    } else if (target.id && target.classList.contains('icon-toc')) {
    } else if (target.classList.contains('moon-menu-button')) {
    } else if (target.classList.contains('moon-menu-text')) {
    } else {
      toggleSmallToc()
    }
  }
}

/**
 * 处理目录
 */
function dealContentToc() {
  if (getClientWidth() > 1359) {
    initToc();
    scrollTocFixed();
  } else {
    var smallToc = $('.moon-menu-item.icon-toc');
    if (smallToc) {
      smallToc.toggleClass('hidden');
      // 渲染目录
      initMoonToc()
    }

    $(document).click(function (e) {
      var target = e.target;
      documentClickToc(target);
    });
  }
}

document.addEventListener("DOMContentLoaded", function () {
  // 处理导航菜单
  handleNavMenu();

  // 图片和相册
  // loadGallery();

  // 格式化markdown文章
  const format = formatContent();
  if (!format) {
    loadGallery();
    lazyloadImg();
  }

  // 目录相关
  if (typeof tocbot !== "undefined" && document.getElementById("toc")) {
    dealContentToc();
  }

  // 图片懒加载
  lazyloadImg()
});

/**
 * 处理导航菜单
 */
function handleNavMenu() {
  if (getClientWidth() <= 800) {
    $('#navHeader .nav').addClass('opacity-100').removeClass('opacity-0')
    return;
  }
  document.addEventListener('scroll', handleScrollMenu, false);
}

function handleScrollMenu() {
  if (getClientWidth() <= 800) {
    $('#navHeader .nav').addClass('opacity-100').removeClass('opacity-0')
    return;
  }
  var scrollTop = getScrollTop();
  if (scrollTop > 29) {
    $('#navHeader').addClass('nav-bg-fff')
    $('#navHeader .nav').addClass('opacity-100').removeClass('opacity-0')
    $('#navHeader .collapse-nav').hide()
    $('.collapse-burger').removeClass('open');
  } else {
    $('#navHeader').removeClass('nav-bg-fff')
    $('#navHeader .nav').removeClass('opacity-100').addClass('opacity-0')
    $('#navHeader .collapse-nav').show()
  }
}

function collapseNav() {
  var bugger = $('.collapse-burger');
  bugger.toggleClass('open');
  var nav = $('#navHeader .nav');

  nav.toggleClass('opacity-100')
  if (nav.hasClass('opacity-100')) {
    nav.removeClass('slideOut');
    nav.addClass('slideIn');
  } else {
    nav.addClass('slideOut');
    nav.removeClass('slideIn');
  }
}

// 图片
function loadGallery() {
  if (
      typeof Viewer !== "undefined" &&
      document.getElementById("gallery-content")
  ) {

    new Viewer(document.getElementById("gallery-content"), {
      toolbar: true
    });
  }

  if ($(".justified-gallery").length > 0) {
    if (typeof $.fn.justifiedGallery === "function") {
      if ($(".justified-gallery > p > .gallery-item").length) {
        $(".justified-gallery > p > .gallery-item").unwrap();
      }
      console.log(1231);
      $(".justified-gallery").justifiedGallery({rowHeight: 230, margins: 4});
    }
  }
}

/********************************
 *
 *  文章页面相关
 *
 *******************************/

function scrollTocFixed() {
  document.addEventListener("scroll", tocScroll, false);
}

function removeScrollTocFixed() {
  document.removeEventListener('scroll', tocScroll, false);
}

function loadCodeLineNumber() {
  if (enableLineNumber) {
    $('.md-content  pre>code[class*="language-"]').each(function (i, block) {
      lineNumbersBlock(block);
    });
  }
}

//获取滚动条距离顶部位置
function getScrollTop() {
  return document.documentElement.scrollTop || document.body.scrollTop;
}

function tocScroll(event) {
  var tocId = "#toc";
  var Obj = $("#tocFlag");

  //判断元素是否存在
  if (Obj.length !== 1) {
    return false;
  }

  var tocFixed = $(tocId);
  var ObjTop = Obj.offset().top - $(window).height() * 0.5;

  // 滚动条离页面顶端的距离
  var scrollTop = getScrollTop();
  var postHeaderHeight = $("#postHeader").height();
  if (scrollTop > postHeaderHeight / 2) {
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
    tocFixed.addClass("toc-right-fixed");
  } else {
    tocFixed.removeClass("toc-right-fixed");
  }

  // 设置目录right
  tocEleRight();

  event.preventDefault();
}

function getClientWidth() {
  return document.body.clientWidth;
}

function initToc() {
  var headerEl = "h1,h2,h3,h4,h5,h6", //headers
      content = ".md-content"; //文章容器
  tocbot.init({
    tocSelector: "#toc",
    contentSelector: content,
    headingSelector: headerEl,
    scrollSmooth: true,
    headingsOffset: 0 - $("#postHeader").height(),
    // scrollSmoothOffset: -80, // 实现点击目录精准跳转到header
    hasInnerContainers: false,
  });

  $(".toc-link").each(function () {
    var linkContent = $(this).html();
    $(this).html('<span class="toc-link-dot"></span>' + linkContent);
  });
  // 设置目录right
  tocEleRight();
}

function tocEleRight() {
  var screenWidth = getClientWidth();
  var tocEle = document.getElementById("toc");
  if (tocEle) {
    tocEle.style.left = (screenWidth - 800) / 2 + 820 + "px";
  }
}

function toggleAliPay() {
  $(".qrcode-wechat").addClass("hidden");
  $(".qrcode-alipay").toggleClass("hidden");
  $("#wechat i").removeClass("active-bg");
  $("#alipay i").toggleClass("active-bg");
}

function toggleWeChat() {
  $(".qrcode-alipay").addClass("hidden");
  $(".qrcode-wechat").toggleClass("hidden");
  $("#alipay i").removeClass("active-bg");
  $("#wechat i").toggleClass("active-bg");
}

function scollTo() {
  var postHeight = $("#homeHeader").height();
  window.scroll({top: postHeight, behavior: "smooth"});
}

function generateId() {
  const chars = `ABCDEFGHJKMNPQRSTWXYZabcdefhijkmnprstwxyz`;
  let id = ``;
  for (let i = 0; i < 8; i++) {
    id += chars[Math.floor(Math.random() * chars.length)];
  }
  return id;
}

/**
 * 将文本转成 markdown
 */
function formatContent() {

  var mdContent = document.getElementById("original");
  const persentContent = $("#write");
  if (!mdContent || !persentContent) {
    return;
  }
  // 获取原始html
  let originalContent = mdContent.innerHTML;
  if (typeof originalContent === "undefined") {
    return false;
  }
  // 反转义原始markdown文本
  originalContent = HTMLDecode(originalContent);

  //
  persentContent.empty();
  persentContent.addClass("loading");

  const renderer = new marked.Renderer();

  renderer.heading = function (text, level, raw, slugger) {
    return `<h${level} id=${raw}>${text}</h${level}>`;
  };

  renderer.link = function (href, title, text) {
    return `<a href="${href}" target="_blank" rel="noopener noreferrer">${text}</a>`;
  };

  renderer.image = function (href, title, text) {
    const reg = /([^]*)\[([^]*)\]\(([^]*)\)/;
    const isContainUrl = reg.test(text);
    const imgHtml = `<img class="lazyload" src=${loading} data-src=${href} alt=${text}>`;
    return `<span style="text-align: center;">
              ${
        isContainUrl
            ? getImgWithUrlHtml(text.match(reg), href)
            : imgHtml
    }
            </span>`;
  };

  function getImgWithUrlHtml(textArr, href) {
    return `<img class="lazyload" src=${loading} data-src=${href} alt=${textArr[2]}></a>`;
  }

  renderer.listitem = function (text, task) {
    if (task) {
      return `<li style="list-style: none;">${text}</li>`;
    }
    return `<li>${text}</li>`;
  };

  renderer.blockquote = function (text) {
    text = text.trim();
    // 去掉换行符
    text = text.replace(/[\r\n]/g, "<br/>");
    text = text.replace(/<p>/g, "");
    text = text.replace(/<\/p>/g, "<br>");
    const textArr = text.split("<br>");
    const context = [];
    for (let i = 0; i < textArr.length; i++) {
      if (textArr[i].trim().length === 0) {
        continue;
      }
      let txt = textArr[i].replace(/<br\/>/g, '')
      txt = txt.replace(/<br>/g, '')
      context.push(`<p>${txt}</p>`);
    }
    return `<blockquote>${context.join("")}</blockquote>`;
  };

  renderer.table = function (header, body) {
    if (body) {
      body = "<tbody>" + body + "</tbody>";
    }

    return (
        '<div class="md-table"><table>\n' +
        "<thead>\n" +
        header +
        "</thead>\n" +
        body +
        "</table></div>\n"
    );
  };

  marked.setOptions({
    renderer: renderer,
    highlight: function (code, language) {
      if (enableCodeHighlight) {
        const validLanguage = hljs.getLanguage(language)
            ? language
            : "plaintext";
        return hljs.highlight(validLanguage, code).value;
      }
      return code;
    },
    pedantic: false,
    gfm: true,
    breaks: false,
    sanitize: false,
    smartLists: true,
    smartypants: false,
    xhtml: false,
  });

  persentContent.empty();
  persentContent.removeClass("loading");
  persentContent.html(marked(originalContent.trim()));

  mdContent.remove();
  mdContent = null;
  // 代码行号
  loadCodeLineNumber();

  // 相册
  loadGallery()

  // 数学公式
  renderMath()

  // 图片懒加载
  lazyloadImg()
  return true;
}

/**
 * 反转义 HTML
 * @param text
 * @returns {*}
 * @constructor
 */
function HTMLDecode(text) {
  var arrEntities = {lt: "<", gt: ">", nbsp: " ", amp: "&", quot: '"'};
  return text.replace(/&(lt|gt|nbsp|amp|quot);/gi, function (all, t) {
    return arrEntities[t];
  });
}

/*******************************
 * 右下角按钮相关
 */
function smoothBack2Top() {
  window.scroll({top: 0, behavior: 'smooth'});
}

function smoothBack2Bottom() {
  const offsetHeight = document.documentElement.offsetHeight;
  const scrollHeight = document.documentElement.scrollHeight;
  window.scroll({top: scrollHeight - offsetHeight, behavior: 'smooth'});
}

function ckBack2Top() {
  $('#moonToc').removeClass('mm-active');
  smoothBack2Top();
}

function ckBack2Bottom() {
  $('#moonToc').removeClass('mm-active');
  smoothBack2Bottom();
}

function ckShowContent() {
  toggleSmallToc()

  // 模拟点击事件
  $('.moon-menu-button').trigger("click");
}

function toggleSmallToc() {
  var moonContent = $('#moonToc')
  moonContent.toggleClass('mm-active');

  if (moonContent.hasClass('mm-active')) {
    moonContent.show();
  } else {
    moonContent.hide()
  }
}

function initMoonToc() {
  var headerEl = 'h1,h2,h3,h4,h5,h6',  //headers
      content = '.md-content';//文章容器
  tocbot.init({
    tocSelector: '#moonToc',
    contentSelector: content,
    headingSelector: headerEl,
    scrollSmooth: true,
    isCollapsedClass: '',
    headingsOffset: 0 - ($('#postHeader').height() + 58),
    scrollSmoothOffset: -60,
    hasInnerContainers: false,
  });

  var moonToc = $('#moonToc');
  // 没有生成目录
  if (moonToc && moonToc.children().length === 0) {
    $('.icon-toc').addClass('hidden');
  }
}

function toggleSearchBox() {
  $('#searchBox').toggleClass('hidden');
}

function toggleCircle() {
  var $moonDot = $('g.moon-dot');
  var firstCircle = $moonDot.children('circle:first');
  var lastCircle = $moonDot.children('circle:last');
  var cy = $(firstCircle).attr('cy');
  if (cy === '0') {
    $(firstCircle).attr('cx', '0');
    $(firstCircle).attr('cy', '-.8rem');
    $(lastCircle).attr('cx', '0');
    $(lastCircle).attr('cy', '.8rem');
  } else {
    $(firstCircle).attr('cx', '-.8rem');
    $(firstCircle).attr('cy', '0');
    $(lastCircle).attr('cx', '.8rem');
    $(lastCircle).attr('cy', '0');
  }
}

function ckMoonButton() {
  // 右下角的小点
  toggleCircle();
  $('.moon-menu-items').toggleClass('item-ani');
}

/**
 * 异步获取分页数据
 * @param  e
 */
function getData(e) {
  const path = $(e).attr("path");
  var pageContainer = "#pageContainer";
  $.ajax({
    type: "GET",
    url: path,
    beforeSend: function () {
      $(pageContainer).empty();
      $(pageContainer).addClass("loading");
    },
    success: function (data) {
      $(pageContainer).removeClass("loading");
      $(pageContainer).empty();
      let result = $(data).find(pageContainer);
      $(pageContainer).append(result.children());
      let page = "#pagination";
      let pagination = $(data).find(page);
      $(page).empty();
      $(page).append(pagination.children());
      lazyloadImg()
    },
    error: function () {
      $(pageContainer).empty();
      $(pageContainer).addClass("loading");
    },
  });
}

/**
 * 渲染数学公式
 */
function renderMath() {
  if (openKatex && renderMathInElement && typeof renderMathInElement
      !== 'undefined') {
    if (document.getElementById('write')) {
      renderMathInElement(document.getElementById('write'), katex_config)
    } else if (document.getElementById('tree-hole')) {
      renderMathInElement(document.getElementById('tree-hole'), katex_config)
    }
  }
}

function lazyloadImg() {
  var imgs = document.querySelectorAll('img.lazyload');

  //用来判断bound.top<=clientHeight的函数，返回一个bool值
  function isIn(el) {
    const bound = el.getBoundingClientRect();
    const clientHeight = window.innerHeight;
    return bound.top <= clientHeight;
  }

  //检查图片是否在可视区内，如果不在，则加载
  function check() {
    Array.from(imgs).forEach(function (el) {
      if (isIn(el)) {
        loadImg(el);
      }
    })
  }

  function loadImg(el) {
    const loaded = el['data-loaded']
    if (!loaded) {
      el.src = el.dataset.src;
      el.setAttribute('data-loaded', true)
    }
  }

  window.onload = window.onscroll = function () { //onscroll()在滚动条滚动的时候触发
    check();
  }
}