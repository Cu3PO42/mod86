define ["app", "simulate/item/pieces/basetworegisteric"], (mod86) ->
    mod86.module "Simulate.Item.Components", (Components, mod86, Backbone, Marionette, $, _) ->
        Components.OpcodeSplitter = Components.BaseTwoRegisterIC.extend
            text: "Opcode Splitter"
            prop1: "address"
            prop2: "opcode"
