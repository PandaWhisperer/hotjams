$ ->
	
# <div class='row-fluid'>
# 	<div class='post span8 offset2'>
# 		<div class='span2'> <img src=<%= @feed['picture'] %> class="img-rounded"> </div>
# 		<div class='span6'> <strong class='name'><%= @feed['name'] %></strong> </div>
# 		<div class='span6'> <p class='name'><%= @feed['from']['name'] %></p> </div>
		
# 		<p hidden class='source'><%= @feed['source'] %></p>
# 	</div>
# </div>


# <div class='span0'>
# 	<iframe id="playa" src="<%= @feed['source'] %>" width="100%" height="500px" hidden> </iframe>
# 	</br>
# </div>

 	# Random Jquery shit

	$('.post').click -> 
		source = $(this).find('.source').text()
		$('#playa').attr('src', source)

