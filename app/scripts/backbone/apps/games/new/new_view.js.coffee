@XRG.module "GamesApp.New", (New, App, Backbone, Marionette, $, _) ->

  class New.Game extends App.Views.ItemView
    template: "games/new/new_game"

    form:
      buttons:
        placement: "left"