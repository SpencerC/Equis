$(document).ready ->
  rootRef = new Firebase("http://equis1414.firebaseio.com/" + $("#parameter").val())
  rootRef.once "value", (s) ->
    console.log s.val()
    return
  return