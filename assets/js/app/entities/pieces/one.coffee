define ["app", "entities/pieces/basecontrolflow"], (mod86) ->
    mod86.module "Entities.Components", (Components, mod86, Backbone, Marionette, $, _) ->
        Components.One = Components.BaseControlFlow.extend
            type: "One"
            connectionProps: ["output"]
            defaults:
                output: null
                state: false
            write: ->
                @set(state: true)
                @output.write(this, (-> 1))
                true
            unWrite: ->
                @set(state: false)
                @output.unWrite(this)
                true

        _.defaults(Components.One::defaults, Components.BaseControlFlow::defaults)
        Components.One::connectionProps = _.union(Components.One::connectionProps, Components.BaseControlFlow::connectionProps)
