
$(document).ready ->

   $.ajax '/photos',
          type: 'GET'
          dataType: 'json'
          success: (data, textStatus, jqXHR) ->
              displayPhoto(data)

              $('#grid li').wookmark({
                  align: 'center',
                  autoResize: false, 
                  container: $('#grid'), 
                  offset: 5, 
                  flexibleWidth: 0
                  itemWidth: 210
                })

  displayPhoto = (photosArray) ->

    _(photosArray).each((photo) -> 
      # if photo.id%2 ==0
        $('#grid').append("<li><img id=#{photo.id} class=homephotos src=#{photo.image} width=200></li>"))
      # else
      #   $('#grid').append("<li><img id=#{photo.id} class=homephotos src=#{photo.image} width=100 height=250 >"))

    

