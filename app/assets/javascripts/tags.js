$(document).ready(function() {
  $(".tag-place").tagit({
  	allowSpaces: true,
		autocomplete: {
			source: function( request, response ) {
				$.ajax({
        	url: "/autocomplete_tag.json",
          dataType: "json",
          data: {
            term: request.term
          },
					success: function( data ) {
            response( $.map( data, function( item ) {
              return {
                label: item.value,
                value: item.value
              }
            }));
          }
        });
    	},
      minLength: 0,
		}
  });
});