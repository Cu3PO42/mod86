define ["app"], (mod86) ->
    mod86.module "Simulate.Item.Components", (Components, mod86, Backbone, Marionette, $, _) ->
        Components.DirectLane = Backbone.View.extend
            initialize: (options) ->
                @paper = options.paper
                @listenToOnce @model, "connection", (pos) ->
                    pos1 = pos
                    @listenToOnce @model, "connection", (pos) ->
                        @line = @paper.line(pos1.x, pos1.y, pos.x, pos.y)
                        @line.attr
                            stroke: "#000"
                        options.groups.lanes.add(@line)
            render: ->
            afterInitialize: ->
