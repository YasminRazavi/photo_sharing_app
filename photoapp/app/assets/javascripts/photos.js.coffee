
$(document).ready ->

 $.ajax '/photos',
        type: 'GET'
        dataType: 'json'
        success: (data, textStatus, jqXHR) ->
            displayPhoto(data)

displayPhoto = (photosArray) ->
  _(photosArray).each((photo) -> $('.grid').append("<div class=container> <img id=#{photo.id} class=homephotos src= #{photo.image} ></div>"))
  $('.grid').wookmark();



   
    

