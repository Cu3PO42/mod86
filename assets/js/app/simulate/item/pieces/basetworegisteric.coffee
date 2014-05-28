define ["app", "simulate/item/pieces/baseic"], (mod86) ->
    mod86.module "Simulate.Item.Components", (Components, mod86, Backbone, Marionette, $, _) ->
        Components.BaseTwoRegisterIC = Components.BaseIC.extend
            initialize: (options) ->
                options or (options = {})
                _.defaults options,
                    sizeY: 75
                Components.BaseIC::initialize.apply(this, arguments)
                _.extend(@options, options)
                options = @options
                @model.getPoint = (arg) ->
                    if arg == @prop1
                        x: @get("x") + options.sizeX - 35
                        y: @get("y") + options.sizeY - 40
                    else
                        x: @get("x") + 35
                        y: @get("y") + options.sizeY - 15
                @register1 = @addNum(@model.get("x")+options.sizeX-65, @model.get("y")+options.sizeY-50)
                @register2 = @addNum(@model.get("x")+5, @model.get("y")+options.sizeY-25)
                @render()


            render: ->
                @updateNum(@register1, @model.get(@prop1))
                @updateNum(@register2, @model.get(@prop2))
