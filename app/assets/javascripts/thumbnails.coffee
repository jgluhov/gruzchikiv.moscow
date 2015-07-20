$("#thumbnail_image").change ->
  fullPath = $(this).val()
  pathArray = fullPath.split(/[/\\]/)
  filename = pathArray[pathArray.length - 1]
  $('.tm-form-filename').empty().append filename
