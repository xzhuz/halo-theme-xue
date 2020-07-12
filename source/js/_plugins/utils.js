var katex_config = {
    delimiters:
        [
            {left: "$$", right: "$$", display: true},
            {left: "$", right: "$", display: false},
            {left: "\\(", right: "\\)", display: false},
            {left: "\\[", right: "\\]", display: true},
        ]
};

var hanUtils = {
    getLocalStorage: function (key) {
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
    },

    isQuotaExceeded: function (e) {
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

    },

    setLocalStorage: function (key, value) {
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
    },

    sheetViewer: function () {
        if (document.getElementById('sheetContent')) {
            const viewer = new Viewer(document.getElementById('sheetContent'), {
                toolbar: false,
            });
        }
    },

    journalViewer: function () {
        if (document.getElementById('tree-hole')) {
            const viewer = new Viewer(document.getElementById('tree-hole'), {
                toolbar: false,
                filter: function(image) {
                    if (!image.classList) {
                        return true;
                    }
                    return !image.classList.contains('avatar');
                },
            });
        }
    },

    highlightMenu: function () {
        var nav = document.getElementById('menuLinks')
        var links = nav.getElementsByClassName('link');
        var currenturl = document.location.pathname
        var last = 0
        if (links) {
            for (var i = 0; i < links.length; i++) {
                var linkurl = links[i].getAttribute('href');
                if (currenturl.indexOf(linkurl) !== -1) {
                    if (currenturl.indexOf(linkurl) !== -1)
                        last = i
                }
            }
                $(links[last]).addClass('current')

            for (var i = 0; i < links.length; i++) {
                if (last !== i) {
                    $(links[i]).removeClass('current')
                }
            }
        }
    }
}

$(function () {
    // 自定义页面 viewer
    hanUtils.sheetViewer();

    // 相册页面 viewer
    hanUtils.journalViewer();

    // 当前菜单菜单高亮
    hanUtils.highlightMenu();
});