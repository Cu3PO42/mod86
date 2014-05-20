define ["app", "entities/pieces/baseic"], (mod86) ->
    mod86.module "Entities.Components", (Components, mod86, Backbone, Marionette, $, _) ->
        Components.OpcodeSplitter = Components.BaseIC.extend
            type: "OpcodeSplitter"
            defaults:
                opcode: 0
                address: 0
                value: 0

            initialize: (models, options) ->
                @on "change:value", ->
                    val = @get("value")
                    @set
                        opcode: Math.floor(val / 10000)
                        address: val % 10000

        _.defaults(Components.OpcodeSplitter::defaults, Components.BaseIC::defaults)
        Components.OpcodeSplitter::connectionProps = _.union(Components.OpcodeSplitter::connectionProps, Components.BaseIC::connectionProps)
