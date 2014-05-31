define ["app", "simulate/item/pieces/basecontrolflowcolortoggle"], (mod86) ->
    mod86.module "Simulate.Item.Components", (Components, mod86, Backbone, Marionette, $, _) ->
        Components.One = Components.BaseControlFlowColorToggle.extend
            innerText: "1"
            initialize: ->
                Components.BaseControlFlow::initialize.apply(this, arguments)
                @listenTo @model, "keybinding:new", (key, prop) ->
                    @keybinding = @paper.text(0,@options.radius+3, key.toUpperCase())
                    @keybinding.attr
                        "text-anchor": "middle"
                        "alignment-baseline": "hanging"
                        "font-family": "Anonymous Pro"
                    @group.add(@keybinding)
                    bbox = @keybinding.getBBox()
                    @options.newXMax(@model.get("x")+bbox.width/2)
                    @options.newYMax(@model.get("y")+@options.radius+3+bbox.height)
