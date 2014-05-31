define ["app", "simulate/item/pieces/laneaccess"], (mod86) ->
    mod86.module "Simulate.Item.Components", (Components, mod86, Backbone, Marionette, $, _) ->
        Components.LaneWriteOnlyAccess = Components.LaneAccess.extend
            afterInitialize: ->
                Components.LaneAccess::afterInitialize.apply(this, arguments)
                @text.node.innerHTML = ">" if @model.get("alwayson")
