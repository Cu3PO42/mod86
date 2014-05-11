define ["app"], (mod86) ->
    mod86.module "Simulate.Item.Components", (Components, mod86, Backbone, Marionette, $, _) ->
        Components.Memory = Backbone.View.extend
            initialize: (options) ->
                console.log options
                options or (options = {})
                _.defaults options,
                    sizeX: 150
                    sizeY: 50
                @paper = options.paper
                @paper.setStart()
                @elem = @paper.rect(@model.get("x"), @model.get("y"), options.sizeX, options.sizeY)
                @elems = @paper.setFinish()
                @$el = $(@el = @elem.node)

            render: ->
