define ["app", "snap"], (mod86, Snap) ->
    mod86.module "Simulate.Item.Components", (Components, mod86, Backbone, Marionette, $, _) ->
        Components.BaseControlFlow = Backbone.View.extend
            initialize: (options) ->
                options or (options = {})
                _.defaults options,
                    radius: 15
                    fill: "#FFF"
                    stroke: "#000"
                    strokeWidth: "3px"
                @options = options
                @paper = options.paper
                @matrix = new Snap.Matrix()
                @group = @paper.g()
                @$el = $(@el = @group.node)

            afterInitialize: ->
                pos =
                    x: @model.get("x")
                    y: @model.get("y")
                @options.newXMax(pos.x+@options.radius)
                @options.newYMax(pos.y+@options.radius)
                for prop in @model.connectionProps
                    @model[prop].registerConnection(pos)
                @matrix.translate(@model.get("x"), @model.get("y"))
                @outerCircle = @paper.circle(0, 0, @options.radius)
                @outerCircle.attr
                    fill: @options.fill
                    stroke: @options.stroke
                @text = @paper.text(0, 0, @innerText)
                @text.attr
                    "text-anchor": "middle"
                    "alignment-baseline": "mathematical"
                    "font-family": "Anonymous Pro"
                @group.add(@outerCircle, @text)
                @group.attr
                    transform: @matrix.toTransformString()
