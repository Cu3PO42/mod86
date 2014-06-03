define ["app", "hbs!/templates/app/lightbox", "hbs!/templates/app/simulate/edit", "simulate/item/pieces/basetworegisteric"], (mod86, lightboxTpl, editTpl) ->
    mod86.module "Simulate.Item.Components", (Components, mod86, Backbone, Marionette, $, _) ->
        Components.Memory = Components.BaseTwoRegisterIC.extend
            text: "Memory"
            prop1: "address"
            prop2: "value"

            events:
                "click": "openEdit"

            openEdit: ->
                lightbox = lightboxTpl(buttontext: "OK", contained: editTpl(prop: "memory", name: @text, editor: "<textarea></textarea>"))
                @options.root.$el.append(lightbox)
                @options.root.keyboardUnregister()
                editor = @options.root.$el.find("#lightbox .editorcontainer > *")
                mem = @model.get("memory")
                last = mem.join("\n")
                set_ = @model.set.bind(@model)
                editor.val(last)
                editor.on "input", (e) ->
                    newVal = editor.val()
                    if /^(?:\d{1,5}\r?\n)*\d{1,5}(?:\r?\n)?$/.test(newVal)
                        set_(memory: newVal.trim().split(/\r?\n/).map((x) -> parseInt(x)))
                        last = newVal
                    else
                        editor.val(last)
