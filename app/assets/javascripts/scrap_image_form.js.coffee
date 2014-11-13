class ScrapImageForm
  constructor: (formSelector, options = {}) ->
    @$form = $(formSelector)
    @$scrapImageInput = @$form.find('#scrap_image')
    @submitUrl = options.submitUrl || '/scraps'
    @attachHandlers()

  attachHandlers: ->
    @$form.submit (e) =>
      # Stop from using default submission (page refresh)
      e.preventDefault()

      # Do we have any files selected?
      if @$scrapImageInput[0].files[0]?
        # Yes, a file is selected, find that file variable
        # and run uploadFile with it
        file = @$scrapImageInput[0].files[0]
        @uploadFile(file)
      else
        # No, let the user know and stop there
        alert 'You need to chose an image!'

  uploadFile: (file) ->
    formData = new FormData()
    formData.append('scrap[image]', file)
    $.ajax
      url: @submitUrl
      data: formData
      cache: false
      contentType: false
      processData: false
      type: 'POST'
      complete: (response, type) =>
        data = JSON.parse(response.responseText)
        @renderImage(data)

  renderImage: (options) ->
    $newImage = $('<div>')
    $newImage.append("<h2> ** NEW ** #{options.image}</h2>")
    $newImage.append("<img src='#{options.fillThumb}'>")
    $newImage.append("<img src='#{options.fitThumb}'>")
    $('body').append($newImage)

window.ScrapImageForm = ScrapImageForm
