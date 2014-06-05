define ["app", "ace/ace", "hbs!/templates/app/edit/item", "css!/styles/app/edit/item"], (mod86, ace, itemTpl) ->
    mod86.module "Edit.Item", (Item, mod86, Backbone, Marionette, $, _) ->
        Item.Editor = Backbone.View.extend
            initialize: (model) ->
                @$el = @el = $("<div class='editorcontainer'></div>")
                @$el.html(itemTpl({content: JSON.stringify(model, null, "    ")}))
                @editor = ace.edit(@$el.find("#editor")[0])
                @editor.setTheme("ace/theme/solarized_dark")
                @editor.getSession().setMode("ace/mode/json")
            template:
                type: "handlebars"
                template: itemTpl
            tagName: "div"
