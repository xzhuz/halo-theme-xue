"use strict";

// 夜间模式
function toggleDarkSwitch() {
  const daySwitch = $("#daySwitch");
  daySwitch.toggleClass("daySwitch");
  $(document.body).toggleClass("dark");
  $('#navHeader').addClass('bg-transparent').removeClass('shadow-md')

  handleScrollMenu()

  checkLocalStorage()
 renderComment()
}

function checkLocalStorage() {
  if (!localStorage.theme) {
    localStorage.setItem('theme', 'light')
  }
  if ($(document.body).hasClass('dark')) {
    localStorage.setItem('theme', 'dark')
  } else {
    localStorage.setItem('theme', 'light')
  }
}

/**
 * 自动切换夜间模式
 */
function toggleDarkMode() {
 
  if (window.matchMedia && window.matchMedia(
    '(prefers-color-scheme: dark)').matches) {
    $("#daySwitch").removeClass("daySwitch");
    $(document.body).addClass("dark");
  } else {
    $("#daySwitch").addClass("daySwitch");
    $(document.body).removeClass("dark");
  }
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
  const dark = $(document.body).hasClass("dark");
  const scrollTop = getScrollTop();
  if (scrollTop > 29) {
    if (dark) {
      $('#navHeader').addClass('dark:bg-gray-800').removeClass('bg-transparent').addClass('shadow-md')
      $('.link').addClass('text-gray-100').removeClass('text-gray-800')
    } else {
      $('#navHeader').addClass('bg-white').removeClass('bg-transparent').addClass('shadow-md').removeClass('dark:bg-gray-800')
      $('.link').addClass('text-gray-800').removeClass('text-gray-100')
    }
  } else {
    $('#navHeader').addClass('bg-transparent').removeClass('dark:bg-gray-800').removeClass('bg-white').removeClass('bg-transparent').removeClass('shadow-md')
    $('.link').addClass('text-gray-100').removeClass('text-gray-800')
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

//获取滚动条距离顶部位置
function getScrollTop() {
  return document.documentElement.scrollTop || document.body.scrollTop;
}

function tocScroll(event) {
  const tocId = "#toc";
  const Obj = $("#tocFlag");

  //判断元素是否存在
  if (Obj.length !== 1) {
    return false;
  }

  const tocFixed = $(tocId);
  const ObjTop = Obj.offset().top - $(window).height() * 0.5;

  // 滚动条离页面顶端的距离
  const scrollTop = getScrollTop();
  const postHeaderHeight = $("#postHeader").height();
  if (scrollTop > postHeaderHeight / 2) {
    tocFixed.show();
  } else {
    tocFixed.hide();
  }

  const tocEle = document.querySelector(tocId);
  if (!tocEle || !tocEle.getBoundingClientRect()) {
    return;
  }
  const tocHeight = tocEle.getBoundingClientRect().height;
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
  const headerEl = "h1,h2,h3,h4,h5,h6", //headers
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

  $('a[class*="node-name--H"]').each(function () {
    // var cls = $(this).getAttribute('class');
    // console.log(cls)
    const linkContent = $(this).html();
    $(this).html(`<span class="toc-link-dot"></span>${linkContent}`);
  });

  // 设置目录right
  tocEleRight();
}

function tocEleRight() {
  const screenWidth = getClientWidth();
  const tocEle = document.getElementById("toc");
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
      lazyloadImg();
      if ($(data).find(".ziyan")) {

        // 自言代码高亮
        hljsZiYanCode()

      }
    },
    error: function () {
      $(pageContainer).empty();
      $(pageContainer).addClass("loading");
    },
  });
}

function likeJournal(e) {
  if ($(e).hasClass('liked')) {
    return;
  }
  const path = $(e).data('path')
  $.ajax({
    type: "post",
    url: path,
    data: "{}",
    contentType: "application/json",
    dataType: "json",
    success: function (data) {
      $(e).addClass('liked')
      $(e).removeAttr('onclick');
      var count = $(e).siblings('.is-reaction-count')
      var likeCount = parseInt(count.html())
      $(e).siblings('.is-reaction-count').html(likeCount + 1);
    },
    error: function (msg) {
    }
  })
}

