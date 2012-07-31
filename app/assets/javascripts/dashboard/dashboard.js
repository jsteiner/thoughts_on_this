$(document).ready(function() {
  $('#discussion_image').change(function(e) {
    var filename = $(this).val().split("\\").pop();
    if (!filename) {
      filename = 'Upload a file';
    }
    $('label.file > span').text(filename);
  });

  $('#new_discussion').fileupload({
    url: '/image_subjects.json',
    dataType: 'json',
    dropZone: $('#file-drop')
   });

  $('#new_discussion').bind('fileuploadadd', function (e, data) {
    // Loop through the FileList and render image files as thumbnails.
    $.each(data.files, function (index, file) {

      if (!file.type.match('image.*')) {
        alert('You may only upload image files.');
        return;
      }

      $('label.file > span').text(file.name);

      var reader = new FileReader();

      // Closure to capture the file information.
      reader.onload = (function(theFile) {
        return function(e) {
          $('<img/>', {
            src: e.target.result,
            class: 'thumb',
            title: escape(theFile.name)
          }).appendTo('#file-drop');
        };
      })(file);
      reader.readAsDataURL(file);
    });
  });

  $('#new_discussion').bind('fileuploaddone', function (e, data) {
    $('#image_subject_id').val(data.result.id);
    $('.thumb').css('border-color', 'green');
  });

  $(document).bind('drop dragover', function (e) {
    e.preventDefault();
  });

  $(document).bind('dragover', function (e) {
    var dropZone = $('#file-drop'),
    timeout = window.dropZoneTimeout;
    if (!timeout) {
      dropZone.addClass('in');
    } else {
      clearTimeout(timeout);
    }
    if (e.target === dropZone[0]) {
      dropZone.addClass('hover');
    } else {
      dropZone.removeClass('hover');
    }
    window.dropZoneTimeout = setTimeout(function () {
      window.dropZoneTimeout = null;
      dropZone.removeClass('in hover');
    }, 100);
  });
});
