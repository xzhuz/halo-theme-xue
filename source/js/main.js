// 夜间模式
function dayNightSwitch() {
  // 夜晚模式开关
  const daySwitch = $("#daySwitch");
  daySwitch.toggleClass("daySwitch");
  $(document.body).toggleClass("night");
}

document.addEventListener("DOMContentLoaded", function () {
  // 图片和相册
  loadGallery();

  formatContent();

  // loadHighlight();
  // 代码行号
  // loadCodeLineNumber();

  // toc
  if (typeof tocbot !== "undefined" && document.getElementById("toc")) {
    initToc();
    scrollTocFixed();
  }
});

// 图片
function loadGallery() {
  if (
    typeof Viewer !== "undefined" &&
    document.getElementById("gallery-content")
  ) {
    new Viewer(document.getElementById("gallery-content"), {
      toolbar: true,
    });
  }

  if ($(".justified-gallery").length > 0) {
    if (typeof $.fn.justifiedGallery === "function") {
      if ($(".justified-gallery > p > .gallery-item").length) {
        $(".justified-gallery > p > .gallery-item").unwrap();
      }
      $(".justified-gallery").justifiedGallery({ rowHeight: 230, margins: 4 });
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
  if (enableCodeHighlight) {
    $(".md-content pre code").each(function () {
      hljs.highlightBlock(this);
    });
  }
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
  console.log(
    scrollTop,
    ObjTop,
    tocHeight,
    scrollTop > ObjTop - tocHeight * 0.5
  );
  if (scrollTop > ObjTop - tocHeight * 0.5) {
    tocFixed.addClass("toc-right-fixed");
  } else {
    tocFixed.removeClass("toc-right-fixed");
  }

  // 设置目录right
  tocEleRight();

  event.preventDefault();
}

function scrollTocFixed() {
  window.addEventListener("scroll", tocScroll, false);
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
  var screenWidth = document.body.clientWidth;
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
  window.scroll({ top: postHeight, behavior: "smooth" });
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
  const originalContent = mdContent.innerText;
  if (typeof originalContent === "undefined") {
    return;
  }

  persentContent.empty();
  persentContent.addClass("loading");

  const renderer = new marked.Renderer();

  renderer.heading = function (text, level) {
    // const id = generateId();
    return `<h${level} id="${text}">${text}</h${level}>`;
  };

  renderer.link = function (href, title, text) {
    return `<a href="${href}" target="_blank" rel="noopener noreferrer">${text}</a>`;
  };

  renderer.image = function (href, title, text) {
    const reg = /([^]*)\[([^]*)\]\(([^]*)\)/;
    const isContainUrl = reg.test(text);
    const imgHtml = `<img src=${href} alt=${text}><span class="text-center" style="font-size: .8rem">${text}</span>`;
    return `<p style="text-align: center;">
              ${
                isContainUrl
                  ? getImgWithUrlHtml(text.match(reg), href)
                  : imgHtml
              }
            </p>`;
  };

  function getImgWithUrlHtml(textArr, href) {
    return `<img src=${href} alt=${textArr[2]}><br>
              ${textArr[1]}<a href="${textArr[3]}" target="_blank" rel="noopener noreferrer">${textArr[2]}</a>`;
  }

  renderer.blockquote = function (text) {
    text = text.trim();
    text = text.replace(/<p>/g, "");
    text = text.replace(/<\/p>/g, "<br>");
    const textArr = text.split("<br>");
    const context = [];
    for (let i = 0; i < textArr.length; i++) {
      if (textArr[i].trim().length === 0) {
        continue;
      }
      context.push(`<p>${textArr[i]}</p>`);
    }
    return `<blockquote>${context.join("")}</blockquote>`;
  };

  renderer.table = function (header, body) {
    if (body) body = "<tbody>" + body + "</tbody>";

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
}

function HTMLDecode(text) {
  var arrEntities = { lt: "<", gt: ">", nbsp: " ", amp: "&", quot: '"' };
  return text.replace(/&(lt|gt|nbsp|amp|quot);/gi, function (all, t) {
    return arrEntities[t];
  });
}

/**
 * 异步获取分页数据
 * @param  e
 */
function getData(e) {
  const path = $(e).attr("path");
  var pageContainer = "#container .pagination-container";
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
    },
    error: function () {
      $(pageContainer).empty();
      $(pageContainer).addClass("loading");
    },
  });
}