function commentJournal(e) {

}

/**
 * 自言查看更多
 * @param e
 */
function getMore(e) {
  const path = $(e).attr("path");
  var moreContainer = "#moreContainer";
  var moreLoading = '#pagination';
  $.ajax({
    type: "GET",
    url: path,
    beforeSend: function () {
      $(moreLoading).empty();
      $(moreLoading).addClass("loading");
    },
    success: function (data) {
      $(moreLoading).removeClass("loading");
      $(moreLoading).empty();
      let result = $(data).find(moreContainer);
      $(moreContainer).append(result.children());
      let page = "#pagination";
      let pagination = $(data).find(page);
      $(page).empty();
      $(page).append(pagination.children());
      if ($(data).find(".ziyan")) {
        // 计算时间
        // setTimeAgo();

        // 自言代码高亮
        hljsZiYanCode()
      }
    },
  });
}

/**
 * 懒加载图片
 */
function lazyloadImg() {
  const imgs = document.querySelectorAll('img.lazyload');
  const randomImgs = document.querySelectorAll('img.img-random');

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

    Array.from(randomImgs).forEach(function (el) {
      if (isIn(el)) {
        loadRandomImgs(el);
      }
    })
  }

  function loadImg(el) {
    const loaded = el.getAttribute('data-loaded')
    if (!loaded) {
      el.src = el.dataset.src;
      el.setAttribute('data-loaded', true)
    }
  }

  function loadRandomImgs(el) {
    const loaded = el.getAttribute('data-loaded')
    if (!loaded) {
      var index = el.getAttribute('index');
      var imgIndex = !index ? new Date().getSeconds() : index;
      if (el.classList.contains('img-random') && typeof photos !== 'undefined' && photos.length > 0) {
        el.src = photos[imgIndex % photos.length];
      }
      el.setAttribute('data-loaded', true)
    }
  }

  check();
  window.onload = window.onscroll = function () { //onscroll()在滚动条滚动的时候触发
    check();
  }
}

/**
 * 计算时间
 * @param time
 * @returns {string|*}
 */
function timeAgo(time) {
  const currentTime = new Date().getTime();
  const between = currentTime - time;
  const days = Math.floor(between / (24 * 3600 * 1000));
  if (days === 0) {
    const leave1 = between % (24 * 3600 * 1000);
    const hours = Math.floor(leave1 / (3600 * 1000));
    if (hours === 0) {
      const leave2 = leave1 % (3600 * 1000);
      const minutes = Math.floor(leave2 / (60 * 1000));
      if (minutes === 0) {
        const leave3 = leave2 % (60 * 1000);
        const seconds = Math.round(leave3 / 1000);
        return seconds + ' 秒前'
      }
      return minutes + ' 分钟前'
    }
    return hours + ' 小时前'
  }
  if (days < 0) {
    return '刚刚'
  }
  if (days < 1) {
    return days + ' 天前'
  } else {
    return formatDate(time, 'yyyy/MM/dd hh:mm');
  }
}

/**
 * 格式化时间
 * @param date
 * @param fmt
 * @returns {*}
 */
function formatDate(date, fmt) {
  date = new Date(date);
  if (/(y+)/.test(fmt)) {
    fmt = fmt.replace(RegExp.$1,
      (date.getFullYear() + '').substr(4 - RegExp.$1.length));
  }
  let o = {
    'M+': date.getMonth() + 1,
    'd+': date.getDate(),
    'h+': date.getHours(),
    'm+': date.getMinutes(),
    's+': date.getSeconds()
  };
  for (let k in o) {
    if (new RegExp(`(${k})`).test(fmt)) {
      let str = o[k] + '';
      fmt = fmt.replace(RegExp.$1,
        (RegExp.$1.length === 1) ? str : padLeftZero(str));
    }
  }
  return fmt;
}

/**
 *
 * @param str
 * @returns {string}
 */
function padLeftZero(str) {
  return ('00' + str).substr(str.length);
}

/**
 * 设置时间
 */
