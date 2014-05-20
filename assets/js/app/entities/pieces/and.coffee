define ["app", "entities/pieces/basecontrolflow"], (mod86) ->
    mod86.module "Entities.Components", (Components, mod86, Backbone, Marionette, $, _) ->
        Components.And = Components.BaseControlFlow.extend
            type: "And"
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
                    @output.write input, ->
                        getter1() & getter2()

        _.defaults(Components.And::defaults, Components.BaseControlFlow::defaults)
        Components.And::connectionProps = _.union(Components.And::connectionProps, Components.BaseControlFlow::connectionProps)
