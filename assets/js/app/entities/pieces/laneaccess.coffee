define ["app", "entities/pieces/basecontrolflow"], (mod86) ->
    mod86.module "Entities.Components", (Components, mod86, Backbone, Marionette, $, _) ->
        Components.LaneAccess = Components.BaseControlFlow.extend
            type: "LaneAccess"
            defaults:
                device: null
                lane: null
            connectionProps: ["device", "lane"]
            read: ->
                device = @device
                lane = @lane
                lane.read(device, device.update(lane.valGetter()))
            unRead: ->
                @lane.unRead(@device)
            write: ->
                @lane.write(@device, @device.valGetter())
            unWrite: ->
                @lane.unWrite(@device)

        _.defaults(Components.LaneAccess::defaults, Components.BaseControlFlow::defaults)
        Components.LaneAccess::connectionProps = _.union(Components.LaneAccess::connectionProps, Components.BaseControlFlow::connectionProps)
