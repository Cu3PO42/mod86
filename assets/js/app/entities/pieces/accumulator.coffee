define ["app", "entities/pieces/baseic"], (mod86) ->
    mod86.module "Entities.Components", (Components, mod86, Backbone, Marionette, $, _) ->
        Components.Accumulator = Components.BaseIC.extend
            type: "Accumulator"
            connectionProps: []
            defaults:
                value: 0
            initialize: ->
                @doingAddSub = false
            addOne: ->
                newVal = @get("value")+1
                @set(value: (if newVal == 10000 then 0 else newVal))
            subOne: ->
                newVal = @get("value")-1
                @set(value: Math.max(newVal, 0))
            onAdd: ->
                if @doingAddSub
                    mod86.trigger("simulation:error", {msg: "Can't add und subtract on an accumulator at the same time."})
                else
                    @doingAddSub = true
                    @addOne()
            offAdd: ->
                @doingAddSub = false
            onSub: ->
                if @doingAddSub
                    mod86.trigger("simulation:error", {msg: "Can't add und subtract on an accumulator at the same time."})
                else
                    @doingAddSub = true
                    @subOne()
            offSub: ->
                @doingAddSub = false

        _.defaults(Components.Accumulator::defaults, Components.BaseIC::defaults)
        Components.Accumulator::connectionProps = _.union(Components.Accumulator::connectionProps, Components.BaseIC::connectionProps)
