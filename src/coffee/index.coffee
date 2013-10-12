data = undefined
num = undefined

$(document).ready ->
  rootRef = new Firebase("http://equis1414.firebaseio.com/" + $("#parameter").val())
  rootRef.once "value", (s) ->
    console.log s.val()
    data = s.val()[$("#parameter").text()]
    $('#titleEq').text(data.title)
    $('#description').text(data.description)
    $('#theEq').html(data.TeX)
    MathJax.Hub.Typeset ->
      drawBars()
      return
      
    $('.levelBtn').on "mouseup", ->
      for i in [1..5]
        $(".level-" + i).unbind()
      $(".level-" + $(this).data("int")).on "mouseup", ->
        console.log data.metadata[this.id]
        return
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
    console.log $(this).data "rel"
    return