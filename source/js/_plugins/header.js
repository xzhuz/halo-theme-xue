/*
 *jQuery Superfish menu
 */
(function($){$.fn.superfish=function(op){var sf=$.fn.superfish,c=sf.c,$arrow=$(['<span class="',c.arrowClass,'"> &#187;</span>'].join('')),over=function(){var $$=$(this),menu=getMenu($$);clearTimeout(menu.sfTimer);$$.showSuperfishUl().siblings().hideSuperfishUl();},out=function(){var $$=$(this),menu=getMenu($$),o=sf.op;clearTimeout(menu.sfTimer);menu.sfTimer=setTimeout(function(){o.retainPath=($.inArray($$[0],o.$path)>-1);$$.hideSuperfishUl();if(o.$path.length&&$$.parents(['li.',o.hoverClass].join('')).length<1){over.call(o.$path);}},o.delay);},getMenu=function($menu){var menu=$menu.parents(['ul.',c.menuClass,':first'].join(''))[0];sf.op=sf.o[menu.serial];return menu;},addArrow=function($a){$a.addClass(c.anchorClass).append($arrow.clone());};return this.each(function(){var s=this.serial=sf.o.length;var o=$.extend({},sf.defaults,op);o.$path=$('li.'+o.pathClass,this).slice(0,o.pathLevels).each(function(){$(this).addClass([o.hoverClass,c.bcClass].join(' ')).filter('li:has(ul)').removeClass(o.pathClass);});sf.o[s]=sf.op=o;$('li:has(ul)',this)[($.fn.hoverIntent&&!o.disableHI)?'hoverIntent':'hover'](over,out).each(function(){if(o.autoArrows)addArrow($('>a:first-child',this));}).not('.'+c.bcClass).hideSuperfishUl();var $a=$('a',this);$a.each(function(i){var $li=$a.eq(i).parents('li');$a.eq(i).focus(function(){over.call($li);}).blur(function(){out.call($li);});});o.onInit.call(this);}).each(function(){var menuClasses=[c.menuClass];if(sf.op.dropShadows&&!($.browser.msie&&$.browser.version<7))menuClasses.push(c.shadowClass);$(this).addClass(menuClasses.join(' '));});};var sf=$.fn.superfish;sf.o=[];sf.op={};sf.IE7fix=function(){var o=sf.op;if($.browser.msie&&$.browser.version>6&&o.dropShadows&&o.animation.opacity!=undefined)
  this.toggleClass(sf.c.shadowClass+'-off');};sf.c={bcClass:'sf-breadcrumb',menuClass:'sf-js-enabled',anchorClass:'sf-with-ul',arrowClass:'sf-sub-indicator',shadowClass:'sf-shadow'};sf.defaults={hoverClass:'sfHover',pathClass:'overideThisToUse',pathLevels:1,delay:800,animation:{opacity:'show'},speed:'normal',autoArrows:true,dropShadows:true,disableHI:false,onInit:function(){},onBeforeShow:function(){},onShow:function(){},onHide:function(){}};$.fn.extend({hideSuperfishUl:function(){var o=sf.op,not=(o.retainPath===true)?o.$path:'';o.retainPath=false;var $ul=$(['li.',o.hoverClass].join(''),this).add(this).not(not).removeClass(o.hoverClass).find('>ul').hide().css('visibility','hidden');o.onHide.call($ul);return this;},showSuperfishUl:function(){var o=sf.op,sh=sf.c.shadowClass+'-off',$ul=this.addClass(o.hoverClass).find('>ul:hidden').show().css('visibility','visible');sf.IE7fix.call($ul);o.onBeforeShow.call($ul);$ul.animate(o.animation,o.speed,function(){sf.IE7fix.call($ul);o.onShow.call($ul);});return this;}});})(jQuery);

$(document).ready(function ($) {
  "use strict";

  /* 菜单 */
  $('.xue-menu ul.sf-menu').superfish({
    delay: 10,
    animation: {
      opacity: 'show',
      height: 'show'
    },
    speed: 'fast',
    autoArrows: false,
    dropShadows: false
  });

  /* 手机端菜单 */
  $('.mobile-menu-icon').click(function () {
    if ($(this).hasClass('active')) {
      $(this).removeClass('active');
      $('body').removeClass('show-mobile-menu');
    } else {
      $(this).addClass('active');
      $('body').addClass('show-mobile-menu');
    }
    return false;
  });
  $('.xue-mobile-menu>i').click(function () {
    $('.mobile-menu-icon.active').click();
  });
  /* 手机端 二级菜单 */
  $('.xue-mobile-menu>nav ul.sub-menu').each(function () {
    var $subMenu = jQuery(this);
    var $parMenuLink = $subMenu.siblings('a');
    $parMenuLink.click(function (e) {
      e.preventDefault();
      var $parMenu = jQuery(this).closest('li');
      $parMenu.siblings('li.menu-open').removeClass('menu-open').children('.sub-menu').slideUp('fast');
      $parMenu.toggleClass('menu-open');
      if ($parMenu.hasClass('menu-open')) {
        $parMenu.children('.sub-menu').slideDown('fast');
      } else {
        $parMenu.children('.sub-menu').slideUp('fast');
      }
      return false;
    });
  });

  /* 向上滚动  显示导航栏 */
  var $scrollTopOld = jQuery(window).scrollTop();
  var $scrollUpMax = 100;
  var $scrollUp = 0;
  var $scrollDownMax = 50;
  var $scrollDown = 0;
  jQuery(window).scroll(function (e) {
    var $header = jQuery('header>.xintheme-menu-container');
    var $headerClone = $header.siblings('.header-clone');
    var $headerCloneOT = $headerClone.offset().top;
    var $scrollTop = jQuery(window).scrollTop();
    /* START - Header resize */
    /* Important - Is HeaderScrollUp Check First */
    if(jQuery('#wpadminbar').attr('id')==='wpadminbar'){$headerCloneOT-=jQuery('#wpadminbar').height();}
    var $diff = $scrollTopOld - $scrollTop;
    if ($diff > 0) {/* Scroll Up */
      $scrollUp += $diff;
      $scrollDown = 0;
    } else {/* Scroll Down */
      $scrollUp = 0;
      $scrollDown -= $diff;
    }
    $scrollTopOld = $scrollTop;
    if ($scrollUpMax <= $scrollUp && $scrollTop > 0 && $headerCloneOT < $scrollTop && !jQuery('body').hasClass('header-small')) {
      jQuery('body').addClass('header-small');
      $header.css('margin-top', ('-' + $header.height() + 'px'));
      $header.stop().animate({marginTop: 0}, 200, 'linear', function () {
        $header.css({'margin-top': ''});
      });
    } else if (($scrollDownMax <= $scrollDown || $scrollTop === 0 || $headerCloneOT>$scrollTop) && jQuery('body').hasClass('header-small') && !$header.hasClass('hidding')) {
      if ($scrollTop === 0 || $headerCloneOT>$scrollTop) {
        jQuery('body').removeClass('header-small').removeClass('hidding');
      } else {
        $header.stop().addClass('hidding').animate({marginTop: ('-' + $header.height() + 'px')}, 200, 'linear', function () {
          jQuery('body').removeClass('header-small');
          $header.css({'margin-top': ''}).removeClass('hidding');
        });
      }
    }
  });

});

