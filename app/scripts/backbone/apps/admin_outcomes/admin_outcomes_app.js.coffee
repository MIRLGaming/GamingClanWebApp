@PE.module "AdminOutcomesApp", (AdminOutcomesApp, App, Backbone, Marionette, $, _) ->

  class AdminOutcomesApp.Router extends Marionette.AppRouter
    appRoutes:
      "admin/outcomes": "list"

  API =
    list: (region) ->
      return App.execute "admin:list", "Outcomes" if not region

      new AdminOutcomesApp.List.Controller
        region: region

  App.vent.on "admin:nav:chose", (nav, region) ->
    return if nav isnt "Outcomes"

    App.navigate "admin/outcomes"
    API.list region

  App.addInitializer ->
    new AdminOutcomesApp.Router
      controller: API
