
ready = ->

  displayComments = (comments)->
    console.log "comments", comments

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

  $(document).on "click", "li.photo-container", -> 
    id = $(this).attr('data-id')
    url = "/photos/#{id}/comments"
    $("#grid li").hide()
    $(this).find("img").css({width: "400px"})
    $(this).removeClass("photo-container").addClass("zoomed")
    $(this).css({position: "initial"})
    $(this).show()
    $.ajax url,
      type: 'GET'
      dataType: 'json'
      success: (data, textStatus, jqXHR) -> 
        $(data).each((index, comment) ->
            html = "<div class='users'>
              <h2>#{comment.user.name}</h2>
              <img data-id=#{comment.user_id} class='user_photo_comments' src=#{comment.user.avatar}>
              <p class='user_comment'>#{comment.text}</p>
              </div>"
            console.log($(this))
            $("#grid li.zoomed").append(html)
          )
      html_commentbox = "<div class=users><input type='text' name='add comment' class='commentbox'>
        <input type='submit' value='comment'></div>"
      $("#grid li.zoomed").append(html_commentbox)





  displayPhoto = (photosArray) ->

    _(photosArray).each((photo) -> 

        $('#grid').append("<li class='photo-container' data-id=#{photo.id}><img data-id=#{photo.id} class=homephotos src=#{photo.image} width=200></li>"))
      
$(document).ready(ready)
