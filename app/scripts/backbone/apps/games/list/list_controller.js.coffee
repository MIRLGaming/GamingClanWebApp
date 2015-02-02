@XRG.module "GamesApp.List", (List, App, Backbone, Marionette, $, _) ->

  class List.Controller extends App.Controllers.Application

    initialize: ->
      games = App.request "game:entities"

      @layout = @getLayoutView games

      # @listenTo @layout, "close", @close

      @listenTo @layout, "show", =>
        @bannerRegion()
        @panelRegion()
        @gamesRegion games
        

      @show @layout, loading: true

    bannerRegion: ->
      bannerView = @getTitleView()
      @show bannerView, region: @layout.bannerRegion

    panelRegion: ->
      panelView = @getPanelView()

      @listenTo panelView, "new:game:button:clicked", =>
        @newRegion()

      @show panelView, region: @layout.panelRegion

    newRegion: ->
      App.execute "new:game:member", @layout.newRegion, @layout.collection

    gamesRegion: (games) ->
      gameView = @getGameView games

      @listenTo gameView, "childview:game:member:clicked", (child, args) ->
        App.vent.trigger "game:member:clicked", args.model

      @listenTo gameView, "childview:game:delete:clicked", (child, args) ->
        model = args.model
        if confirm "Are you sure you want to delete #{model.get("title")}?" then gameView.collection.remove model else false

      @show gameView, region: @layout.gamesRegion
    
    
    getGameView: (games) ->
      new List.Games
        collection: games

    getPanelView: ->
      new List.Panel

    getTitleView: ->
      new List.Banner

    getLayoutView: (games) ->
      new List.Layout
        collection: games