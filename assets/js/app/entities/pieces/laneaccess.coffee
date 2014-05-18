define ["app", "entities/pieces/basecontrolflow"], (mod86) ->
    mod86.module "Entities.Components", (Components, mod86, Backbone, Marionette, $, _) ->
        Components.LaneAccess = Components.BaseControlFlow.extend
            defaults:
                device: null
                lane: null
            read: ->
                device = @device
                lane = @lane
                lane.read(device, device.update(lane.getVal))
            unRead: ->
                @lane.unread(@device)
            write: ->
                @lane.write(@device, @device.getVal)
            unWrite: ->
                @lane.unWrite(@device)
