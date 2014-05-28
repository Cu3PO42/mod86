define ["app", "entities/pieces/basecontrolflow"], (mod86) ->
    mod86.module "Entities.Components", (Components, mod86, Backbone, Marionette, $, _) ->
        Components.Or = Components.BaseControlFlow.extend
            type: "Or"
            connectionProps: ["input1", "input2", "output"]
            defaults:
                input1: null
                input2: null
                output: null
            initialize: (models, options) ->
                @listenToOnce options.collection, "after:reset", ->
                    getter1 = @input1.valGetter()
                    getter2 = @input2.valGetter()
                    input = _.clone(Backbone.Events)
                    input.listenTo(@input1, "change", -> @trigger("change"))
                    input.listenTo(@input2, "change", -> @trigger("change"))
                    _set = @set.bind(this)
                    @output.write input, ->
                        res = Math.min(1, getter1() | getter2())
                        _set(state: !!res)
                        res

        _.defaults(Components.Or::defaults, Components.BaseControlFlow::defaults)
        Components.Or::connectionProps = _.union(Components.Or::connectionProps, Components.BaseControlFlow::connectionProps)
