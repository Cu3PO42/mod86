define ["app", "entities/pieces/basecontrolflow"], (mod86) ->
    mod86.module "Entities.Components", (Components, mod86, Backbone, Marionette, $, _) ->
        Components.EqualsZero = Components.BaseControlFlow.extend
            type: "EqualsZero"
            connectionProps: ["input", "output"]
            defaults:
                input: null
                output: null
                state: false
            initialize: (models, options) ->
                @listenToOnce options.collection, "after:reset", ->
                    getter = @input.valGetter()
                    _set = @set.bind(this)
                    @output.write @input, ->
                        res = 1 - (getter() and 1)
                        _set(state: !!res)
                        res

        _.defaults(Components.EqualsZero::defaults, Components.BaseControlFlow::defaults)
        Components.EqualsZero::connectionProps = _.union(Components.EqualsZero::connectionProps, Components.BaseControlFlow::connectionProps)
