define ["app", "raphael", "backbone.raphael", "entities/processor", "simulate/item/pieces/all"], (mod86, Raphael) ->
    mod86.module "Simulate.Item", (Item, mod86, Backbone, Marionette, $, _) ->
        Item.Processor = Backbone.View.extend
            initialize: (options) ->
                @collection = new mod86.Entities.Processor(options.collection)
                canvas = document.createElement("div")
                @paper = new Raphael(canvas, options.height, options.width)
                @$el = @el = canvas
                @views = []
                that = this
                @collection.forEach (item) ->
                    view = new mod86.Simulate.Item.Components[item.get("type")](model: item, paper: that.paper)
                    that.views.push(view)

            render: ->
                @views.forEach (item) ->
                    item.render()
