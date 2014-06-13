// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap.min
//= require_tree .

function animationHover(element, animation){
  element = $(element);
  element.hover(
    function() {
      element.addClass('animated ' + animation);
    },
    function(){
      //wait for animation to finish before removing classes
      window.setTimeout( function(){
        element.removeClass('animated ' + animation);
      }, 2000);
    }
  );
};



$(document).ready(function(){
  $('#flashNav').delay(2000).slideUp(1000);
  $('.containerUser').each(function() {
        animationHover(this, 'pulse');
    });
  $('#typeaheadBar').typeahead([
    {
      name: 'mysearch',
      local: [ "Pens", "t-shirts", "sneakers", "bikes", "Heels", "teapots", "bow ties", "umbrellas", "surfboards", "shells", "balls", "flowers"]

   
      // source: function (response) {
      //       titles = $.map(response, function (i, item) {
      //         return { id: item.id, name: item.title}
      //       });

      //       console.log(titles);
      //       return titles;
      //   }
    //   source: function (query, process) {
    //     console.log(query, process)
    //     return $.ajax({
    //         url: $('#myTypeahead').data('link'),
    //         type: 'post',
    //         data: { query: query },
    //         dataType: 'json',
    //         success: function (result) {

    //             var resultList = result.map(function (item) {
    //                 var aItem = { id: item.Id, name: item.Name };
    //                 return JSON.stringify(aItem);
    //             });

    //             return process(resultList);

    //         }
    //     });
    
    }
  ]);

});

