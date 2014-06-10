loadCommentsForPhoto = (id) ->
  url = "/photos/#{id}/comments"
  $("#grid li.zoomed").append("<div class='back-to-list'>Back To List</div><div class='commentsection'></div>")
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
          $("#grid li.zoomed .commentsection").append(html)
        )
    html_commentbox = "<div class='newComment'><input type='text'  id='addComment' class='commentbox'>
      <input type='submit' class='submitcomment' data-id=#{id}value='comment'></div>"
    $("#grid li.zoomed .commentsection").prepend(html_commentbox)



enlargePhoto = -> 
  id = $(this).attr('data-id')
  $("#grid li").hide()
  $(this).find("img").css({width: "400px"})
  $(this).removeClass("photo-container").addClass("zoomed").css({position: "initial"}).show()


  
  loadCommentsForPhoto(id)

submitComment = ->
  $.ajax "/comments",
    type: 'POST'
    data: {comment:{text:$("#addComment").val(),
    photo_id: $(this).data("id") }}

  displayComments = (comments)->
    console.log "comments", comments

  $.ajax '/photos',
    type: 'GET'
    dataType: 'json'
    success: (data, textStatus, jqXHR) ->
      console.log(data)
      html = "<div class='users'>
            <h2>#{data.user.name}</h2>
            <img data-id=#{data.user_id} class='user_photo_comments' src=#{data.user.avatar}>
            <p class='user_comment'>#{data.text}</p>
            </div>"
      alert(html)
      $(".newComment").after(html)

  $("#addComment").val("")

displayPhoto = (photosArray) ->
  _(photosArray).each (photo) -> 
    $('#grid').append("<li class='photo-container' data-id=#{photo.id}><img data-id=#{photo.id} class=homephotos src=#{photo.image} width=200></li>")

showAllPhotos = (e) ->
    $("#grid").empty()
    $.ajax '/photos',
      type: 'GET'
      dataType: 'json'
      success: (data, textStatus, jqXHR) ->
        console.log(data)
        displayPhoto(data)

        $('#grid li').wookmark({
          align: 'center',
          autoResize: false, 
          container: $('#grid'), 
          offset: 5, 
          flexibleWidth: 0
          itemWidth: 210

        })
    
$ ->
  $(document).on "click", "li.photo-container", enlargePhoto
  $(document).on "click", ".submitcomment", submitComment
  $(document).on 'click', ".back-to-list", showAllPhotos
  showAllPhotos()
  
  
  
              
