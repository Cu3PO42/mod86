require ["app", "dashboard_view"], (mod86) ->
    mod86.module "Dashboard", (Dashboard, mod86, Backbone, Marionette, $, _) ->
        Dashboard.Controller =
            show: ->
                mod86.mainRegion.show new Dashboard.Dashboard()