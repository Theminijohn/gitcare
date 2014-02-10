$ ->
  $('.prf_cvr_edt').hide()
  $('.prf_cover').hover(
    -> $('.prf_cvr_edt').fadeIn(400)
    -> $('.prf_cvr_edt').fadeOut(200)
  )

