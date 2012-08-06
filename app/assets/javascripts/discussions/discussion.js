var v_align_image;

$(document).ready(function() {
  $('a.share').toggle(
    function(e) {
      $(this).parent().prev('li').show();
      e.preventDefault();
    },
    function(e) {
      $(this).parent().prev('li').hide();
      e.preventDefault();
    }
  );

  $(window).resize(function () {
    v_align_image();
  });

  v_align_image = function() {
    var wrapper_height = $('.visual').height() * 0.5,
        image_height = $('.visual > img').height() * 0.5,
        target_margin_top = wrapper_height - image_height;
    target_margin_top = Math.max(target_margin_top, 0) + "px";

    $('.visual > img').css('margin-top', target_margin_top);
  }
});

$(window).load(function() {
  v_align_image();
});
