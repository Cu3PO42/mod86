define ["app"], (mod86) ->
    mod86.module "Simulate.Item.Components", (Components, mod86, Backbone, Marionette, $, _) ->
        Components.Accumulator = Backbone.View.extend
            initialize: (options) ->
                options or (options = {})
                _.defaults options,
                    sizeX: 100
                    sizeY: 50
                @paper = options.paper
                @mainNode = @paper.rect(@model.get("x"), @model.get("y"), options.sizeX, options.sizeY)
                @$el = $(@el = @mainNode.node)
                @value= @paper.text(@model.get("x")+25, @model.get("y")+25, "00000")
                @value.attr
                    fill: 'white'
                @listenTo(@model, "change", @render)
                @render()

            render: ->
                padNum = (num, length) ->
                    res = num.toString()
                    res = "0" + res while res.length < length
                    res
                @value.node.innerHTML = padNum(@model.get("value"), 5)
