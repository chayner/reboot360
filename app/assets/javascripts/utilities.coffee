class R360.Utilities

  constructor: ->
    $.slidebars();

    $('.alert').on 'click', ->
      $(this).hide()
