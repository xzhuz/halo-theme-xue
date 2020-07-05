var nightModeId = 'nightMode';

var nightMode = {
    //
    clickNightMode: function () {
        nightMode.switchDayAndNight('switch_Word');
        nightMode.switchDayAndNight('switch_Word_sm')
    },
    changeNightMode: function (checked) {
        checked = !!checked;
        // 夜晚模式 true  白天模式 false
        // 夜晚模式
        if (checked) {
            $(document.body).addClass('night-mode');
            hanUtils.setLocalStorage(nightModeId, true);
            $('#switch_Word').attr("checked", true);
            $('#switch_Word_sm').attr("checked", true);
        } else {
            $(document.body).removeClass('night-mode');
            hanUtils.setLocalStorage(nightModeId, false);
            $('#switch_Word').attr("checked", false);
            $('#switch_Word_sm').attr("checked", false);
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
    switchDayAndNight: function(id) {
        $('#' + id).change(() => {
            // 夜晚模式 true  白天模式 false
            var isChecked = $('#' + id).prop('checked');
            nightMode.changeNightMode(isChecked);
        });
    }
};

$(function () {
    // 夜晚模式
    nightMode.clickNightMode();
    // 自动夜晚模式
    nightMode.autoNightMode();
});
