define ["app", "simulate/item/pieces/basecontrolflowcolortoggle"], (mod86) ->
    mod86.module "Simulate.Item.Components", (Components, mod86, Backbone, Marionette, $, _) ->
        Components.EqualsZero = Components.BaseControlFlowColorToggle.extend
            innerText: "=0"
