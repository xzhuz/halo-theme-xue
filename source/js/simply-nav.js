/*
  simply-nav.js - v1.2.1
  https://github.com/obscuredetour/simply-nav
  Licensed MIT © Jeffrey Summers
*/

// This anonymous function can be inserted anywhere
// (eg. within a <script> tag or anywhere in an existing .js file)
(simplyNavDuty => {

  const sideNav = document.querySelector('.nav-list'),
    toggleNavBtn = document.querySelector('.toggle-nav'),
    burger = document.querySelector('.burger'),
    pageOverlay = document.querySelector('.overlay'),
    navLinks = document.querySelectorAll(".link"),
    body = document.querySelector('body'),
    html = document.querySelector('html');

  // Disable page scroll
  function disablePageScroll() {
    if (sideNav.classList.contains('-open')) {
      body.classList.add('_disableScroll');
      html.classList.add('_disableScroll');
    } else {
      body.classList.remove('_disableScroll');
      html.classList.remove('_disableScroll');
    }
  };

  // Nav funtion (toggle)
  function toggleNav() {
    sideNav.classList.toggle('-open');
    burger.classList.toggle('open');
    disablePageScroll();
  };

  // To default
  toDefaults = () => {
    // Close nav menu
    sideNav.classList.remove('-open');
    burger.classList.remove('open');
    // Make sure scrolling is enabled
    body.classList.remove('_disableScroll');
    html.classList.remove('_disableScroll');
  }

  // Event listeners
  toggleNavBtn.addEventListener('click', toggleNav);
  pageOverlay.addEventListener('click', toggleNav);

  // (on mobile) close nav menu when link is clicked
  // this is useful on mobile when clicking an anchor tag on the current page (eg. index.html#last-section)
  navLinks.forEach(el => {
    el.addEventListener('click', (event) => {
      toDefaults();
    });
  });


  // when browser is resized (past breakpoint) reset to defaults
  (function() {

    window.addEventListener("resize", resizeThrottler, false);
    let resizeTimeout;

    function resizeThrottler() {
      // ignore resize events as long as an actualResizeHandler execution is in the queue
      if ( !resizeTimeout ) {
        resizeTimeout = setTimeout(function() {
          resizeTimeout = null;
          actualResizeHandler();

          // The actualResizeHandler will execute at a rate of 15fps
        }, 66);
      }
    }

    function actualResizeHandler() {
      // handle the resize event

      // Window resized width
      let width = window.innerWidth;

      // If resized greater than BREAKPOINT (default: 800px), then reset nav functions
      if (width >= 800) {
        toDefaults();
      }
    }

  }());


})();