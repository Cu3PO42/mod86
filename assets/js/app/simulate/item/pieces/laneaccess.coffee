define ["app", "simulate/item/pieces/basecontrolflow"], (mod86) ->
    mod86.module "Simulate.Item.Components", (Components, mod86, Backbone, Marionette, $, _) ->
        Components.LaneAccess = Components.BaseControlFlow.extend
            innerText: ""
            afterInitialize: ->
                @matrix.rotate(@model.get("direction")*90,@model.get("x"),@model.get("y"))
                Components.BaseControlFlow::afterInitialize.apply(this, arguments)
                @listenTo @model, "read", ->
                    @text.node.innerHTML = "<"
                @listenTo @model, "write", ->
                    @text.node.innerHTML = ">"
                @listenTo @model, "stop", ->
                    @text.node.innerHTML = ""
