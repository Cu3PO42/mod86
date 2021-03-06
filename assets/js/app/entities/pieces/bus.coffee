define ["app", "entities/pieces/baselane"], (mod86) ->
    mod86.module "Entities.Components", (Components, mod86, Backbone, Marionette, $, _) ->
        Components.Bus = Components.BaseLane.extend
            type: "Bus"
            connectionProps: ["connectedParts"]
            defaults:
                orientation: "x"
                coord: 0
                connectedParts: []

        _.defaults(Components.Bus::defaults, Components.BaseLane::defaults)
        Components.Bus::connectionProps = _.union(Components.Bus::connectionProps, Components.BaseLane::connectionProps)