$(document).ready ->
  rootRef = new Firebase("http://equis1414.firebaseio.com/" + $("#parameter").val())
  data = undefined
  num = undefined
  rootRef.once "value", (s) ->
    console.log s.val()
    data = s.val()[$("#parameter").text()]
    $('#titleEq').text(data.title)
    $('#description').text(data.description)
    $('#theEq').html(data.TeX)
    MathJax.Hub.Typeset ->
      for i in [1..5]
        $.each $(".level-" + i), (j, val) ->
          console.log val.id + ", " + i
          $( "[data-level='" + i + "']" ).append "<div class='bar' style='width:20px' data-rel='" + val.id + "'></div>"
          return
        $(".level-" + i).length
      $('.bar').on "mouseover", ->
        console.log $(this).data "rel"
        return
      return
      
    $('.levelBtn').on "mouseup", ->
      for i in [1..5]
        $(".level-" + i).unbind()
      $(".level-" + $(this).data("int")).on "mouseup", ->
        $("#pop5").popover data.metadata[this.id]

        return
      return

    return
  return