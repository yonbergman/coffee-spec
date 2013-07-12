$(document).on('form.edit_drink input change', ->
  console.log('change')
  $.get(document.location.href.replace(/\/\d+\/edit$/,'/preview').replace('/new','/preview'), $('form').serialize()).success((html) ->
      el = $('.drink')
      el.after(html)
      el.remove()
  )

)