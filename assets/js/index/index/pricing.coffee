require ["app", "hbs!templates/index/pricing.hbs"], (mod86, pricingTpl) ->
    mod86.module "Index", (Index, mod86, Backbone, Marionette, $, _) ->
        Index.Index = Marionette.ItemView.extend
            template:
                type: "handlebars"
                template: pricingTpl
            serializeData: -> {}
