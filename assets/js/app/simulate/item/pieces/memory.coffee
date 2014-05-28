define ["app", "simulate/item/pieces/basetworegisteric"], (mod86) ->
    mod86.module "Simulate.Item.Components", (Components, mod86, Backbone, Marionette, $, _) ->
        Components.Memory = Components.BaseTwoRegisterIC.extend
            text: "Memory"
            prop1: "address"
            prop2: "value"
