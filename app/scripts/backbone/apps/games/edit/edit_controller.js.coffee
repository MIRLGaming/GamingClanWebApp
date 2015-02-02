@XRG.module "GamesApp.Edit", (Edit, App, Backbone, Marionette, $, _) ->

  class Edit.Controller extends App.Controllers.Application

    initialize: (options) ->
      { game, id } = options
      game or= App.request "game:entity", id

      @listenTo game, "updated", ->
        App.vent.trigger "game:updated", game

      @layout = @getLayoutView game

      @listenTo @layout, "show", =>
        @bannerRegion game
        @formRegion game

      @show @layout, loading: true

    bannerRegion: (game) ->
      bannerView = @getTitleView game
      @show bannerView, region: @layout.bannerRegion

    formRegion: (game) ->
      editView = @getEditView game

      formView = App.request "form:component", editView,
        onFormCancel: ->
          App.vent.trigger "game:cancelled", game


      @show formView, region: @layout.formRegion

    getTitleView: (game) ->
      new Edit.Banner
        model: game

    getLayoutView: (game) ->
      new Edit.Layout
        model: game

    getEditView: (game) ->
      new Edit.Game
        model: game