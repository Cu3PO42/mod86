define ["app", "simulate/item/pieces/basetworegisteric"], (mod86) ->
    mod86.module "Simulate.Item.Components", (Components, mod86, Backbone, Marionette, $, _) ->
        Components.OpcodeSplitter = Components.BaseTwoRegisterIC.extend
            text: "OpcodeSplitter"
            prop1: "address"
            prop2: "opcode"
            disableEdit1: true
            disableEdit2: true