function setTimeAgo() {
  $('.time-ago').each(function () {
    const time = $(this).attr('time');
    const timeStr = timeAgo(new Date(time));
    $(this).html(timeStr);
  });
}

/**
 * 自言代码高亮
 */
function hljsZiYanCode() {
  $('.ziyan .md-content pre code').each(function () {
    hljs.highlightBlock(this);
  });
}

/**
 * 获取本地
 * @param key
 * @returns {null|*}
 */
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

function isQuotaExceeded(e) {
  var quotaExceeded = false;
  if (e) {
    if (e.code) {
      switch (e.code) {
        case 22:
          quotaExceeded = true;
          break;
        case 1014: // Firefox
          if (e.name === 'NS_ERROR_DOM_QUOTA_REACHED') {
            quotaExceeded = true;
          }
          break;
      }
    } else if (e.number === -2147024882) { // IE8
      quotaExceeded = true;
    }
  }
  return quotaExceeded;

}

function setLocalStorage(key, value) {
  var curtime = new Date().getTime(); // 获取当前时间 ，转换成JSON字符串序列
  var valueDate = JSON.stringify({
    val: value,
    timer: curtime
  });
  try {
    localStorage.removeItem(key)
    localStorage.setItem(key, valueDate);
  } catch (e) {
    // 兼容性写法
    if (isQuotaExceeded(e)) {
      console.log("Error: 本地存储超过限制");
      localStorage.clear();
    } else {
      console.log("Error: 保存到本地存储失败");
    }
  }
}

// 相册页面
function gallery() {

  const $photoPage = $(".photos-page");
  // 判断当前是否为图库界面
  if ($photoPage.length < 1) {
    return;
  }
  // 渲染图库信息
  const $masonrys = $(".masonry-gallery.gallery");

  const option = {
    masonry: {
      gutter: 10,
    },
    // layoutMode: 'masonry',
    // sortBy: 'name',
    // percentPosition: true,
    itemSelector: ".gallery-item",
  };
  $masonrys.find("img.lazyload").on('load', function () {
    $masonrys.isotope(option);
  })

  $("#gallery-filter li a").on("click", function () {
    $("#gallery-filter li a").removeClass("active");
    $(this).addClass("active");
    var dataFilter = $(this).data("filter");
    $masonrys.isotope({
      filter: dataFilter,
    });
    return false;
  });
}

function highLightCode() {
  document.querySelectorAll('pre code').forEach((el) => {
    // 在页面上显示这个代码块的语言
    var cls = el.getAttribute('class');
    if (cls !== undefined && cls !== null) {
      var langs = cls.split(' ');
      if (langs !== undefined && langs !== null) {
        el.setAttribute('data-language', langs[0].replace('language-', ''))
      }
    }
    hljs.highlightBlock(el);
  });
}

function setCodeLineNumber() {
  $('.md-content  pre>code[class*="language-"]').each(function (i, block) {
    lineNumbersBlock(block);
  });
}


function toBigImg() {
  $(".opacityBottom").addClass("opacityBottom");//添加遮罩层
  $(".opacityBottom").show();
  $("html,body").addClass("none-scroll");//下层不可滑动
  $(".bigImg").addClass("bigImg");//添加图片样式
  $(".opacityBottom").click(function () {//点击关闭
    $("html,body").removeClass("none-scroll");
    $(".opacityBottom").remove();
  });
}

function clickToZoomImg() {
  $('img').click(function () {
    //获取图片路径
    var imgsrc = $(this).attr("src");
    var opacityBottom = '<div class="opacityBottom" style = "display:none"><img class="bigImg" src="' + imgsrc + '"></div>';
    $(document.body).append(opacityBottom);
    toBigImg();//变大函数
  });
}


$(function () {
  // 点击方法图片
  clickToZoomImg();

  toggleDarkMode();

  // 处理导航菜单
  handleNavMenu();

  // 处理目录
  dealContentToc()

  // 高亮代码
  highLightCode()

  // 设置代码行号
  setCodeLineNumber()

  // 相册
  gallery()

  // 图片懒加载
  lazyloadImg();

  if ($('#container').find('.ziyan').length > 0) {

    // 自言代码高亮
    hljsZiYanCode()
  }
});
