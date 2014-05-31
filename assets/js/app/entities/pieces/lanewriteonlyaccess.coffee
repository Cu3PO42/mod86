define ["app", "entities/pieces/laneaccess"], (mod86) ->
    mod86.module "Entities.Components", (Components, mod86, Backbone, Marionette, $, _) ->
        Components.LaneWriteOnlyAccess = Components.LaneAccess.extend
            type: "LaneWriteOnlyAccess"
            defaults:
                alwayson: false
            initialize: (models, options) ->
                @listenToOnce(options.collection, "after:reset", @write) if @get("alwayson")
            read: ->
            unRead: ->

        _.defaults(Components.LaneWriteOnlyAccess::defaults, Components.LaneAccess::defaults)
        Components.LaneWriteOnlyAccess::connectionProps = _.union(Components.LaneWriteOnlyAccess::connectionProps, Components.LaneAccess::connectionProps)
