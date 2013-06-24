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

# Singular Jam
Jam = Backbone.Model.extend({
	url : ->
		return '/jams/' + @.get('id') + '.json'
})

# Jam View Object
JamView = Backbone.View.extend({
	tagName : "div",
	className: 'row-fluid',
	template: _.template( $("#jam-template").html() )
	render : ->
		this.$el.html( this.template( this.model.toJSON() ) )
		this
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
		this.$el.append('<br/>')
})


jams = new Jams()

jams.fetch({
	success : ->
		jams_view  = new JamsView({})
		_.each(jams.models, (model) ->
			jams_view.addOne(model)
		)
})



