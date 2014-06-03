define ["app", "simulate/item/pieces/basecontrolflow"], (mod86) ->
    mod86.module "Simulate.Item.Components", (Components, mod86, Backbone, Marionette, $, _) ->
        Components.LaneAccess = Components.BaseControlFlow.extend
            innerText: ""
            afterInitialize: ->
                @matrix.rotate(@model.get("direction")*90,@model.get("x"),@model.get("y"))
                Components.BaseControlFlow::afterInitialize.apply(this, arguments)
                m = new Snap.Matrix()
                m.rotate(@model.get("direction")*-90, 0, 0)
                @bindings = @paper.text(0, @options.radius+3, "i")
                @bindings.attr
                    "text-anchor": "middle"
                    "alignment-baseline": "hanging"
                    "font-family": "Anonymous Pro"
                    "transform": m.toTransformString()
                @group.add(@bindings)
                @bindings.node.innerHTML = ""
                bbox = @bindings.getBBox()
                @options.newXMax(@model.get("x")+bbox.width/2)
                @options.newYMax(@model.get("y")+@options.radius+3+bbox.height)
                bindings = []
                @listenTo @model, "keybinding:new", (key, prop) ->
                    if prop == "read"
                        bindings.unshift(key.toUpperCase())
                    else
                        bindings.push(key)
                    @bindings.node.innerHTML = bindings.join(", ")
                @listenTo @model, "read", ->
                    @text.node.innerHTML = "<"
                @listenTo @model, "write", ->
                    @text.node.innerHTML = ">"
                @listenTo @model, "stop", ->
                    @text.node.innerHTML = ""