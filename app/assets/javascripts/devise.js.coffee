$(document).on "ready page:load", ->
  $("input#button_cmp").on 'change', ->
    if $(this).is(":checked")
      $("#label_cmp").text("I'm representing a Company / Organization ! ")
    else
      $("#label_cmp").text("Are you representing a Company / Organization ?")