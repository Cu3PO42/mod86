define ["app", "entities/pieces/basecontrolflow"], (mod86) ->
    mod86.module "Entities.Components", (Components, mod86, Backbone, Marionette, $, _) ->
        Components.EqualsZero = Components.BaseControlFlow.extend
            type: "EqualsZero"
            connectionProps: ["input", "output"]
            defaults:
                input: null
                output: null
            initialize: (models, options) ->
                @listenToOnce options.collection, "after:reset", ->
                    getter = @input.valGetter()
                    @output.write @input, ->
                        Math.max(getter(), 1)

        _.defaults(Components.EqualsZero::defaults, Components.BaseControlFlow::defaults)
        Components.EqualsZero::connectionProps = _.union(Components.EqualsZero::connectionProps, Components.BaseControlFlow::connectionProps)
