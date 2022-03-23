((window, document) => {

  const moonMenuListener = function () {
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

  const toggleCircle = function () {
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
  };

  const ckMoonButton = function () {
    $('.moon-menu-button').click(() => {
      toggleCircle();
      $('.moon-menu-items').toggleClass('item-ani');
    })
  };

  const toggleSearchBox = function () {
    $('.icon-search').click(() => {
      $('#searchBox').toggleClass('hidden');
    })
  };

  const smoothBack2Top = function () {
    window.scroll({top: 0, behavior: 'smooth'});
  }

  const smoothBack2Bottom = function () {
    const offsetHeight = document.documentElement.offsetHeight;
    const scrollHeight = document.documentElement.scrollHeight;
    window.scroll({top: scrollHeight - offsetHeight, behavior: 'smooth'});
  }

  const ckBack2Top = function () {
    $('.icon-up').click(() => {
      $('#moonToc').removeClass('mm-active');
      smoothBack2Top();
    })
  }

  const ckBack2Bottom = function () {
    $('.icon-down').click(() => {
      $('#moonToc').removeClass('mm-active');
      smoothBack2Bottom();
    })

  }

  const ckShowContent = function () {
    $('.moon-content').click(() => {
      toggleSmallToc()

      // 模拟点击事件
      $('.moon-menu-button').trigger("click");
    })
  }

  const toggleSmallToc = function () {
    var moonContent = $('#moonToc')
    moonContent.toggleClass('mm-active');

    if (moonContent.hasClass('mm-active')) {
      moonContent.show();
    } else {
      moonContent.hide()
    }
  }


  window.addEventListener('load', () => {
    moonMenuListener();
    ckMoonButton();
    toggleSearchBox();
    ckBack2Top();
    ckBack2Bottom();
    ckShowContent();
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


  });


})(window, document);