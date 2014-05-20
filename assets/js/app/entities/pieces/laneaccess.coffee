define ["app", "entities/pieces/basecontrolflow"], (mod86) ->
    mod86.module "Entities.Components", (Components, mod86, Backbone, Marionette, $, _) ->
        Components.LaneAccess = Components.BaseControlFlow.extend
            type: "LaneAccess"
            defaults:
                device: null
                lane: null
            connectionProps: ["device", "lane"]
            initialize: ->
                @doingReadWrite = false
            read: ->
                if @doingReadWrite
                    mod86.trigger("simulation:error", {msg: "Can't read from and write to lane with one device at the same time."})
                else
                    device = @device
                    lane = @lane
                    @doingReadWrite = true
                    lane.read(device, device.update(lane.valGetter()))
            unRead: ->
                @doingReadWrite = false
                @lane.unRead(@device)
            write: ->
                if @doingReadWrite
                    mod86.trigger("simulation:error", {msg: "Can't read from and write to lane with one device at the same time."})
                else
                    @doingReadWrite = true
                    @lane.write(@device, @device.valGetter())
            unWrite: ->
                @doingReadWrite = false
                @lane.unWrite(@device)

        _.defaults(Components.LaneAccess::defaults, Components.BaseControlFlow::defaults)
        Components.LaneAccess::connectionProps = _.union(Components.LaneAccess::connectionProps, Components.BaseControlFlow::connectionProps)
