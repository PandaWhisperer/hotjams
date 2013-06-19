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
