define ["app"], (mod86) ->
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

            afterInitialize: ->
                @outerCircle = @paper.circle(@model.get("x"), @model.get("y"), @options.radius)
                @outerCircle.attr
                    fill: @options.fill
                    stroke: @options.stroke
                @text = @paper.text(@model.get("x"), @model.get("y"), @innerText)
                @text.attr
                    "text-anchor": "middle"
                    "alignment-baseline": "mathematical"
                    "font-family": "Anonymous Pro"

