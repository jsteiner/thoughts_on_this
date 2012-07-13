$(document).ready(function() {
  $('li.dropdown').click(function() {
    $(this).children('.menu-content').show();
  })

  $('.main-wrap').click(function() {
    $('.menu-content').hide();
  })
});