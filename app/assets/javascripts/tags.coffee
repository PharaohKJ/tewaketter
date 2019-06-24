# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

@clipboard = (targetId) ->
  target = document.getElementById(targetId)
  range = document.createRange()
  sel = window.getSelection()
  range.selectNodeContents target
  sel.removeAllRanges()
  sel.addRange range
  document.execCommand 'copy'
  alert 'クリップボードにコピーしました'
  return