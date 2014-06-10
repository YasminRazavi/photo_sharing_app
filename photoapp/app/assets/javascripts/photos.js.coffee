
ready = ->

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
  $(document).on "click", "#grid li", -> 
    id = $(this).attr('id')
    console.log id
    $("#grid li").hide()
    $(this).find("img").css({width: "400px"})
    $(this).addClass("zoomed")
    $(this).css({position: "initial"})
    $(this).show()

  displayPhoto = (photosArray) ->

    _(photosArray).each((photo) -> 

        $('#grid').append("<li id=photo_list_#{photo.id}><img id=photo_#{photo.id} class=homephotos src=#{photo.image} width=200></li>"))
       
$(document).ready(ready)

  

  









# $(document).on 'click','#grid li', ->
  
#   id = $($(this).context.innerHTML).attr('id')
#   url = "/photos/"+id
#   alert(url)
#   alert(id)
#   $.ajax url,
#           type: 'GET'
#           dataType: 'json'
#           success: (data, textStatus, jqXHR) -> 

#                   # magnificPopup({
#                   # showCloseBtn: true,
#                   # midClick: true,
#                   # type: 'ajax',
#                   #   ajax: {settings: {
#                   #           data: data
#                   #                               
#                   # })     
#               img = "<img id=#{data.id} class=popPhotos src=#{data.image} width=300 height=500>"
#               img_name = "<h2 class=poptitle> #{data.title}</h2>"
#               img_descp= "<h2 class=popdescp> #{data.caption}</h2>"
#               pop = window.open("", "popupWindow", "width=600,height=600,scrollbars=yes")
#               temp = pop.document
#               temp.write(img_name)
#               temp.write(img_descp)
#               temp.write(img)
