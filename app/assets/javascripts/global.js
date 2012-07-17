$(document).ready(function() {
  // this triggers
  $('li.dropdown > a').click(function(e) {
    $(this).siblings('.menu-content').show();
    e.preventDefault();
  });

  // then this does, incorrectly because it's now not hidden
  $('body').click(function() {
    if (!$('.menu-content').is(':hidden')) {
      $('.menu-content').hide();
    };
  })
});