define ["app", "simulate/item/pieces/baseic"], (mod86) ->
    mod86.module "Simulate.Item.Components", (Components, mod86, Backbone, Marionette, $, _) ->
        Components.BaseOneRegisterIC = Components.BaseIC.extend
            initialize: (options) ->
                options or (options = {})
                _.defaults options, {}
                Components.BaseIC::initialize.apply(this, arguments)
                _.extend(@options, options)
                options = @options
                @model.getPoint = ->
                    x: @get("x") + options.sizeX / 2
                    y: @get("y") + options.sizeY - 15
                @register = @addNum(@model.get("x")+5, @model.get("y")+options.sizeY-25, {sizeX: options.sizeX-10})
                @render()

            render: ->
                @updateNum(@register, @model.get(@prop))


