$ ->
  jackUp = new JackUp.Processor(path: '/image_subjects')

  jackUp.on 'upload:imageRenderReady', (e, options) ->
    options.image.attr("data-id", options.file.__guid__)
    $('#file-drop').append(options.image)
    $('label.file > span').text(options.file.name)

  jackUp.on "upload:success", (e, options) ->
    $("img[data-id='#{options.file.__guid__}']").addClass 'file-upload-done'
    image = JSON.parse(options.responseText)
    imageId = image.id
    imageIdsElement = $("<input type='hidden' name='discussion[subject_id]'>").val(imageId)
    $("#file-drop").parent("form").append(imageIdsElement)

  jackUp.on "upload:failure", (e, options) ->
    alert("'#{options.file.name}' upload failed; please retry")
    $("img[data-id='#{options.file.__guid__}']").remove()

  $('#file-drop').jackUpDragAndDrop(jackUp)
  $('#discussion_image').jackUpAjax(jackUp)

  $('#discussion_image').change (e) ->
    filename = $(this).val().split("\\").pop()
    if !filename
      filename = 'Upload a file'

    $('label.file > span').text(filename)

  $(document).bind 'drop dragover', (e) ->
    e.preventDefault()
