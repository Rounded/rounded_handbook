$(document).ready ->

  window.transparentShown = false

  $(".toggle-transparent").click ->
    if window.transparentShown is false
      $(".transparent").fadeIn 400
      window.transparentShown = true
    else
      $(".transparent").fadeOut 400
      window.transparentShown = false
    return

  return
