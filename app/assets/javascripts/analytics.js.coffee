$(document).on 'page:change', ->
  if ga?
    ga('send', 'pageview');