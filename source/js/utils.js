/**
 * 随机 id
 * @param len 长度
 * @returns {string} id
 */
function randomId(len) {
  len = len || 32;
  var $chars = 'ABCDEFGHJKLMNOPQRSTUVWXYZabcdefhijklmnoprstuvwxyz0123456789'; 
  var maxPos = $chars.length;
  var pwd = '';
  for (i = 0; i < len; i++) {
    pwd += $chars.charAt(Math.floor(Math.random() * maxPos));
  }
  return pwd;
}

/**
 * 包裹标题
 */
function wrapHeader() {
  $('.md-content').find(':header').each((index, e) => {
    $(e).attr('id', randomId(10))
  });
}