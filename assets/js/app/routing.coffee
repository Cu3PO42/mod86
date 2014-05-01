define ["app", "dashboard/dashboard_controller"], (mod86) ->
    mod86.Router = Marionette.AppRouter.extend
        appRoutes:
            "": "showDashboard"
            "simulate": "showSimulateList"
            "simulate/:id": "showSimulation"
    API =
        showDashboard: ->
            mod86.Dashboard.Controller.show()
        showSimulationList: ->

        logout: ->
            $.get "/logout", (data) ->
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
        window.location.href = "http://localhost:1337"
    mod86.on "dashboard:show", ->
        Backbone.history.navigate("/dashboard")
        API.showDashboard()
