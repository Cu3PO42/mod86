define ["app", "simulate/item/pieces/basetworegisteric"], (mod86) ->
    mod86.module "Simulate.Item.Components", (Components, mod86, Backbone, Marionette, $, _) ->
        Components.Adder = Components.BaseTwoRegisterIC.extend
            text: "Adder"
            prop1: "value1"
            prop2: "value2"
