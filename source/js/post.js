var tocId = '#toc';
var flagId = '#tocFlag';
var post = {
    formatContent: function () {
        var postContent = $('#write');
        if (postContent) {
            var originContent = postContent.html();
            postContent.empty();
            postContent.append(marked(originContent));
        }
    },

    loadHighlight: function () {
        var codes = document.querySelectorAll('.md-content pre code');
        for (var i = 0; i < codes.length; i++) {
            var block = codes[i];
            hljs.highlightBlock(block);
            // 行号
            $('code.hljs').each(function (i, block) {
                hljs.lineNumbersBlock(block);
            });
            // //    copy 按钮
            //     $('code.hljs').each(function(i, block) {
            //         hljs.addCopyButton(block);
            //     });
        }
    },
    initViewer: function () {
        if (document.getElementById('write')) {
            const viewer = new Viewer(document.getElementById('write'), {
                toolbar: false,
            });
        }
    },
    //获取滚动条距离顶部位置
    getScrollTop: function () {
        return document.documentElement.scrollTop || document.body.scrollTop;
    },

    tocScroll: function (event) {
        var Obj = $(flagId);

        //判断元素是否存在
        if (Obj.length !== 1) {
            return false;
        }

        var tocFixed = $(tocId);
        var ObjTop = Obj.offset().top - $(window).height() * 0.5;

        // 滚动条离页面顶端的距离
        var scrollTop = post.getScrollTop();
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
        post.tocEleRight();

        event.preventDefault();
    },

    scrollTocFixed: function () {
        window.addEventListener('scroll', post.tocScroll, false);
    },

    initToc: function () {
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
        post.tocEleRight();
    },

    tocEleRight: function () {
        var screenWidth = document.body.clientWidth;
        var tocEle = document.getElementById('toc');
        if (tocEle) {
            tocEle.style.left = (screenWidth - 800) / 2 + 820 + "px";
        }
    },

    // 因为不使用后端渲染目录, 所以如果在发布文章的时候在文章开头加上 [TOC] 会在文章页面开头有一个ul 标签
    // 这里粗暴的去除
    removeFirstUL: function () {
        var post_content = document.getElementById('write');
        if (!post_content) {
            return;
        }
        var firstNodeName = post_content.firstElementChild.nodeName;
        if (firstNodeName === 'UL') {
            $(post_content.firstElementChild).remove();
        }
    },

    shareIcon: function () {

        var $config = {
            sites: ['google', 'twitter', 'facebook', 'weibo', 'qq', 'qzone', 'linkedin', 'wechat', 'douban'], // 启用的站点
            disabled: socialDisabled.split(','), // 禁用的站点
            wechatQrcodeTitle: '微信扫一扫：分享', // 微信二维码提示文字
            wechatQrcodeHelper: '<p>微信里点“发现”，扫一下</p><p>二维码便可将本文分享至朋友圈。</p>'
        };

        $('.share-btn').on('click', function () {
            socialShare('.social-share', $config);
            $('#socialShare').toggleClass('show');
        });
    }

}

$(function () {
    // 转换post内容为 Markdown
    // post.formatContent();

    // 代码高亮
    post.loadHighlight();

    // 图片预览
    post.initViewer();

    if (openToc) {

        // 目录事件
        post.scrollTocFixed();

        // 初始化toc
        post.initToc()

        // 删除文章最开始第一个 <ul>(如果有)
        post.removeFirstUL()
    }

    // 分享按钮
    post.shareIcon();

});