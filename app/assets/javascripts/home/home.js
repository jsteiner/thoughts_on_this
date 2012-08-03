$(document).ready(function() {
  $('section:not(#call-to-action)').waypoint(function(e, direction) {
    if (direction == "down") {
      $(this).children('.section-wrap').addClass('scrolled');
    } else {
      $(this).children('.section-wrap').removeClass('scrolled');
    }
  }, {
    offset: '50%'
  });

  $(window).scroll(function(e) {
    var windowHeight = $(window).height(),
        scroll = $(window).scrollTop(),
        wholeHeight = $(document).outerHeight();
    console.log(wholeHeight - scroll, windowHeight);

    if (wholeHeight - scroll == windowHeight) {
      $('section.call-to-action.bottom').css('height', windowHeight + 17)
    };

    if (scroll > 1) {
      $('body').addClass('down')
    }
  })
});
