define ["app", "simulate/item/pieces/basecontrolflow"], (mod86) ->
    mod86.module "Simulate.Item.Components", (Components, mod86, Backbone, Marionette, $, _) ->
        Components.BaseControlFlowColorToggle = Components.BaseControlFlow.extend
            initialize: ->
                Components.BaseControlFlow::initialize.apply(this, arguments)
                @listenTo @model, "change:state", ->
                    if @model.get("state")
                        @outerCircle.attr
                            fill: @options.stroke
                        @text.attr
                            fill: @options.fill
                    else
                        @outerCircle.attr
                            fill: @options.fill
                        @text.attr
                            fill: @options.stroke

            afterInitialize: ->
                Components.BaseControlFlow::afterInitialize.apply(this, arguments)
                @model.trigger("change:state")
