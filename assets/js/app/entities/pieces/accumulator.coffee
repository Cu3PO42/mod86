define ["app", "entities/pieces/baseic"], (mod86) ->
    mod86.module "Entities.Components", (Components, mod86, Backbone, Marionette, $, _) ->
        Components.Accumulator = Components.BaseIC.extend
            type: "Accumulator"
            connectionProps: []
            defaults:
                value: 0
                x: 0
                y: 0
            addOne: ->
                @set(value: @get("value")+1)
            subOne: ->
                @set(value: @get("value")-1)

        _.defaults(Components.Accumulator::defaults, Components.BaseIC::defaults)
        Components.Accumulator::connectionProps = _.union(Components.Accumulator::connectionProps, Components.BaseIC::connectionProps)
