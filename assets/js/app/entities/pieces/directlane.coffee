define ["app", "entities/pieces/baselane"], (mod86) ->
    mod86.module "Entities.Components", (Components, mod86, Backbone, Marionette, $, _) ->
        Components.DirectBus = Components.BaseLane.extend
            type: "DirectLane"
            connectionProps: ["partA", "partB"]
            defaults:
                partA: null
                partB: null
