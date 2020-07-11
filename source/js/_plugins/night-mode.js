var nightModeId = 'nightMode';

var nightMode = {
    //
    clickNightMode: function () {
        $('#switch_Word').on('change', function () {
            // 夜晚模式 true  白天模式 false
            var isChecked = $('#switch_Word').prop('checked');
            nightMode.changeNightMode(isChecked);
        });
    },
    changeNightMode: function (checked) {
        checked = !!checked;
        // 夜晚模式 true  白天模式 false
        // 夜晚模式
        if (checked) {
            $(document.body).addClass('night');
            hanUtils.setLocalStorage(nightModeId, true);
            $('#switch_Word').attr("checked", true);
        } else {
            $(document.body).removeClass('night');
            hanUtils.setLocalStorage(nightModeId, false);
            $('#switch_Word').attr("checked", false);
        }

        if (typeof renderComment === 'function') {
            renderComment();
        }
    },
    autoNightMode: function () {
        var day = new Date();
        var hour = day.getHours();
        var isNight = hanUtils.getLocalStorage(nightModeId);
        // 根据当前时间判断是否是晚上
        // 如果当前是晚上,由于各种设置会不一样,这里干脆写死, 并且开启了自动夜晚模式
        if ((hour < 6 || hour >= 20) && autoNightModeOpen) {
            nightMode.changeNightMode(isNight);
        } else {
            nightMode.changeNightMode(isNight);
        }
    },
};

$(function () {
    // 夜晚模式
    nightMode.clickNightMode();
    // 自动夜晚模式
    nightMode.autoNightMode();
});
