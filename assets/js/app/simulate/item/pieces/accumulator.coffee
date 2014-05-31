define ["app", "simulate/item/pieces/baseoneregisteric"], (mod86) ->
    mod86.module "Simulate.Item.Components", (Components, mod86, Backbone, Marionette, $, _) ->
        Components.Accumulator = Components.BaseOneRegisterIC.extend
            prop: "value"
            text: "Accumulator"
            initialize: ->
                Components.BaseOneRegisterIC::initialize.apply(this, arguments)
                @plus = @addControl("+", @model.get("x")+@options.sizeX/3, "add")
                @minus = @addControl("-", @model.get("x")+@options.sizeX*2/3, "sub")
                @listenTo @model, "keybinding:new", (key, prop) ->
                    if prop == "onAdd"
                        @plus.binding.node.innerHTML = key.toUpperCase()
                    else if prop == "onSub"
                        @minus.binding.node.innerHTML = key.toUpperCase()

            addControl: (str, posX, e) ->
                posY = @model.get("y")+@options.sizeY
                @options.newYMax(posY+46)
                tmp = {}
                tmp.connectionLine = @paper.line(posX, posY, posX, posY+30)
                tmp.connectionLine.attr
                    stroke: "#000"
                tmp.circle = @paper.circle(posX, posY+30, 15)
                tmp.circle.attr
                    stroke: "#000"
                    fill: "#FFF"
                @listenTo @model, e, ->
                    tmp.circle.attr
                        stroke: "#FFF"
                        fill: "#000"
                    tmp.text.attr
                        fill: "#FFF"
                @listenTo @model, "stop", ->
                    tmp.circle.attr
                        stroke: "#000"
                        fill: "#FFF"
                    tmp.text.attr
                        fill: "#000"
                tmp.text = @paper.text(posX, posY+30, str)
                tmp.text.attr
                    "text-anchor": "middle"
                    "alignment-baseline": "mathematical"
                    "font-family": "Anonymous Pro"
                tmp.binding = @paper.text(posX, posY+48, "i")
                tmp.binding.attr
                    "text-anchor": "middle"
                    "alignment-baseline": "hanging"
                    "font-family": "Anonymous Pro"
                bbox = tmp.binding.getBBox()
                tmp.binding.node.innerHTML = ""
                @options.newXMax(posX+bbox.width/2)
                @options.newYMax(posY+48+bbox.height)
                @group.add(tmp.connectionLine, tmp.circle, tmp.text, tmp.binding)
                tmp

