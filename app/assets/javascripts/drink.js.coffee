$(document).on('form.edit_drink input change', (el) ->
  srcElId = $(el.target).attr('id')
  return if srcElId == 'drink_name'

  location = document.location.href.replace(/\?.+/,'')
  location += '?'
  location += $('form').serialize()

  $(document).one('page:load', ->
    $('#' + srcElId).focus()
  )
  Turbolinks.visit(location)
)