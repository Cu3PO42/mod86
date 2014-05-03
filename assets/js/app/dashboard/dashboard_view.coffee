define ["app", "hbs!/templates/app/dashboard"], (mod86, dashboardTpl) ->
    mod86.module "Dashboard", (Dashboard, mod86, Backbone, Marionette, $, _) ->
        Dashboard.Dashboard = Marionette.ItemView.extend
            template:
                type: "handlebars"
                template: dashboardTpl