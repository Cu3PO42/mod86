define ["app", "entities/pieces/basecontrolflow"], (mod86) ->
    mod86.module "Entities.Components", (Components, mod86, Backbone, Marionette, $, _) ->
        Components.One = Components.BaseControlFlow.extend
            type: "One"
            connectionProps: ["output"]
            defaults:
                output: null
            write: ->
                @output.write(this, (-> 1))
            unWrite: ->
                @output.unWrite(this)

        _.defaults(Components.Or::defaults, Components.BaseControlFlow::defaults)
        Components.Or::connectionProps = _.union(Components.Or::connectionProps, Components.BaseControlFlow::connectionProps)
