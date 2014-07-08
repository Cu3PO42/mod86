define ["app", "marionette", "dashboard/dashboard_controller", "simulate/list/list_controller", "simulate/item/item_controller", "edit/list/list_controller", "edit/item/item_controller"], (mod86, Marionette) ->
    mod86.Router = Marionette.AppRouter.extend
        appRoutes:
            "": "showDashboard"
            "simulate": "showSimulationList"
            "simulate/:id": "showSimulation"
            "edit": "showEditList"
            "edit/new": "editNew"
            "edit/:id": "showEdit"
    API =
        showDashboard: ->
            mod86.Dashboard.Controller.show()
        showSimulationList: ->
            mod86.Simulate.List.Controller.show()
        showSimulation: (id) ->
            mod86.Simulate.Item.Controller.show(id)
        showEditList: ->
            mod86.Edit.List.Controller.show()
        showEdit: (id) ->
            mod86.Edit.Item.Controller.edit(id)
        editClone: (id) ->
            mod86.Edit.Item.Controller.clone(id)
        editNew: ->
            mod86.Edit.Item.Controller.create()
        logout: ->
            $.get "/api/logout", (data) ->
                if data.type == "logout" and data.success
                    mod86.trigger "logout:success"
                else
                    mod86.trigger "logout:failed"
    mod86.on "initialize:after", ->
        new mod86.Router
            controller: API
        Backbone.history.start pushState: true
    $("header#header nav a").on "click", (e) ->
        e.preventDefault()
        Backbone.history.navigate($(this).attr("href"), true)
    $("header#header a.logout").click (e) ->
        e.preventDefault()
        API.logout()
    mod86.on "logout:success", ->
        window.location.href = "#{window.location.protocol}//#{window.location.hostname}"
    mod86.on "logout:failed", ->
        alert("Logout failed.")
    mod86.on "simulate:item", (id) ->
        Backbone.history.navigate("simulate/#{id}")
        API.showSimulation(id)
    mod86.on "edit:item", (id) ->
        Backbone.history.navigate("edit/#{id}")
        API.showEdit(id)
    mod86.on "edit:item:clone", (id) ->
        Backbone.history.navigate("edit/new")
        API.editClone(id)
    mod86.on "edit:item:new", ->
        Backbone.history.navigate("edit/new")
        API.editNew()
