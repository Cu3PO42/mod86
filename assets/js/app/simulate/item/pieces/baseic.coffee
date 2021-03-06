define ["app", "hbs!/templates/app/lightbox", "hbs!/templates/app/simulate/edit"], (mod86, lightboxTpl, editTpl) ->
    mod86.module "Simulate.Item.Components", (Components, mod86, Backbone, Marionette, $, _) ->
        Components.BaseIC = Backbone.View.extend
            initialize: (options) ->
                options or (options = {})
                _.defaults options,
                    sizeX: 135
                    sizeY: 50
                    stroke: "#000"
                    fill: "#fff"
                    borderRadius: 5
                    registerLength: 5
                @options = options
                @paper = options.paper
                @frame = @paper.rect(@model.get("x"), @model.get("y"), options.sizeX, options.sizeY)
                @frame.attr
                    fill: options.fill
                    stroke: options.stroke
                    borderRadius: options.borderRadius
                @caption = @paper.text(@model.get("x")+options.sizeX/2, @model.get("y")+5, @text)
                @caption.attr
                    "text-anchor": "middle"
                    "alignment-baseline": "hanging"
                    "font-family": "Anonymous Pro"
                @listenTo(@model, "change", @render)
                @group = @paper.g(@frame, @caption)
                @$el = $(@el = @group.node)

            addNum: (x, y, options) ->
                options or (options = {})
                _.defaults options,
                    sizeX: 60
                    sizeY: 20
                tmp = {}
                tmp.container = @paper.rect(x, y, options.sizeX, options.sizeY)
                tmp.container.attr
                    fill: @options.fill
                    stroke: @options.stroke
                tmp.text = @paper.text(x+options.sizeX/2, y+options.sizeY/2, "")
                tmp.text.attr
                    fill: @options.stroke
                    "font-size": "18"
                    "text-anchor": "middle"
                    "alignment-baseline": "mathematical"
                    "font-family": "Anonymous Pro"
                tmp.group = @paper.g(tmp.container, tmp.text)
                $(tmp.group.node).addClass("prop")
                @group.add(tmp.group)
                tmp

            updateNum: (reg, val) ->
                padNum = (num, length) ->
                    res = num.toString()
                    res = "0" + res while res.length < length
                    res
                reg.text.node.innerHTML = padNum(val, @options.registerLength)

            openEdit: (prop) ->
                lightbox = lightboxTpl(buttontext: "OK", contained: editTpl(prop: prop, name: @text, editor: "<input type='number' min='0' max='99999'>"))
                @options.root.$el.append(lightbox)
                @options.root.keyboardUnregister()
                editor = @options.root.$el.find("#lightbox .editorcontainer > *")
                last = @model.get(prop)
                editor.val(last)
                set_ = @model.set.bind(@model)
                editor.on "input", (e) ->
                    newVal = editor.val()
                    if /^\d{1,5}$/.test(newVal)
                        tmp = {}
                        tmp[prop] = parseInt(newVal)
                        set_(tmp)
                        last = newVal
                    else
                        editor.val(last)

            afterInitialize: ->
                @options.newXMax(@model.get("x")+@options.sizeX+1)
                @options.newYMax(@model.get("y")+@options.sizeY+1)