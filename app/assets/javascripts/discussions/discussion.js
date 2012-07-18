$(document).ready(function() {
  $('a.share').toggle(
    function(e) {
      $(this).parent().next('li').show();
      e.preventDefault();
    },
    function(e) {
      $(this).parent().next('li').hide();
      e.preventDefault();
    }
  );
});