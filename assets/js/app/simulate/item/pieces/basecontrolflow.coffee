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

            afterInitialize: ->
                pos =
                    x: @model.get("x")
                    y: @model.get("y")
                for prop in @model.connectionProps
                    @model[prop].registerConnection(pos)
                @matrix.translate(@model.get("x"), @model.get("y"))
                @outerCircle = @paper.circle(0, 0, @options.radius)
                @outerCircle.attr
                    fill: @options.fill
                    stroke: @options.stroke
                    transform: @matrix.toTransformString()
                @text = @paper.text(0, 0, @innerText)
                @text.attr
                    "text-anchor": "middle"
                    "alignment-baseline": "mathematical"
                    "font-family": "Anonymous Pro"
                    transform: @matrix.toTransformString()

