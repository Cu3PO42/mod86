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
                @set(value: (if newVal == 100000 then 0 else newVal))
            subOne: ->
                newVal = @get("value")-1
                @set(value: (if newVal < 0 then 99999 else newVal))
            onAdd: ->
                if @doingAddSub
                    mod86.trigger("simulation:error", {msg: "Can't add und subtract on an accumulator at the same time."})
                    false
                else
                    @doingAddSub = true
                    @addOne()
                    @trigger("add")
                    true
            offAdd: ->
                @doingAddSub = false
                @trigger("stop")
                true
            onSub: ->
                if @doingAddSub
                    mod86.trigger("simulation:error", {msg: "Can't add und subtract on an accumulator at the same time."})
                    false
                else
                    @doingAddSub = true
                    @subOne()
                    @trigger("sub")
                    true
            offSub: ->
                @doingAddSub = false
                @trigger("stop")
                true

        _.defaults(Components.Accumulator::defaults, Components.BaseIC::defaults)
        Components.Accumulator::connectionProps = _.union(Components.Accumulator::connectionProps, Components.BaseIC::connectionProps)
