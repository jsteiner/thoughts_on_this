$(document).ready(function() {
  $('#image_subject_image').change(function(e) {
    var file = e.srcElement.files[0],
        file_name = file.fileName;

    $('label.file > span').text(file_name);
  });
});
