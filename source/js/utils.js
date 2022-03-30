function randomStr(len) {
 len = len || 32;
    　　var $chars = 'ABCDEFGHJKLMNOPQRSTUVWXYZabcdefhijklmnoprstuvwxyz0123456789';     //默认去掉了容易混淆的字符oOLl,9gq,Vv,Uu,I1****/
    　　var maxPos = $chars.length;
    　　var pwd = '';
    　　for (i = 0; i < len; i++) {
    　　　　pwd += $chars.charAt(Math.floor(Math.random() * maxPos));
    　　}
    　　return pwd;
}


function wrapHeader() {
   $('.md-content').find(':header').each((index, e) => {
    $(e).attr('id', randomStr(10))
   });
}