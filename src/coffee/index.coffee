data = undefined
num = undefined
currentLevel = 1

$(document).ready ->
  rootRef = new Firebase("http://equis1414.firebaseio.com/" + $("#parameter").val())
  rootRef.once "value", (s) ->
    console.log s.val()
    data = s.val()[$("#parameter").text()]
    $('#titleEq').text(data.title)
    $('#description').text(data.description)
    $('#theEq').html(data.TeX)
    MathJax.Hub.Typeset ->
      terms = $(".math [class*='level-']")
      terms.attr "data-toggle", "popover"
      terms.attr "data-placement", "bottom"
      terms.attr "data-trigger", "manual"
      terms.attr "data-container", ".equation"

      $(document).on "mouseup", ->
        terms.popover "destroy"
        return

      terms.on "mouseover", ->
        if $(this).hasClass("level-" + currentLevel)
          $(this).addClass("clickable")
          $(this).on "mouseup", (event) ->
            terms.popover "destroy"
            $(this).attr "data-content", data.metadata[this.id]
            $("#" + this.id).popover "show"
            event.stopPropagation()
          return
        return

      $(".math [class*='level-']").on "mouseout", ->
        $(this).unbind("mouseup")
        if $(this).hasClass("level-" + currentLevel)
          $(this).removeClass("clickable")
        return
      drawBars()
      return
      
    $('.levelBtn').on "mouseup", ->
      currentLevel = +$(this).data("level")
      return
    return
  return

$(window).resize ->
  drawBars()
  return

drawBars = ->
  for i in [1..5]
    current = $("[data-level='" + i + "']")
    current.html ''
    $.each $(".level-" + i), (j, val) ->
      current.append "<div class='bar' style='width:20px' data-rel='" + val.id + "'></div>"
      return
    current.children(".bar").width(current.width() / $(".level-" + i).length - 10)
  $('.bar').unbind()

  $('.bar').on "mouseover", ->
    $("#" + $(this).data("rel")).addClass "point-to"
    return

  $('.bar').on "mouseout", ->
    $(".point-to").removeClass "point-to"
    return

  return