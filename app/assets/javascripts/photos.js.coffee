loadCommentsForPhoto = (id) ->
  url = "/photos/#{id}/comments"
  $("#grid li.zoomed").append("<div class='back-to-list'><a href='/photos'>Back To List</a></div><div class='commentsection'></div>")
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
              <p class='picLikes'>Likes: #{data.likes}</p><br><br>" +like_tag+
              "</div>"
      
      $("#grid li.zoomed .photo-descp").append(html)

      $("#grid li.zoomed .photoContent").append("<div class='photoTags'><h3>Tags:</h3> </div>")
      $(data.tags).each((index, tag) ->
        html_tags = "<p><a href='/tagged?tag=#{tag.name}'>#{tag.name}</a></p>"

        $("#grid li.zoomed .photoContent .photoTags").append(html_tags))
      if data.user.current_user == true
        html2 = "<div class='btn'><a href='/photos/#{id}/edit'>Edit</a></div>"
        $("#grid li.zoomed .photoContent .photoTags").append(html2)
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
      console.log(data)
      $('.picLikes').html("Likes: "+data.likes)
enlargePhoto = -> 
  id = $(this).attr('data-id')
  $("#grid li").hide()
  $(this).find("img").css({width: "40%", border: "2px solid  lightgrey", alig:"center"})
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
  num = 0
  _(photosArray).each (photo, i, photosArray) -> 
    img = new Image()
    img.onload = ->
      $('#grid').append("<li class='photo-container' data-id=#{photo.id}>
        <img data-id=#{photo.id} class=homephotos src=#{photo.image} width=200  >
      </li>")
      num += 1
      console.log num, photosArray.length, num == photosArray.length
      if num == photosArray.length

        $('#grid li').wookmark({
          align: 'center',
          autoResize: false, 
          container: $('#grid'), 
          offset: 5, 
          flexibleWidth: 0
          itemWidth: 210
        })
    img.src = photo.image;
    $('.ajaxloader').hide()
    


showAllPhotos = (e) ->

    $('.ajaxloader').show()

    # TODO: consider avoding request for all photos when clicking .back-to-list
    # perhaps makes more sense to just popup box over existing photos, rather than
    # reloading them all


    $("#grid").empty()
    $.ajax "/photos#index",
      type: 'GET'
      dataType: 'json'
      success: (data, textStatus, jqXHR) ->
        data = _.sortBy(data, "likes").reverse()
        displayPhoto(data)
        # wookifyPhotos()


wookifyPhotos = ->
  $('#grid li').wookmark({
    align: 'center',
    autoResize: false, 
    container: $('#grid'), 
    offset: 5, 
    flexibleWidth: 0
    itemWidth: 210
  })   
  $('.ajaxloader').hide() 
  




    
$ ->
  $(document).on "click", "li.photo-container", enlargePhoto
  $(document).on "click", ".submitcomment", submitComment
  $(document).on 'click', ".back-to-list", "/photos"
  $(document).on 'click', ".emptyheart", updateLike
  $(document).on 'click', ".fullheart", updateLike


  $(window).load -> 
    wookifyPhotos()
