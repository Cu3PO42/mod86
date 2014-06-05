define ["app", "hbs!/templates/app/edit/list", "hbs!/templates/app/edit/list_item", "css!/styles/app/edit/list"], (mod86, listTpl, listItemTpl) ->
    mod86.module "Edit.List", (List, mod86, Backbone, Marionette, $, _) ->
        List.Processor = Marionette.ItemView.extend
            template:
                type: "handlebars"
                template: listItemTpl
            tagName: "tr"
            events:
                "click td.js-edit": "navigate"
                "click td.js-delete": "deleteProcessor"
                "click td.js-clone": "cloneProcessor"

            render: ->
                @$el.addClass("disabled") unless @model.get("modifyable")
                Marionette.ItemView::render.apply(this, arguments)

            navigate: ->
                if @model.get("modifyable")
                    mod86.trigger("edit:item", @model.get('id'))

            deleteProcessor: (e) ->
                if @model.get("modifyable")
                    @model.destroy()

            cloneProcessor: ->
                mod86.trigger("edit:item:clone", @model.get("id"))

        List.Processors = Marionette.CompositeView.extend
            className: "listcontainer centered"
            itemView: List.Processor
            itemViewContainer: "tbody"
            template:
                type: "handlebars"
                template: listTpl

            events:
                "click .js-new": "newProcessor"

            newProcessor: ->
                mod86.trigger("edit:item:new")
