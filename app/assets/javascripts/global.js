$(document).ready(function() {
  $('li.dropdown > a').click(function(e) {
    $(this).siblings('.menu-content').toggle();
    e.preventDefault();
    return false;
  });

  $(document).click(function() {
    $('.dropdown .menu-content').hide();
  });
});
