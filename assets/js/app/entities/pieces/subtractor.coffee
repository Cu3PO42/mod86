define ["app", "entities/pieces/baseic"], (mod86) ->
    mod86.module "Entities.Components", (Components, mod86, Backbone, Marionette, $, _) ->
        Components.Subtractor = Components.BaseIC.extend
            type: "Subtractor"
            defaults:
                value1: 0
                value2: 0
                difference: 0

            initialize: (models, options) ->
                @on "change", ->
                    res = (@get("value1") - @get("value2"))
                    if res < 0 then res += 100000
                    @set(difference: res)

        _.defaults(Components.Subtractor::defaults, Components.BaseIC::defaults)
        Components.Subtractor::connectionProps = _.union(Components.Subtractor::connectionProps, Components.BaseIC::connectionProps)
