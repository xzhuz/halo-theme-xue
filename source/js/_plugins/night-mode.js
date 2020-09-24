function dayNightSwitch() {
    // 夜晚模式开关
    const daySwitch = $('#daySwitch')
    daySwitch.toggleClass('daySwitch')
    $(document.body).toggleClass('night');

    if (typeof renderComment === 'function') {
        renderComment();
    }
}