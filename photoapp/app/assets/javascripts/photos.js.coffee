
$(document).ready ->

 $.ajax '/photos',
        type: 'GET'
        dataType: 'json'
        success: (data, textStatus, jqXHR) ->
            displayPhoto(data)

displayPhoto = (photosArray) ->
  _(photosArray).each((photo) -> $('#grid').append("<li><img id=#{photo.id} class=homephotos src= #{photo.image} width=300 height=400 ><li>"))
  

$('#grid li').wookmark({
    autoResize: true, 
    container: $('#tiles'), 
    offset: 2, 
    itemWidth: 210 // Optional, the width of a grid item
  });

# $('.grid').wookmark({align: 'center',
#   autoResize: false,
#   comparator: null,
#   container: $('body'),
#   direction: undefined,
#   ignoreInactiveItems: true,
#   itemWidth: 0,
#   fillEmptySpace: false,
#   flexibleWidth: 0,
#   offset: 2,
#   onLayoutChanged: undefined,
#   outerOffset: 0,
#   possibleFilters: [],
#   resizeDelay: 50,
#   verticalOffset: undefined})



   
    

