define ["app"], (mod86) ->
    mod86.module "Simulate.Item.Components", (Components, mod86, Backbone, Marionette, $, _) ->
        Components.Memory = Backbone.View.extend
            initialize: (options) ->
                options or (options = {})
                _.defaults options,
                    sizeX: 150
                    sizeY: 50
                @paper = options.paper
                @mainNode = @paper.rect(@model.get("x"), @model.get("y"), options.sizeX, options.sizeY)
                @$el = $(@el = @mainNode.node)
                @addr = @paper.text(@model.get("x")+75, @model.get("y")+25, "0000")
                @addr.attr
                    fill: 'white'
                @value= @paper.text(@model.get("x")+25, @model.get("y")+25, "0000")
                @value.attr
                    fill: 'white'
                @listenTo(@model, "change", @render)
                @render()

            render: ->
                padNum = (num, length) ->
                    res = num.toString()
                    res = "0" + res while res.length < length
                    res
                @addr.node.innerHTML = padNum(@model.get("address"), 4)
                @value.node.innerHTML = padNum(@model.getMemory(), 4)
