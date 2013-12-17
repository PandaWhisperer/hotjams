#= require_self
#= require_tree ./templates
#= require_tree ./models
#= require_tree ./views
#= require_tree ./routers

window.Hotjams =
  Models: {}
  Collections: {}
  Routers: {}
  Views: {}

_.templateSettings = {
  interpolate : /\{\{(.+?)\}\}/g
};

window.player = {}

$ -> 

	# Singular Jam
	Jam = Backbone.Model.extend({
		url : ->
			return '/jams/' + @.get('id') + '.json'
	})

	# Jam View Object
	JamView = Backbone.View.extend({
		tagName : "div",
		className: 'row-fluid',
		template: _.template( $("#jam-template").html() ),
		events: {
			'click .post': 'playJam'
		}
		
		render : ->
			this.$el.html( this.template( this.model.attributes ) )
			this
		
		playJam: ->
			$($('#playa').children()[0]).attr('src',this.model.attributes.source);
			window.player.load()
			window.player.on( 'canplaythrough', ->
				window.player.pause()
				window.player.play()
			)
	})

	# Jam Collection
	Jams = Backbone.Collection.extend({
		model : Jam,
		url : '/jams.json'
	})

	# Jams Collection View
	JamsView = Backbone.View.extend({
		el : '#app',
		addOne : (jam) ->
			view = new JamView({ model : jam })
			this.$el.append( view.render().el )
	})


	window.jams = new Jams()

	window.jams.fetch({
		success : ->
			jams_view  = new JamsView({})
			
			_.each(window.jams.models, (model) ->
				jams_view.addOne(model)
			)

			createNew()
	})



			
	canPlayThrough = () ->
		window.player.pause()
		window.player.play()

	createNew = () ->
		next_song = window.jams.models.shift().attributes.source
		if  next_song
			child = $("#playa").children().first()
			child.remove()
			window.player = Popcorn.smart( "#playa", next_song )
			window.player.on( 'canplaythrough', canPlayThrough )
			window.player.on( 'ended', createNew )

		



	# pop.on('ended', ->
	# 	pop.destroy()
	# 	next = Popcorn.smart( "#playa", "http://soundcloud.com/evil_concussion/2013-03-09-atoms-for-peace-aka" )
	# 	next.on( 'canplaythrough', ->
	# 			next.pause()
	# 			next.play()
	# 	)
	# )
