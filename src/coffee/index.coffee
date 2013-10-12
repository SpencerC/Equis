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
    MathJax.Hub.Typeset()
    $('.levelBtn').click ->
      $(".level-5").unbind()
      $(".level-4").unbind()
      $(".level-3").unbind()
      $(".level-2").unbind()
      $(".level-1").unbind()
      $(".level-"+$(this).data("int")).click ->
        console.log @class
        console.log data.metadata["+ this.id +"]
        return
      return
    return
  return