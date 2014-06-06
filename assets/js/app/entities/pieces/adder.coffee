define ["app", "entities/pieces/baseic"], (mod86) ->
    mod86.module "Entities.Components", (Components, mod86, Backbone, Marionette, $, _) ->
        Components.Adder = Components.BaseIC.extend
            type: "Adder"
            defaults:
                value1: 0
                value2: 0
                sum: 0

            initialize: (models, options) ->
                @on "change", ->
                    res = (@get("value1") + @get("value2")) % 100000
                    @set(sum: res)

        _.defaults(Components.Adder::defaults, Components.BaseIC::defaults)
        Components.Adder::connectionProps = _.union(Components.Adder::connectionProps, Components.BaseIC::connectionProps)
