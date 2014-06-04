define ["app", "hbs!/templates/app/simulate/list", "hbs!/templates/app/simulate/list_item", "css!/styles/app/simulate/list"], (mod86, listTpl, listItemTpl) ->
    mod86.module "Simulate.List", (List, mod86, Backbone, Marionette, $, _) ->
        List.Simulation = Marionette.ItemView.extend
            template:
                type: "handlebars"
                template: listItemTpl
            tagName: "tr"
            events:
                "click td": "navigate"
            navigate: ->
                Backbone.history.navigate("simulate/#{this.model.get('id')}")
                mod86.trigger("simulate:item", this.model.get('id'))

        List.Simulations = Marionette.CompositeView.extend
            tagName: "table"
            className: "list centered"
            itemView: List.Simulation
            itemViewContainer: "tbody"
            template:
                type: "handlebars"
                template: listTpl