$(document).ready ->

  $.ajax '/my_collections',
    type: 'GET'
    dataType: 'json'
    success: (data) ->
      $.each(data, appendCollection)


  appendPhotosForCollection = (id) ->

    $.ajax "/collections/#{id}/photos",
      type: 'GET'
      dataType: 'json'
      success: (data) ->
        $.each data, (i, photo) ->
          $("#collection-container-#{id}").append(
            "<img id=photo_#{photo.id} class='col_photo_thumb' src=#{photo.image}>"
          )
        
  appendCollection = (i, collection) ->
    html = "<div id='collection-container-#{collection.id}' class='col_cont'><div class='container_head'>#{collection.title} </div></div>"
    $(".collections_container").append html
    appendPhotosForCollection(collection.id)

  
