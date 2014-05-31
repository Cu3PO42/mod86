define ["app", "entities/pieces/laneaccess"], (mod86) ->
    mod86.module "Entities.Components", (Components, mod86, Backbone, Marionette, $, _) ->
        Components.LaneReadOnlyAccess = Components.LaneAccess.extend
            type: "LaneReadOnlyAccess"
            defaults:
                alwayson: true
            initialize: (models, options) ->
                @listenToOnce(options.collection, "after:reset", @read) if @get("alwayson")
            write: ->
            unWrite: ->

        _.defaults(Components.LaneReadOnlyAccess::defaults, Components.LaneAccess::defaults)
        Components.LaneReadOnlyAccess::connectionProps = _.union(Components.LaneReadOnlyAccess::connectionProps, Components.LaneAccess::connectionProps)
