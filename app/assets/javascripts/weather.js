$(document).on('turbolinks:load', function(){
  $('#search_city').autocomplete({
    source: function( request, response ){
      $.ajax({
        url: '/locate_search',
        dataType: 'json',
        data: { term: request.term },
        success: function(data){
          response(data);
        },
        error: function(xhr, error){
          console.debug(xhr); console.debug(error);
        }
      });
    },
    minLength: 3
  });
});
