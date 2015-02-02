@XRG.module "GamesApp", (GamesApp, App, Backbone, Marionette, $, _) ->

  class GamesApp.Router extends Marionette.AppRouter
    appRoutes:
      "game/:id/edit": "edit"
      "game": "list"
    before: ->
      App.vent.trigger "nav:choose", "Games"
    
  API =
    edit: (id, member) ->
      new GamesApp.Edit.Controller
        id: id
        crew: member

    list: ->
      new GamesApp.List.Controller

    newGame: (region, collection) ->
      new GamesApp.New.Controller
        region: region
        collection: collection

      
  App.addInitializer ->
    new GamesApp.Router
      controller: API
  
  App.commands.setHandler "new:game:member", (region, collection) ->
    API.newGame region, collection

  App.vent.on "game:member:clicked game:created", (member) ->
    App.navigate "game/"+member.id+"/edit" #Routes.edit_game_path(member.id)
    API.edit member.id, member

  App.vent.on "game:cancelled game:updated", (game) ->
    App.navigate "game" #Routes.game_index_path()
    API.list()