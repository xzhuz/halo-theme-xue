/**
 * 随机 id
 * @param len 长度
 * @returns {string} id
 */
function randomId(len) {
  len = len || 32;
  var $chars = 'ABCDEFGHJKLMNOPQRSTUVWXYZabcdefhijklmnoprstuvwxyz0123456789';
  var maxPos = $chars.length;
  var pwd = '';
  for (i = 0; i < len; i++) {
    pwd += $chars.charAt(Math.floor(Math.random() * maxPos));
  }
  return pwd;
}

/**
 * 包裹标题
 */
function wrapHeader() {
  $('.md-content').find(':header').each((index, e) => {
    $(e).attr('id', randomId(10))
  });
}

// 计算 hash
String.prototype.hashCode = function () {
  var hash = 0, i, chr;
  if (this.length === 0) return hash;
  for (i = 0; i < this.length; i++) {
    chr = this.charCodeAt(i);
    hash = ((hash << 5) - hash) + chr;
    hash |= 0; // Convert to 32bit integer
  }
  return Math.abs(hash);
};


var timeAgo = function (timestamp) {
  // 补全为13位
  var arrTimestamp = (timestamp + '').split('');
  for (var start = 0; start < 13; start++) {
    if (!arrTimestamp[start]) {
      arrTimestamp[start] = '0';
    }
  }
  timestamp = arrTimestamp.join('') * 1;

  var minute = 1000 * 60;
  var hour = minute * 60;
  var day = hour * 24;
  var halfamonth = day * 15;
  var month = day * 30;
  var now = new Date().getTime();
  var diffValue = now - timestamp;

  // 如果本地时间反而小于变量时间
  if (diffValue < 0) {
    return '不久前';
  }

  // 计算差异时间的量级
  var monthC = diffValue / month;
  var weekC = diffValue / (7 * day);
  var dayC = diffValue / day;
  var hourC = diffValue / hour;
  var minC = diffValue / minute;

  // 数值补0方法
  var zero = function (value) {
    if (value < 10) {
      return '0' + value;
    }
    return value;
  };

  // 使用
  if (monthC > 12) {
    // 超过1年，直接显示年月日
    return (function () {
      var date = new Date(timestamp);
      return date.getFullYear() + '年' + zero(date.getMonth() + 1) + '月' + zero(date.getDate()) + '日';
    })();
  } else if (monthC >= 1) {
    return parseInt(monthC) + "月前";
  } else if (weekC >= 1) {
    return parseInt(weekC) + "周前";
  } else if (dayC >= 1) {
    return parseInt(dayC) + "天前";
  } else if (hourC >= 1) {
    return parseInt(hourC) + "小时前";
  } else if (minC >= 1) {
    return parseInt(minC) + "分钟前";
  }
  return '刚刚';
};


/**
 * ****************************
 * 文章页相关工具方法
 * ****************************
 */
/**
 * 包裹代码块
 */
function wrapPreCode() {
  document.querySelectorAll('pre').forEach((el) => {
    $(el).wrap(`<div class="code-toolbar"></div>`)
    var language = $(el).find('code[class*="language-"]')
    $(el).after(`<div class="toolbar"><div class="toolbar-item"><span data-rel="${$(language).attr('data-language')}"></span></div></div>`)
  })
}

/**
 * 添加代码块复制按钮
 */
function addCodeCopyBtn() {
  const $pre = $(".md-content pre");
  if (!$pre.length) {
    return;
  }
  $pre.each(function () {
    let $this = $(this);
    const $codes = $this.find("code");
    if ($codes.length <= 0) {
      return;
    }
    var content = $codes[0].innerText
    $this.addClass('line-numbers');
    $this.prepend('<span class="iconfont icon-copy code-copy-btn" title="复制内容"></span><span class="iconfont icon-arrow-down-filling code-expander" title="折叠/展开"></span>');

    $this.children('.code-expander').click(() => {
      $this.toggleClass('code-block-close');
    });

    new ClipboardJS($this.children('.icon-copy')[0], {
      text: function() {
        return content
      },
    }).on("success", () => Qmsg.success("Copy success！"))
  })
}

function toggleNavCheckBox() {
  const navCheckbox = document.querySelector('#navCheckbox')
  const navListOpen = document.querySelectorAll('.nav-list.-open')
  navCheckbox.checked = navListOpen.length >= 1;
}

