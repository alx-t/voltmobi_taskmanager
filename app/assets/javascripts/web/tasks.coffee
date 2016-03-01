# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $('.task-list').bind 'ajax:success', (e, data, status, xhr) ->
    task = $.parseJSON(xhr.responseText)
    $(".task#task_#{task.id}").html(JST["templates/task"]({task: task}))

