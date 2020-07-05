var moonMenu = {
    smoothBack2Top: function () {
        window.scroll({ top: 0, behavior: 'smooth' });
    },
    smoothBack2Bottom: function() {
        const offsetHeight = document.documentElement.offsetHeight;
        const scrollHeight = document.documentElement.scrollHeight;
        window.scroll({ top: scrollHeight - offsetHeight, behavior: 'smooth' });
    },
    ckBack2Top: function () {
        $('.icon-up').on('click', function () {
            moonMenu.smoothBack2Top();
        });
    },
    ckBack2Bottom: function () {
        $('.icon-down').on('click', function () {
            moonMenu.smoothBack2Bottom();
        });
    },
    ckShowContent: function () {
        $('.icon-toc').on('click', function () {
          $('#moonToc').toggleClass('mm-active');
        });
    },
    initMoonToc: function () {
        var headerEl = 'h1,h2,h3,h4,h5,h6',  //headers
            content = '.md-content';//文章容器
        tocbot.init({
            tocSelector: '#moonToc',
            contentSelector: content,
            headingSelector: headerEl,
            scrollSmooth: true,
            isCollapsedClass: '',
            headingsOffset: 0 - ($('#postHeader').height() + 58),
            hasInnerContainers: false,
        });
    },
    toggleSearch: function () {
        $('#toggleSearch').on('click', function () {
            $('#searchBox').toggleClass('hidden');
        });

        $('.sh-exit').on('click', function () {
            $('#searchBox').toggleClass('hidden');
        });
    },
    toggleCircle: function () {
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
    },
    ckMoonButton: function() {
        $('.moon-menu-button').on('click', function () {
            // 右下角的小点
            moonMenu.toggleCircle();

            $('.moon-menu-items').toggleClass('item-ani');
        });
    },
}

$(function () {
    // 点击按钮
    moonMenu.ckMoonButton();
    // 返回顶部
    moonMenu.ckBack2Top();
    // 返回底部
    moonMenu.ckBack2Bottom();
    // 初始化目录
    moonMenu.initMoonToc();
    // 点击展示目录
    moonMenu.ckShowContent();
    // 搜索框
    moonMenu.toggleSearch();

});