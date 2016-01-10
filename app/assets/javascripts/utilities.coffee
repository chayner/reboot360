class R360.Utilities

  constructor: ->
    @mySlidebars = new $.slidebars();

    @setResponsiveBodyClass();

    $('.alert').on 'click', ->
      $(this).hide()

    # check window size on resize event
    $(window).resize =>
      @setResponsiveBodyClass()

  # helper function to add breakpoints
  setResponsiveBodyClass: =>
    resizeNew = ''
    if $('body').data('size') != 'xsmall' and window.innerWidth < 480
      resizeNew = 'xsmall'
    else if $('body').data('size') != 'small' and window.innerWidth >= 480 and window.innerWidth < 640
      resizeNew = 'small'
    else if $('body').data('size') != 'medium' and window.innerWidth >= 640 and window.innerWidth < 960
      resizeNew = 'medium'
    else if $('body').data('size') != 'large' and window.innerWidth >= 960 and window.innerWidth < 1280
      resizeNew = 'large'
    else if $('body').data('size') != 'xlarge' and window.innerWidth >= 1200
      resizeNew = 'xlarge'

    if (resizeNew)
      resizeOld = $('body').data('size')
      $('body').data('size', resizeNew)
      @responsiveTriggers(resizeNew, resizeOld)

  responsiveTriggers: (resizeNew, resizeOld) =>

    $('.SidebarNav').css('height', $('.LayoutSidebar-body').outerHeight())

    if resizeNew == 'medium'
      $('#sb-site-disabled').attr('id', 'sb-site')
      if !@mySlidebars.slidebars.init
        @mySlidebars = new $.slidebars();

    if resizeNew == 'large'
      $('#sb-site').attr('id', 'sb-site-disabled')

      if $('body').outerHeight() > 800
        $('.SidebarNav').scrollToFixed(
          offsets: false
        );

    if resizeNew in ['xsmall', 'small', 'medium']
      $('.SidebarNav').trigger('detach.ScrollToFixed');
