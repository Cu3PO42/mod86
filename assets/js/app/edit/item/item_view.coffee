define ["app", "ace/ace", "hbs!/templates/app/edit/item", "css!/styles/app/edit/item"], (mod86, ace, itemTpl) ->
    mod86.module "Edit.Item", (Item, mod86, Backbone, Marionette, $, _) ->
        formatModel = (model) ->
            obj = model.toJSON()
            res = {}
            res[prop] = obj[prop] for prop in ["name", "author", "description", "pieces", "keyboardBindings"]
            JSON.stringify(res, null, "    ")

        Item.Editor = Backbone.View.extend
            initialize: (options) ->
                @$el = @el = $("<div class='editorcontainer'></div>")
                @$el.html(itemTpl({name: @model.get("name"), content: formatModel(@model)}))
                @editor = ace.edit(@$el.find("#editor")[0])
                @editor.setTheme("ace/theme/solarized_dark")
                @editor.getSession().setMode("ace/mode/json")
                @editor.getSession().setTabSize(4)
                @editor.getSession().setUseSoftTabs(true)
                @editor.getSession().setUseWrapMode(true)
                @listenToOnce @model, "change", ->
                    @editor.setValue(formatModel(@model))
                    @updateName()
                @listenTo @model, "change:id", ->
                    Backbone.history.navigate("/edit/#{@model.get("id")}")

            updateName: ->
                @$(".processorname").empty().html(@model.get("name"))

            simulate: ->
                @saveModel (model) ->
                    mod86.trigger("simulate:item", model.get("id"))

            simulateNewtab: ->
                @saveModel (model) ->
                    window.open("#{window.location.protocol}//#{window.location.host}/simulate/#{model.get('id')}", "_blank")

            saveModel: (next) ->
                txt = @editor.getValue()
                try
                    update = JSON.parse(txt)
                    res = {}
                    (res[prop] = update[prop] if update.hasOwnProperty(prop)) for prop in ["name", "author", "description", "pieces", "keyboardBindings"]
                    @model.set(res)
                    @updateName()
                    @model.save [], success: (model) ->
                        model.fetch success: next
                catch e
                    alert("Can't save invalid JSON.")

            template:
                type: "handlebars"
                template: itemTpl

            tagName: "div"

            events:
                "click .js-save": "saveModel"
                "click .js-simulate": "simulate"
                "click .js-simulate-newtab": "simulateNewtab"