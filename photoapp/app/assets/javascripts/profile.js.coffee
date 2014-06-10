$(document).ready ->

  $.ajax '/my_collections',
    type: 'GET'
    dataType: 'json'
    success: (data) ->
      $.each(data, appendCollection)

  appendPhotosForCollection = (id) ->
    console.log id
    $.ajax '/my_collections',
      type: 'GET'
      dataType: 'json'
      success: (data) ->
        $.each(data, appendCollection)
  appendCollection = (i, collection)->
    html = "<div class='col_cont'>#{collection.title}</div>"
    $(".collections_container").append html
    appendPhotosForCollection(collection.id)