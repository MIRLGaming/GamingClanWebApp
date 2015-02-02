@PE.module "AdminApp", (AdminApp, App, Backbone, Marionette, $, _) ->

  class AdminApp.Router extends Marionette.AppRouter
    appRoutes:
      "admin": "list"

  API =
    list: (nav) ->
      App.vent.trigger "nav:choose", "Admin"
      new AdminApp.List.Controller
        nav: nav

  App.commands.setHandler "admin:list", (nav) ->
    API.list nav

  App.addInitializer ->
    new AdminApp.Router
      controller: API
