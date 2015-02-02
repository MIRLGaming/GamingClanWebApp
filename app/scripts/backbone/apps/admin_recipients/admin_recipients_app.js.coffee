@PE.module "AdminRecipientsApp", (AdminRecipientsApp, App, Backbone, Marionette, $, _) ->

  class AdminRecipientsApp.Router extends Marionette.AppRouter
    appRoutes:
      "admin/recipients": "list"

  API =
    list: (region) ->
      return App.execute "admin:list", "Recipients" if not region

      new AdminRecipientsApp.List.Controller
        region: region

  App.vent.on "admin:nav:chose", (nav, region) ->
    return if nav isnt "Recipients"

    App.navigate "admin/recipients"
    API.list region

  App.addInitializer ->
    new AdminRecipientsApp.Router
      controller: API
