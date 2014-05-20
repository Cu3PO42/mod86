define ["app", "entities/pieces/baselane"], (mod86) ->
    mod86.module "Entities.Components", (Components, mod86, Backbone, Marionette, $, _) ->
        Components.DirectLane = Components.BaseLane.extend
            type: "DirectLane"
            connectionProps: []

        _.defaults(Components.DirectLane::defaults, Components.BaseLane::defaults)
        Components.DirectLane::connectionProps = _.union(Components.DirectLane::connectionProps, Components.BaseLane::connectionProps)
