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
                    @output.write @input, ->
                        not not (getter1() or getter2())

        _.defaults(Components.Or::defaults, Components.BaseControlFlow::defaults)
        Components.Or::connectionProps = _.union(Components.Or::connectionProps, Components.BaseControlFlow::connectionProps)
