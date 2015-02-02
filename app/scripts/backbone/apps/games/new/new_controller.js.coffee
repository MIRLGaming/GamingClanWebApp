@XRG.module "GamesApp.New", (New, App, Backbone, Marionette, $, _) ->

  class New.Controller extends App.Controllers.Application

    initialize: (options) ->
      { collection } = options      
      game = App.request "new:game:entity"

      @listenTo game, "created", ->
        App.vent.trigger "game:created", game

      newView = @getNewView game, collection
      formView = App.request "form:component", newView,         
        onFormCancel: =>
          @region.close()

      @show formView

    getNewView: (game, collection) ->
      new New.Game
        model: game
        collection: collection