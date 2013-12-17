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
			spawnAndPlay( this.$el.index() )
			
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

			spawnAndPlay(0)
	})



	# # # # # # # #  Helper Functions # # # # # # # #

	spawnAndPlay = (song_index) ->
		# Check for valid song index
		if song_index >= 0 && song_index < window.jams.models.length
			
			# Kill the current media player node
			killMediaPlayer()
			
			# Create a new media player node with the new song
			song = window.jams.models[song_index]
			spawnPlayer(song.attributes.source)
			
			# Play the song when ready
			window.player.on( 'canplaythrough', playMedia )

			# Queue up the next song
			window.player.on( 'ended', () -> spawnAndPlay( song_index + 1 ) )
			
	killMediaPlayer = () ->
		# Remove the old player
		child = $("#playa").children().first()
		child.remove()

	spawnPlayer = (song_source) ->
		window.player = Popcorn.smart( "#playa", song_source )

	playMedia = () ->
		window.player.play()

