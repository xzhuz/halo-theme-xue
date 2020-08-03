var header = {
    hoverSubMenu: function () {
        $('.has-sub').hover(function () {
            var index = $(this).attr('index');
            var subMenu = $('#subMenu_' + index);
            if (subMenu) {
                subMenu.toggleClass('hidden');
            }

        });

    }
};

$(function () {

    // 悬浮展示目录
    header.hoverSubMenu();

});