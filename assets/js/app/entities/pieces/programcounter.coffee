define ["app", "entities/pieces/baseic"], (mod86) ->
    mod86.module "Entities.Components", (Components, mod86, Backbone, Marionette, $, _) ->
        Components.ProgramCounter = Backbone.Model.extend
            type: "ProgramCounter"
            connectionProps: []
            defaults:
                counter: 0
                adder: 0
            initialize: (models, options) ->
                @lastAdder = 0
                @listenToOnce options.collection, "after:reset", ->
                    @on "change:adder", ->
                        adder = @get("adder")
                        if adder and not @lastAdder
                            @set(counter: @get("counter")+1)
                        @lastAdder = adder

        _.defaults(Components.ProgramCounter::defaults, Components.BaseIC::defaults)
        Components.ProgramCounter::connectionProps = _.union(Components.ProgramCounter::connectionProps, Components.BaseIC::connectionProps)
