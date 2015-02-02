@XRG.module "HomeApp", (HomeApp, App, Backbone, Marionette, $, _) ->

  class HomeApp.Router extends Marionette.AppRouter
    appRoutes:
      "home": "list"
    
  API =
    list: ->
      App.vent.trigger "nav:choose", "Home"
      new HomeApp.List.Controller

      
  App.addInitializer ->
    new HomeApp.Router
      controller: API
  