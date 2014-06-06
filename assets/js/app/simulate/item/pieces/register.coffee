define ["app", "simulate/item/pieces/baseoneregisteric"], (mod86) ->
    mod86.module "Simulate.Item.Components", (Components, mod86, Backbone, Marionette, $, _) ->
        Components.Register = Components.BaseOneRegisterIC.extend
            prop: "value"
            text: "Register"
