@XRG.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->

  class Entities.Game extends Entities.Model
    #urlRoot: -> 'localhost:3000/game' #Routes.game_index_path()
    defaults: 
      image: 'xrg_logo_name.png',
      officalwebsite: ''
    
  class Entities.FirebaseGame extends Entities.FirebaseModel
    firebase: 'https://radiant-inferno-3153.firebaseio.com/XRGGames/'

  class Entities.GamesCollection extends Entities.FirebaseCollection
    model: Entities.Game
    firebase: 'https://radiant-inferno-3153.firebaseio.com/XRGGames/'
    #url: -> 'localhost:3000/game' #Routes.game_index_path()

  API =
    getGames: ->
      games = new Entities.GamesCollection
      window.gamesTesting = games
      games.fetch
        reset: true
      games

    getGame: (id) ->
      game = new Entities.Game
        id: id
      game.fetch()
      game

    newGame: ->
      new Backbone.Model

  App.reqres.setHandler "game:entities", ->
    API.getGames()

  App.reqres.setHandler "game:entity", (id) ->
    API.getGame id

  App.reqres.setHandler "new:game:entity", ->
    API.newGame()