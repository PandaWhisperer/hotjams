$ ->
	
	# Singular Jam

	Jam = Backbone.Model.extend({
		url : ->
			return '/jams/' + 27 + '.json'
	})

	jam = new Jam()

	jam.fetch({
		success : ->
			view = new JamView({ model : jam })
			$('#app').append( view.render() )
	})

	
	# Jam Collection

	Jams = Backbone.Collection.extend({
		model : Jam
	})

	jams = new Jams()
	jams.url = '/jams.json'

	jams.fetch({
		success : ->
			console.log(jams)
	})

	# Jam View Object

	JamView = Backbone.View.extend({
		tagName : "div"
		render : ->
			$(this.el).append("<div>" + @.model.get('type') + "</div>")
			$(this.el).append("<div>" + @.model.get('from').name + "</div>")
	})




# <div class='row-fluid'>
# 	<div class='post span8 offset2'>
# 		<div class='span2'> <img src=<%= @feed['picture'] %> class="img-rounded"> </div>
# 		<div class='span6'> <strong class='name'><%= @feed['name'] %></strong> </div>
# 		<div class='span6'> <p class='name'><%= @feed['from']['name'] %></p> </div>
		
# 		<p hidden class='source'><%= @feed['source'] %></p>
# 	</div>
# </div>


# # <div class='span0'>
# # 	<iframe id="playa" src="<%= @feed['source'] %>" width="100%" height="500px" hidden> </iframe>
# # 	</br>
# # </div>



	# Popcorn bitch
	pop = Popcorn.smart( "#player", "http://www.youtube.com/watch?v=Lw3W4TGZ5oY" );

 	# Random Jquery shit

	$('.post').hover ->
		$(this).css( 'cursor', 'pointer' )
	$('.post').click -> 
		source = $(this).find('.source').text()
		$('#playa').attr('src', source)
