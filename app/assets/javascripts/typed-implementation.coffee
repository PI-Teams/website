ready = ->
  Typed.new '.element',
    strings: [
      'Wir sind ein Netzwerk freier Journalisten, die über Geschichten aus aller Welt berichten.'
      "Reportagen - Feature - Berichte - Kulturporträts."
    ]
    typeSpeed: 0
  return

$(document).ready ready
$(document).on 'turbolinks:load', ready