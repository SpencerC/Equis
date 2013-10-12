$(document).ready ->
  rootRef = new Firebase("http://equis1414.firebaseio.com/" + $("#parameter").val())
  data = undefined
  num = undefined
  rootRef.once "value", (s) ->
    console.log s.val()
    data = s.val()
    return
  $('.levelItem').click ->
    $(".level-5").unbind()
    $(".level-4").unbind()
    $(".level-3").unbind()
    $(".level-2").unbind()
    $(".level-1").unbind()
    $(".level-5").click ->
      console.log @class
      console.log data[$("#parameter").val()].metadata["+ this.id +"]
      return
    return
  return