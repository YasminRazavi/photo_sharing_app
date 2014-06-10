$(document).ready ->

 $.ajax '/collections',
        type: 'GET'
        dataType: 'json'
        success: (data) ->
            $.each(data.photos, appendPhotos)

# appendPhotos = ->
#   _(collections).each.photos


#   _(photosArray).each((photo) -> $('#grid').append("<li><img id=#{photo.id} class=homephotos src= #{photo.image} width=300 height=400 ><li>"))

#     success: function(data) {
#         $.each(data.moves, draw_cell)
#         //$('.game_container').html(data);
#       },