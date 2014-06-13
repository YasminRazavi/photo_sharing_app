# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  $("#photo_collection_id").on "change", ->
    selected_value = $('#photo_collection_id').val()
    if selected_value is "new"
      $("#new_collection_form").toggleClass "hide"

    