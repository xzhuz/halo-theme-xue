
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
        if (document.getElementById('write')) {
            const viewer = new Viewer(document.getElementById('write'), {
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
        $('a.link').on('click', function (e) {
            $('a.link').each(function (e) {
                $(this).removeClass('current');
            })
            $(this).addClass('current');
            var screenWidth = document.body.clientWidth;
            if (screenWidth < 800) {
                $(this).parent('.sub-menu-tree').removeClass('hidden');
            }
        });

        // var nav = document.getElementById('menuLinks')
        // var links = nav.getElementsByClassName('link');
        var currentUrl = document.location.pathname
        if (currentUrl === '/') {
            return;
        }
        $('a.link').each(function () {
            var href = $(this).attr('href');
            if (href && href.indexOf(currentUrl) > -1) {
                $(this).addClass('current');
            } else {
                $(this).removeClass('current');
            }
        });

    },

    tableAddNode: function () {
        var postContent = document.getElementById('write');
        if (!postContent) {
            return;
        }
        var tables = postContent.getElementsByTagName('table');
        if (tables) {
            for (var i = 0; i < tables.length; i++) {
                var table = tables[i];
                $(table).wrap('<div class="md-table"></div>')
            }
        }
    },

    liAddSpan: function () {
        $('#write li').each(function (i) {
            if (this.classList.length > 0) {
                // do nothing
            } else if ($(this).find('p').length > 0
                || $(this).find('div').length > 0) {
                // do nothing
            } else {
                var liContent = $(this).html();
                liContent = liContent.trim();
                var len = liContent.length;
                if (len > 0) {
                    if (liContent.indexOf('<') === 0 && liContent.lastIndexOf('>') === len - 1) {
                        // do nothing
                    } else {
                        $(this).html('<span>' + liContent + '</span>');
                    }
                }

            }
        });
    },

    documentClick: function () {
        $(document).click(function (e) {
            var target = e.target;
            var coffeeModal = $('#coffeeModal');
            // 如果 coffeeModal 打开了
            if (coffeeModal && coffeeModal.hasClass('is-open')) {
                if ($(target).closest('#modalContainer').length === 0
                    && $(target).closest('#buyCoffee').length === 0) {
                    $('#closeCoffeeModalBtn').trigger('click');
                }
            }

            // var moonMenu = $('#moonMenu')
            // if (moonMenu && moonMenu.hasClass('active')) {
            //     if ($(target).closest('.moon-menu').length === 0) {
            //         // 模拟点击事件
            //         $('.moon-menu-button').trigger("click");
            //     }
            // }

            var searchBox = $('#searchBox');
            if (!searchBox || searchBox.hasClass('hidden')) {
            } else {
                if ($(target).closest('.search-container').length === 0
                    && !$(target).hasClass('icon-search')
                    && !$(target).hasClass('sh-exit')) {
                    searchBox.toggleClass('hidden');
                }
            }

        });
    },

    menuBgFFF: function () {
        var scrollTop = document.documentElement.scrollTop || document.body.scrollTop;
        var postHeader = $('#navHeader');
        var isChecked = $('#switch_Word').prop('checked');
        if (scrollTop > 0 && postHeader && !isChecked) {
            postHeader.addClass('nav-bg-fff');
            postHeader.addClass('nav-box-sd');
        } else {
            postHeader.removeClass('nav-bg-fff');
            postHeader.removeClass('nav-box-sd');
        }
    },

    scrollMenuShow: function () {
        window.addEventListener('scroll', hanUtils.menuBgFFF, false);
    }
}

$(function () {
    // 自定义页面 viewer
    hanUtils.sheetViewer();

    // 相册页面 viewer
    hanUtils.journalViewer();

    // 当前菜单菜单高亮
    hanUtils.highlightMenu();

    // table 要加上 div 避免出现小屏幕下展示不全
    hanUtils.tableAddNode();

    // li 添加 span
    hanUtils.liAddSpan();

    // document 点击事件
    hanUtils.documentClick();

    // 滚动目录背景展示
    hanUtils.scrollMenuShow();
});