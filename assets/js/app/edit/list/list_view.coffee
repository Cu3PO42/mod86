define ["app", "hbs!/templates/app/edit/list", "hbs!/templates/app/edit/list_item", "css!/styles/app/edit/list"], (mod86, listTpl, listItemTpl) ->
    mod86.module "Edit.List", (List, mod86, Backbone, Marionette, $, _) ->
        List.Processor = Marionette.ItemView.extend
            template:
                type: "handlebars"
                template: listItemTpl
            tagName: "tr"
            events:
                "click td": "navigate"
            navigate: ->
                Backbone.history.navigate("edit/#{@model.get('id')}")
                mod86.trigger("edit:item", @model.get('id'))

        List.Processors = Marionette.CompositeView.extend
            tagName: "table"
            className: "list centered"
            itemView: List.Processor
            itemViewContainer: "tbody"
            template:
                type: "handlebars"
                template: listTpl
