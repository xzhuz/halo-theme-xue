((window, document) => {

    const moonMenuListener = function() {
        // Get scroll percent
        const offsetHeight = document.documentElement.offsetHeight;
        const scrollHeight = document.documentElement.scrollHeight;
        const scrollTop = document.documentElement.scrollTop || window.pageYOffset || document.body.scrollTop;
        let percent = Math.round(scrollTop / (scrollHeight - offsetHeight) * 100);
        if (percent > 100) percent = 100;

        const menuIcon = document.querySelector('.moon-menu-icon');
        const menuText = document.querySelector('.moon-menu-text');
        if (!percent) {
            percent = 0;
            menuIcon.style.display = 'block';
            menuText.style.display = 'none';
            $('g.moon-dot').show();
        } else {
            menuIcon.style.display = 'none';
            menuText.style.display = 'block';
            menuText.innerHTML = percent + '%';
            $('g.moon-dot').hide();
        }

        // Update strokeDasharray
        const length = 196;
        document.querySelector('.moon-menu-border').style.strokeDasharray = percent * length / 100 + ' ' + length;
    };

    window.addEventListener('load', () => {
        moonMenuListener();
    });
    window.addEventListener('scroll', moonMenuListener);

    document.querySelector('.moon-menu-button').addEventListener('click', () => {
        document.querySelector('.moon-menu-icon').classList.toggle('active');
        const items = document.querySelector('.moon-menu-items');
        items.classList.toggle('active');
        const childItems = document.querySelectorAll('.moon-menu-item');
        if (items.classList.contains('active')) {
            for (let i = 0; i < childItems.length; i++) {
                // childItems[i].style.top = -3 - 3 * i + 'em';
                childItems[i].style.opacity = .9;
            }
        } else {
            for (let i = 0; i < childItems.length; i++) {
                // childItems[i].style.top = '1em';
                childItems[i].style.opacity = 0;
            }
        }

        // 右下角的小点
        moonMenu.toggleCircle();

        $('.moon-menu-items').toggleClass('item-ani');
    });


})(window, document);

// eslint-disable-next-line no-unused-vars
var back2top = () => {
    window.scroll({ top: 0, behavior: 'smooth' });
};

// eslint-disable-next-line no-unused-vars
var back2bottom = () => {
    const offsetHeight = document.documentElement.offsetHeight;
    const scrollHeight = document.documentElement.scrollHeight;
    window.scroll({ top: scrollHeight - offsetHeight, behavior: 'smooth' });
};

var moonMenu = {
    ckBack2Top: function () {
        $('.icon-up').on('click', function () {
            back2top();
        });
    },
    ckBack2Bottom: function () {
        $('.icon-down').on('click', function () {
            back2bottom();
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
    }
}

$(function () {
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