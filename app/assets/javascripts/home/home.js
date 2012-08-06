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
    var window_height = $(window).height(),
        scroll = $(window).scrollTop(),
        whole_height = $(document).outerHeight();

    if (whole_height - scroll == window_height) {
      $('section.call-to-action-bottom').css('height', window_height + 17)
    };

    if (scroll > 1) {
      $('body').addClass('down');
      $('hr#more').addClass('scrolled');
    } else {
      $('body').removeClass('down');
      $('hr#more').removeClass('scrolled');
    }
  })

  var center_header = function() {
    var half_window = $(window).height() * 0.5,
        half_header = ($('header').outerHeight() - 5) * 0.5,
        header_top_margin = half_window - half_header;

    $('header').css('margin-top', header_top_margin);
    $('section#create').css('margin-top', header_top_margin);
  }

  center_header();
});
