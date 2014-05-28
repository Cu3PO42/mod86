define ["app", "simulate/item/pieces/baseoneregisteric"], (mod86) ->
    mod86.module "Simulate.Item.Components", (Components, mod86, Backbone, Marionette, $, _) ->
        Components.Accumulator = Components.BaseOneRegisterIC.extend
            prop: "value"
            text: "Accumulator"
