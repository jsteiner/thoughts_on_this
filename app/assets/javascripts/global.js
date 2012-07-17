$(document).ready(function() {
  $('li.dropdown a.collapsed').toggle(function(e) {
    $(this).siblings('.menu-content:hidden').show();
    $(this).addClass('expanded').removeClass('collapsed');
    e.preventDefault();
  },
  function(e) {
      $(this).siblings('.menu-content').hide();
      $(this).addClass('collapsed').removeClass('expanded');
      e.preventDefault();
    })
});