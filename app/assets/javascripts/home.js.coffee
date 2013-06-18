$ ->
	
	# Singular Jam

	Jam = Backbone.Model.extend({
		url : ->
			return '/jams/' + @.get('id') + '.json'
	})
	
	# Jam Collection

	Jams = Backbone.Collection.extend({
		model : Jam
	})

	jams = new Jams()
	jams.url = '/jams.json'

	jams.fetch({
		success : ->
			jams_view  = new JamsView({})
			_.each(jams.models, (model) ->
				jams_view.addOne(model)
			)
	})


	# Jams Collection View

	JamsView = Backbone.View.extend({
		el : '.post'
		addOne : (model) ->
			view = new JamView({ model : model })
			$('#app').append(view.render())
	})

	# Jam View Object

	JamView = Backbone.View.extend({
		tagName : "div",
		render : ->
			$(this.el).append("<div>" + @.model.get('name') + "</div>")
			$(this.el).append("<div>" + @.model.get('user').name + "</div>")
			$(this.el).append("</br>")
	})




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

