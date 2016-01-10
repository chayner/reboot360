#= require active_admin/base
#= require cloudinary
#= require tinymce-jquery

@Uploader =
  uploading: false
  counter: 0
  showUploading: ->
    str = ""
    for i in [0..@counter]
      str += "."
    $(".upload-status").text("uploading#{str}")
    counter = (counter + 1) % 3
  init: ->
    $("input.cloudinary-fileupload[type=file]:not(.processed)").cloudinary_fileupload();

    $(".cloudinary-fileupload:not(.processed)").each (i, e) =>
      $(e).on 'cloudinarystart', ->
          @uploading = true
          @uploadInterval = setInterval @showUploading, 200
        .on 'cloudinaryfail', ->
          @uploading = false
          clearInterval @uploadInterval
          $(".upload-status").empty()
        .on 'cloudinarydone', (e, data) ->
          @uploading = false
          $(this).siblings('.preview').find('img').attr('src', data.result.secure_url).attr('height', '200')
          clearInterval @uploadInterval
          $(".upload-status").empty()
        .addClass('processed')


    $("form").on 'submit', (e) =>
      e.preventDefault() if @uploading

$ ->
  Uploader.init()
