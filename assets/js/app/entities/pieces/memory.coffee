define ["app", "entities/pieces/baseic"], (mod86) ->
    mod86.module "Entities.Components", (Components, mod86, Backbone, Marionette, $, _) ->
        Components.Memory = Components.BaseIC.extend
            connectionProps: []
            type: "Memory"
            defaults:
                memory: []
                address: 0
                value: 0
            initialize: ->
                @on "change:value", ->
                    @get("memory")[@get("address")] = @get("value")
                @on "change:address", ->
                    @set(value: @get("memory")[@get("address")]) or 0
                @trigger("change:address")

        _.defaults(Components.Memory::defaults, Components.BaseIC::defaults)
        Components.Memory::connectionProps = _.union(Components.Memory::connectionProps, Components.BaseIC::connectionProps)
