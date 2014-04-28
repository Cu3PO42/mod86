define ["app", "hbs!/templates/index/index"], (mod86, indexTpl) ->
	mod86.module "Index", (Index, mod86, Backbone, Marionette, $, _) ->
		mod86.StaticView = Marionette.ItemView.extend
			serializeData: ->
	mod86.StaticView