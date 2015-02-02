@PE.module "AdminContentsApp", (AdminContentsApp, App, Backbone, Marionette, $, _) ->

  class AdminContentsApp.Router extends Marionette.AppRouter
    appRoutes:
      "admin/contents": "list"

  API =
    list: (region) ->
      return App.execute "admin:list", "Contents" if not region

      new AdminContentsApp.List.Controller
        region: region

  App.vent.on "admin:nav:chose", (nav, region) ->
    return if nav isnt "Contents"

    App.navigate "admin/contents"
    API.list region

  App.addInitializer ->
    new AdminContentsApp.Router
      controller: API
