@XRG.module "AboutApp", (AboutApp, App, Backbone, Marionette, $, _) ->

  class AboutApp.Router extends Marionette.AppRouter
    appRoutes:
      "about": "list"
    
  API =
    list: ->
      App.vent.trigger "nav:choose", "About"
      new AboutApp.List.Controller

      
  App.addInitializer ->
    new AboutApp.Router
      controller: API
  