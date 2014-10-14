function picas_pill_toggle(pill, path, picas) {
  $.ajax({
	  url: path,
	  type: ($(pill).find('.glyphicon-ok').length == 0) ? 'POST' : 'DELETE',
	  data: { picas: picas },
	  dataType: 'script'
  })
}