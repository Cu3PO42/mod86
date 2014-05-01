require ["app", "hbs!/templates/app/simulate/list", "hbs!/templates/app/simulate/list_item"], (mod86, listTpl, listItemTpl) ->
    mod86.module "Simulate.List", (List, mod86, Backbone, Marionette, $, _) ->
        List.Simulation = Marionette.ItemView.extend
            template:
                type: "handlebars"
                template: listItemTpl
            tagName: "tr"

        List.Simulations = Marionette.CompositeView.extend
            tagName: "table"
            className: "list"
            itemView: List.Simulation
            itemViewContainer: "tbody"
            template:
                type: "handlebars"
                template: "listTpl"