@XRG.module "HomeApp.List", (List, App, Backbone, Marionette, $, _) ->

  class List.Controller extends App.Controllers.Application

    initialize: ->
      slides = App.request "slide:entities"
      @layout = @getLayoutView()

      # @listenTo @layout, "close", @close

      @listenTo @layout, "show", =>
        @bannerRegion()
        @panelRegion(slides)
        @contentRegion()

      @show @layout

    bannerRegion: ->
      bannerView = @getTitleView()
      @show bannerView, region: @layout.bannerRegion

    panelRegion: (slides) ->
      panelView = @getPanelView(slides)
      @show panelView, region: @layout.panelRegion
    
    contentRegion: ->
      contentView = @getContentView()
      @show contentView, region: @layout.contentRegion

    getContentView: ->
      new List.Content

    getPanelView: (slides) ->
      new List.Slider
        collection: slides

    getTitleView: ->
      new List.Banner

    getLayoutView: ->
      new List.Layout