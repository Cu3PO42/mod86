define ["app"], (mod86) ->
    mod86.module "Simulate.Item.Components", (Components, mod86, Backbone, Marionette, $, _) ->
        Components.Bus = Backbone.View.extend
            render: ->
            afterInitialize: ->
            initialize: (options) ->
                @paper = options.paper
                @line = @paper.path()
                @line.attr
                    stroke: "#000"
                options.groups.lanes.add(@line)
                @listenTo @model, "connection", ->
                   @line.attr
                       d: @calculatePath()
                @$el = $(@el = @line.node)
                options[{x: "newXMax", y: "newYMax"}[@model.get("orientation")]](@model.get("coord"))

            calculatePath: ->
                if @model.connectedParts.length >= 2
                    invert =
                        x: "y"
                        y: "x"
                    pointToString = (p) -> "#{p.x},#{p.y}"
                    coord = @model.get("coord")
                    orientation = @model.get("orientation")
                    @model.connectedParts.sort (a, b) ->
                        a[orientation] - b[orientation]
                    normalizedPoints = @model.connectedParts.map (p) ->
                        res = _.clone(p)
                        res[invert[orientation]] = coord
                        res
                    res = "M#{pointToString(normalizedPoints[0])}L#{pointToString(normalizedPoints[normalizedPoints.length-1])}"
                    for i in [0...normalizedPoints.length]
                        res += "M#{pointToString(normalizedPoints[i])}L#{pointToString(@model.connectedParts[i])}"
                    res += "Z"
                else
                    ""