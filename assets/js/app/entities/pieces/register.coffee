define ["app", "entities/pieces/baseic"], (mod86) ->
    mod86.module "Entities.Components", (Components, mod86, Backbone, Marionette, $, _) ->
        Components.Register = Components.BaseIC.extend
            type: "Register"
            connectionProps: []
            defaults:
                value: 0

        _.defaults(Components.Register::defaults, Components.BaseIC::defaults)
        Components.Register::connectionProps = _.union(Components.Register::connectionProps, Components.BaseIC::connectionProps)
