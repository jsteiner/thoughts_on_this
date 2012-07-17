$(document).ready(function() {
  $('#image_subject_image').change(function(e) {
    var filename = $(this).val().split("\\").pop();
    if (!filename) {
      filename = 'Upload a file';
    }
    $('label.file > span').text(filename);
  });
});
