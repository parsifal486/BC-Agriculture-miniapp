(function ($) {
  "use strict";
  /*---------- 01. On Load Function ----------*/
  $(window).on('load', function () {
    $('.preloader').fadeOut();
  });



  /*---------- 02. Preloader ----------*/
  if ($('.preloader').length > 0) {
    $('.preloaderCls').each(function () {
      $(this).on('click', function (e) {
        e.preventDefault();
        $('.preloader').css('display', 'none');
      })
    });
  };



  /*---------- 03. Mobile Menu Active ----------*/
  $('.mobile-menu-active').vsmobilemenu({
    menuContainer: '.vs-mobile-menu',
    expandScreenWidth: 992,
    menuToggleBtn: '.vs-menu-toggle',
  });



  /*---------- 04. Sticky fix ----------*/
  var lastScrollTop = '';
  var scrollToTopBtn = '.scrollToTop'

  function stickyMenu($targetMenu, $toggleClass) {
    var st = $(window).scrollTop();
    if ($(window).scrollTop() > 600) {
      if (st > lastScrollTop) {
        $targetMenu.removeClass($toggleClass);

      } else {
        $targetMenu.addClass($toggleClass);
      };
    } else {
      $targetMenu.removeClass($toggleClass);
    };
    lastScrollTop = st;
  };
  $(window).on("scroll", function () {
    stickyMenu($('.sticky-header'), "active");
    if ($(this).scrollTop() > 400) {
      $(scrollToTopBtn).addClass('show');
    } else {
      $(scrollToTopBtn).removeClass('show');
    }
  });



  /*---------- 05. Scroll To Top ----------*/
  $(scrollToTopBtn).on('click', function (e) {
    e.preventDefault();
    $('html, body').animate({
      scrollTop: 0
    }, 3000);

    return false;
  });




  /*---------- 06.Set Background Image ----------*/
  if ($('[data-bg-src]').length > 0) {
    $('[data-bg-src]').each(function () {
      var src = $(this).attr('data-bg-src');
      $(this).css({
        'background-image': 'url(' + src + ')'
      });
    });
  };





  /*---------- 07. Popup Sidemenu ----------*/
  function popupSideMenu($sideMenu, $sideMunuOpen, $sideMenuCls, $toggleCls) {
    // Sidebar Popup
    $($sideMunuOpen).on('click', function (e) {
      e.preventDefault();
      $($sideMenu).addClass($toggleCls);
    });
    $($sideMenu).on('click', function (e) {
      e.stopPropagation();
      $($sideMenu).removeClass($toggleCls)
    });
    var sideMenuChild = $sideMenu + ' > div';
    $(sideMenuChild).on('click', function (e) {
      e.stopPropagation();
      $($sideMenu).addClass($toggleCls)
    });
    $($sideMenuCls).on('click', function (e) {
      e.preventDefault();
      e.stopPropagation();
      $($sideMenu).removeClass($toggleCls);
    });
  };
  popupSideMenu('.sidemenu-wrapper', '.sideMenuToggler', '.sideMenuCls', 'show');





  /*---------- 08. Search Box Popup ----------*/
  function popupSarchBox($searchBox, $searchOpen, $searchCls, $toggleCls) {
    $($searchOpen).on('click', function (e) {
      e.preventDefault();
      $($searchBox).addClass($toggleCls);
    });
    $($searchBox).on('click', function (e) {
      e.stopPropagation();
      $($searchBox).removeClass($toggleCls);
    });
    $($searchBox).find('form').on('click', function (e) {
      e.stopPropagation();
      $($searchBox).addClass($toggleCls);
    });
    $($searchCls).on('click', function (e) {
      e.preventDefault();
      e.stopPropagation();
      $($searchBox).removeClass($toggleCls);
    });
  };
  popupSarchBox('.popup-search-box', '.searchBoxTggler', '.searchClose', 'show');





  /*----------- 10. Hero Slider Active ----------*/
  $('.vs-hero-carousel').each(function () {
    var vsHslide = $(this);

    // return function for dom data
    function d(data) {
      return vsHslide.data(data)
    }
    
    /* Custom Thumb Navigation */
    var customNav = '.thumb';
    var navDom = 'data-slide-go';

    vsHslide.on('sliderDidLoad', function (event, slider) { // On Slide Init
      var currentSlide = slider.slides.current.index; // current Slide index 
      var i = 1;
      // Set Attribute 
      vsHslide.find(customNav).each(function(){
        $(this).attr(navDom, i)
        i++
        // On Click Thumb, Change slide
        $(this).on('click', function(e){
          e.preventDefault();
          var target = $(this).attr(navDom);
          vsHslide.layerSlider(parseInt(target));
        })
      });
      // Add class To current Thumb
      var currentNav = customNav + '[' + navDom + '="' + currentSlide + '"';
      $(currentNav).addClass('active');
    }).on('slideChangeDidComplete', function (event, slider) { // On slide Change Start
      var currentActive = slider.slides.current.index; // After change Current Index
      var currentNav = customNav + '[' + navDom + '="' + currentActive + '"';
      $(currentNav).addClass('active') // Add Class on current Nav
      $(currentNav).siblings().removeClass('active');
    });





    /* Custom Responsive Option */
    vsHslide.on('sliderWillLoad', function (event, slider) {
      // Define Variable
      var respLayer = jQuery(this).find('.ls-responsive'),
        lsDesktop = 'ls-desktop',
        lsLaptop = 'ls-laptop',
        lsTablet = 'ls-tablet',
        lsMobile = 'ls-mobile',
        windowWid = jQuery(window).width(),
        lgDevice = 1025,
        mdDevice = 993,
        smDevice = 768;

      // Set Style on each Layer
      respLayer.each(function () {
        var layer = jQuery(this);

        function lsd(data) {
          return (layer.data(data) === '') ? layer.data(null) : layer.data(data);
        }
        // var respStyle = (windowWid < smDevice) ? ((lsd(lsMobile)) ? lsd(lsMobile) : lsd(lsTablet)) : ((windowWid < mdDevice) ? ((lsd(lsTablet)) ? lsd(lsTablet) : lsd(lsDesktop)) : lsd(lsDesktop)),
        var respStyle = (windowWid < smDevice) ? lsd(lsMobile) : ((windowWid < mdDevice ? lsd(lsTablet) : ((windowWid < lgDevice) ? lsd(lsLaptop) : lsd(lsDesktop)))),
          mainStyle = (layer.attr('style') !== undefined) ? layer.attr('style') : ' ';
        layer.attr('style', mainStyle + respStyle);
      });

    });





    /* Custom Arrow Navigation */
    vsHslide.find('[data-ls-go]').each(function () {
      $(this).on('click', function (e) {
        e.preventDefault();
        var target = $(this).data('ls-go');
        vsHslide.layerSlider(target)
      });
    });

    vsHslide.layerSlider({
      allowRestartOnResize: true,
      globalBGImage: (d('globalbgimage') ? d('globalbgimage') : false),
      maxRatio: (d('maxratio') ? d('maxratio') : 1),
      type: (d('slidertype') ? d('slidertype') : 'responsive'),
      pauseOnHover: (d('pauseonhover') ? true : false),
      navPrevNext: (d('navprevnext') ? true : false),
      hoverPrevNext: (d('hoverprevnext') ? true : false),
      hoverBottomNav: (d('hoverbottomnav') ? true : false),
      navStartStop: (d('navstartstop') ? true : false),
      navButtons: (d('navbuttons') ? true : false),
      loop: ((d('loop') == false) ? false : true),
      autostart: (d('autostart') ? true : false),
      height: (($(window).width() < 767) ? (d('sm-height') ? d('sm-height') : d('height')) : (d('height') ? d('height') : 1080)),
      responsiveUnder: (d('responsiveunder') ? d('responsiveunder') : 1220),
      layersContainer: (d('container') ? d('container') : 1220),
      showCircleTimer: (d('showcircletimer') ? true : false),
      skinsPath: 'layerslider/skins/',
      thumbnailNavigation: ((d('thumbnailnavigation') == false) ? false : true)
    });
  });




  /*---------- 12. Date & Time Picker ----------*/
  // Time And Date Picker
  $('.dateTime-pick').datetimepicker({
    timepicker: true,
    datepicker: true,
    format: 'y-m-d H:i',
    hours12: false,
    step: 30
  });

  // Only Date Picker
  $('.date-pick').datetimepicker({
    timepicker: false,
    datepicker: true,
    format: 'm-d-y',
    step: 10
  });

  // Only Time Picker
  $('.time-pick').datetimepicker({
    datepicker: false,
    timepicker: true,
    format: 'H:i',
    hours12: false,
    step: 10
  });



  /*----------- 13. Magnific Popup ----------*/
  /* magnificPopup img view */
  $('.popup-image').magnificPopup({
    type: 'image',
    gallery: {
      enabled: true
    }
  });

  /* magnificPopup video view */
  $('.popup-video').magnificPopup({
    type: 'iframe'
  });

  
  
  /*----------- 14. Woocommerce Toggle ----------*/
  // Ship To Different Address
  $('#ship-to-different-address-checkbox').on('change', function () {
    if ($(this).is(':checked')) {
      $('#ship-to-different-address').next('.shipping_address').slideDown();
    } else {
      $('#ship-to-different-address').next('.shipping_address').slideUp();
    }
  });

  // Login Toggle
  $('.woocommerce-form-login-toggle a').on('click', function(e){
    e.preventDefault();
    $('.woocommerce-form-login').slideToggle();
  })
  
  // Coupon Toggle
  $('.woocommerce-form-coupon-toggle a').on('click', function (e) {
    e.preventDefault();
    $('.woocommerce-form-coupon').slideToggle();
  })
  
  // Woocommerce Shipping Method
  $('.shipping-calculator-button').on('click', function(e){
    e.preventDefault();
    $(this).next('.shipping-calculator-form').slideToggle();
  })
  
  // Woocommerce Payment Toggle
  $('.wc_payment_methods input[type="radio"]:checked').siblings('.payment_box').show();  
  $('.wc_payment_methods input[type="radio"]').each(function(){
    $(this).on('change', function () {
      $('.payment_box').slideUp();
      $(this).siblings('.payment_box').slideDown();
    })
  })
  
  // Woocommerce Rating Toggle
  $('.rating-select .stars a').each(function(){
    $(this).on('click', function(e){
      e.preventDefault();
      $(this).siblings().removeClass('active');
      $(this).parent().parent().addClass('selected');
      $(this).addClass('active');
    });
  })


  
  
  /*----------- 15. Filter Active ----------*/
  $('.filter-active').imagesLoaded(function () {
    var $filter = '.filter-active',
      $filterItem = '.grid-item',
      $filterMenu = '.filter-menu-active';  

    if ($($filter).length > 0) {
      var $grid = $($filter).isotope({
        itemSelector: $filterItem,
        filter: '*',
        masonry: {
          // use outer width of grid-sizer for columnWidth
          columnWidth: $filterItem
        }
      });
    }

    if ($($filterMenu).length > 0) {
      // filter items on button click
      $($filterMenu).on('click', 'button', function () {
        var filterValue = $(this).attr('data-filter');
        $grid.isotope({
          filter: filterValue
        });
      });

      // Menu Active Class 
      $($filterMenu).on('click', 'button', function (event) {
        event.preventDefault();
        $(this).addClass('active');
        $(this).siblings('.active').removeClass('active');
      });
    };
  });

  $('.filter-active2').imagesLoaded(function () {
    var $filter = '.filter-active2',
      $filterItem = '.grid-item';  
    if ($($filter).length > 0) {
      $($filter).isotope({
        itemSelector: $filterItem,
        filter: '*',
        masonry: {
          // use outer width of grid-sizer for columnWidth
          columnWidth: 1
        }
      });
    }
  });



  /*----------- 16. Range Slider ----------*/
  $("#slider-range").slider({
    range: true,
    min: 0.1,
    max: 300,
    values: [0.1, 570],
    slide: function (event, ui) {
      $("#minAmount").text("￥" + ui.values[0]);
      $("#maxAmount").text("￥" + ui.values[1]);
    }
  });
  $("#minAmount").text("￥" + $("#slider-range").slider("values", 0));
  $("#maxAmount").text("￥" + $("#slider-range").slider("values", 1));



  /*---------- 17. Quantity Added ----------*/
  $('.quantity-plus').each(function () {
    $(this).on('click', function (e) {
      e.preventDefault();
      var $qty = $(this).siblings(".qty-input");
      var currentVal = parseInt($qty.val());
      if (!isNaN(currentVal)) {
        $qty.val(currentVal + 1);
      }
    })
  });
  
  $('.quantity-minus').each(function () {
    $(this).on('click', function (e) {
      e.preventDefault();
      var $qty = $(this).siblings(".qty-input");
      var currentVal = parseInt($qty.val());
      if (!isNaN(currentVal) && currentVal > 1) {
        $qty.val(currentVal - 1);
      }
    });
  })
  
  
  
  
  /*---------- 18. Offer Count Down ----------*/
  $.fn.countdown = function (){
    $(this).each(function(){
      var $counter = $(this),
      countDownDate = new Date($counter.data('offer-date')).getTime(), // Set the date we're counting down to
      dateWrapper = '<span class="number"></span>', // Wrapper Where Date Will Be Print
      exprireCls = 'expired';

      // Finding Function
      function s$(element) {
        return $counter.find(element);  
      }      

      // Prepend The Wrapper 
      s$('.day').prepend(dateWrapper);
      s$('.hour').prepend(dateWrapper);
      s$('.minute').prepend(dateWrapper);
      s$('.second').prepend(dateWrapper);
    
      // Update the count down every 1 second
      var counter = setInterval(function () {    
        // Get today's date and time
        var now = new Date().getTime();
    
        // Find the distance between now and the count down date
        var distance = countDownDate - now;
    
        // Time calculations for days, hours, minutes and seconds
        var days = Math.floor(distance / (1000 * 60 * 60 * 24));
        var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
        var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
        var seconds = Math.floor((distance % (1000 * 60)) / 1000);

        // Check If value is lower than ten, so add zero before number
        days < 10 ? days = '0' + days : null;
        hours < 10 ? hours = '0' + hours : null;
        minutes < 10 ? minutes = '0' + minutes : null;
        seconds < 10 ? seconds = '0' + seconds : null;
    
        // If the count down is over, write some text 
        if (distance < 0) {
          clearInterval(counter);
          $counter.addClass(exprireCls);
          $counter.find('.message').css('display', 'block');
        } else {
          // Output the result in elements
          s$('.day .number').html(days + ' ')
          s$('.hour .number').html(hours + ' ')
          s$('.minute .number').html(minutes + ' ')
          s$('.second .number').html(seconds + ' ')
        }
      }, 1000);
    })
  }

  if ($('.flash-counter').length) {
    $('.flash-counter').countdown()
  }

  if ($('.deal-counter').length) {
    $('.deal-counter').countdown()
  }

  if ($('.offer-counter').length) {
    $('.offer-counter').countdown()
  }


  /*----------- 19. Global Toggle ----------*/
  function toggleGlobal(sBtn, sMenu) {
    sBtn.each(function () {
      $(this).on('click', function (e) {
        e.preventDefault();
        var cBtn = $(this);
        if (cBtn.hasClass('active')) {
          cBtn.removeClass('active').next(sMenu).removeClass('show').slideUp();
        } else {
          cBtn.addClass('active').next(sMenu).addClass('show').slideDown();
        }
      })
    })
  };


  /*----------- 20. Box Nav Toggler ----------*/
  $.fn.boxNav = function (btn, subParent, subMenu){
    var $nav = $(this),
    $btn = $(btn),
    $childBtn = $nav.find(subParent);
    // Window Size Check
    if ($(window).width() < 1199.99) { 
      toggleGlobal($btn, $nav);
      toggleGlobal($childBtn, subMenu);
    }
  };

  if ($('.vs-box-nav').length > 0) {
    $('.vs-box-nav').boxNav('.box-nav-btn', '.menu-item-has-children > a', 'ul');
  }


  /*----------- 21. WOW Js (Scroll Animation) ----------*/
  new WOW().init();
  

  /*----------- 22. Tooltip Active ----------*/
  var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
  var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
    return new bootstrap.Tooltip(tooltipTriggerEl)
  })



  /*----------- 23. Slider Tab ----------*/
  $.fn.vsTab = function (options) {
    var opt = $.extend({
      sliderTab: false,
      tabButton: 'button'
    }, options);

    $(this).each(function () {
      var $menu = $(this);
      var $button = $menu.find(opt.tabButton);

      // Append indicator
      $menu.append('<span class="indicator"></span>');
      var $line = $menu.find('.indicator');

      // On Click Button Class Remove and indecator postion set
      $button.on('click', function (e) {
        e.preventDefault();
        var cBtn = $(this);
        cBtn.addClass('active').siblings().removeClass('active');
        if (opt.sliderTab) {
          $(slider).slick('slickGoTo', cBtn.data('slide-go-to'));
        } else {
          linePos();
        }
      })

      // Work With slider
      if (opt.sliderTab) {
        var slider = $menu.data('asnavfor'); // select slider

        // Select All button and set attribute
        var i = 0;
        $button.each(function () {
          var slideBtn = $(this);
          slideBtn.attr('data-slide-go-to', i)
          i++

          // Active Slide On load > Actived Button
          if (slideBtn.hasClass('active')) {
            $(slider).slick('slickGoTo', slideBtn.data('slide-go-to'));
          }

          // Change Indicator On slide Change
          $(slider).on('beforeChange', function (event, slick, currentSlide, nextSlide) {
            $menu.find(opt.tabButton + '[data-slide-go-to="' + nextSlide + '"]').addClass('active').siblings().removeClass('active');
            linePos();
          });
        })

      };

      // Indicator Position
      function linePos() {
        var $btnActive = $menu.find(opt.tabButton + '.active'),
          $height = $btnActive.css('height'),
          $width = $btnActive.css('width'),
          $top = $btnActive.position().top + 'px',
          $left = $btnActive.position().left + 'px';

        $line.get(0).style.setProperty('--height-set', $height);
        $line.get(0).style.setProperty('--width-set', $width);
        $line.get(0).style.setProperty('--pos-y', $top);
        $line.get(0).style.setProperty('--pos-x', $left);

        if ($($button).first().position().left == $btnActive.position().left) {
          $line.addClass('start').removeClass('center').removeClass('end');
        } else if ($($button).last().position().left == $btnActive.position().left) {
          $line.addClass('end').removeClass('center').removeClass('start');
        } else {
          $line.addClass('center').removeClass('start').removeClass('end');
        }
      }
      linePos();
    })
  }

  // Call On Load
  if ($('.testi-slideTab').length) {
    $('.testi-slideTab').vsTab({
      sliderTab: true,
      tabButton: '.tab-btn'
    });
  }

  // Call On Load
  if ($('.vs-slideTab').length) {
    $('.vs-slideTab').vsTab({
      sliderTab: true,
      tabButton: '.tab-btn'
    });
  }

  /*----------- 24. Shape Mockup ----------*/
  $.fn.shapeMockup = function () {
    var $shape = $(this);
    $shape.each(function () {
      var $currentShape = $(this),
        shapeTop = $currentShape.data('top'),
        shapeRight = $currentShape.data('right'),
        shapeBottom = $currentShape.data('bottom'),
        shapeLeft = $currentShape.data('left');
      $currentShape.css({
          top: shapeTop,
          right: shapeRight,
          bottom: shapeBottom,
          left: shapeLeft,
        }).removeAttr('data-top')
        .removeAttr('data-right')
        .removeAttr('data-bottom')
        .removeAttr('data-left')
        .parent().addClass('shape-mockup-wrap');
    });
  };

  if ($('.shape-mockup')) {
    $('.shape-mockup').shapeMockup();
  }



  /*----------- 25. Accordion Style ----------*/
  $('.accordion-button').each(function () {
    $(this).on('click', function () {
      var accordionWrapper = $(this).closest('.accordion-item');
      accordionWrapper.toggleClass('active')
        .siblings().removeClass('active');
    });
  });


  /*----------- 26. Tab Slider Refresh ----------*/
  var tabEl = $('[data-bs-toggle="tab"], [data-bs-toggle="pill"]');
  tabEl.on('shown.bs.tab', function (event) {
    var tabTarget = $(event.target).attr('data-bs-target');
    var slide = $(tabTarget).find('.vs-carousel');
    slide ? slide.slick('refresh') : null;
  })




})(jQuery);