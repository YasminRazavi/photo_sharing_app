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


loadcontentsForPhoto = (id) ->
  url = "/photos/#{id}"
  $("#grid li.zoomed").prepend("<div class='photo-descp'></div><div class='photo-tags'></div>")
  $.ajax url,
    type: 'GET'
    dataType: 'json'
    success: (data, textStatus, jqXHR) -> 
      console.log(data)
      if data.liked_status 
        like_tag = "<img  class='fullheart' data-id=#{id} src='/assets/fullheart.jpg' width=50px>"
      else
        like_tag = "<img  class='emptyheart' data-id=#{id} src='/assets/emptyheart.svg' width=50px>"
      html = "<div class='photoContent'>
              <img data-id=#{data.user_id} class='user_photo_comments' src=#{data.user.avatar}>
              <h2>#{data.user.name}</h2><br><br>
              <h3 class='picText'>#{data.title}</h3><br><br>
              <p class='picText'>#{data.caption}</p><br><br>
              <p class='picText'>Likes: #{data.likes}</p><br><br>" +like_tag+
              "</div>"
      $("#grid li.zoomed .photo-descp").append(html)
      $("#grid li.zoomed .photoContent").append("<div class='photoTags'><h3>Tags:</h3> </div>")
      $(data.tags).each((index, tag) ->
        html_tags = "<p><a href='/tagged?tag=#{tag.name}'>#{tag.name}</a></p>"

        $("#grid li.zoomed .photoContent .photoTags").append(html_tags))

# toggleLike = (data, id) ->
#   console.log(data)
#   if data.liked_status 
#     like_tag = "<img  class='fullheart' data-id=#{id} src='/assets/fullheart.jpg' width=50px>"
#   else
#     like_tag = "<img  class='emptyheart' data-id=#{id} src='/assets/emptyheart.svg' width=50px>"
#   $("#grid li.zoomed .photo-descp").append(like_tag)

updateLike = ->
  id = $(this).data("id")
  if $(this).attr("class") == "fullheart"
    like_tag = "<img  id='heart' class='emptyheart' data-id=#{id} src='/assets/emptyheart.svg' width=50px></img>"
  else
    like_tag = "<img  id='heart' class='fullheart' data-id=#{id} src='/assets/fullheart.jpg' width=50px></img>"
  $(this).replaceWith(like_tag)
  $.ajax "/photos/like",
    type: 'POST'
    data: {photo_id: id }
    dataType: 'json'
    success: (data, textStatus, jqXHR) ->

enlargePhoto = -> 
  id = $(this).attr('data-id')
  $("#grid li").hide()
  $(this).find("img").css({width: "500px", border: "2px solid  lightgrey"})
  $(this).removeClass("photo-container").addClass("zoomed").css({position: "initial"}).show() 
  loadCommentsForPhoto(id)
  loadcontentsForPhoto(id)
  $("#grid li").show().css({zIndex:"-1", opacity: "0.1"})
  $(this).css(opacity:"1")
  
submitComment = ->
  $.ajax "/comments",
    type: 'POST'
    data: {comment:{text:$("#addComment").val(),
    photo_id: $(this).data("id") }}
    dataType: 'json'
    success: (data, textStatus, jqXHR) ->
      console.log(data)
      html = "<div class='users'>
            <h2>#{data.user.name}</h2>
            <img data-id=#{data.user_id} class='user_photo_comments' src=#{data.user.avatar}>
            <p class='user_comment'>#{data.text}</p>
            </div>"
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

showCollectionPhotos = (e) ->
    # $("#grid").empty()
    # $.ajax "#{document.location.href}/photos",
    #   type: 'GET'
    #   dataType: 'json'
    #   success: (data, textStatus, jqXHR) ->
    #     console.log(data)
    #     displayPhoto(data)

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
  $(document).on 'click', ".emptyheart", updateLike
  $(document).on 'click', ".fullheart", updateLike

  if document.location.pathname.match /collections\/\d+/
    showCollectionPhotos()
  else if document.location.pathname == "/" || document.location.pathname == "/photos"
    showAllPhotos()
  
  
  
  






  

  









 
