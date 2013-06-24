$ ->
	$('.post').click -> 
		source = $(this).find('.source').text()
		$('#playa').attr('src', source)
		alert(source)
		
