@PE.module "AdminApp.List", (List, App, Backbone, Marionette, $, _) ->

  class List.Controller extends App.Controllers.Application

    initialize: (options) ->
      adminNavs = App.request "admin:nav:entities"

      @listenTo adminNavs, "collection:chose:one", (chosen) ->
        App.vent.trigger "admin:nav:chose", chosen.get("name"), @layout.articleRegion

      @layout = @getLayoutView()

      @listenTo @layout, "show", =>
        @bannerRegion()
        @listRegion adminNavs, options.nav

      @show @layout

    bannerRegion: ->
      bannerView = @getBannerView()
      @show bannerView, region: @layout.bannerRegion

    listRegion: (adminNavs, nav) ->
      adminNavs.chooseByName nav

      listView = @getListView adminNavs
      @show listView, region: @layout.adminNavsRegion

    getListView: (adminNavs) ->
      new List.Navs
        collection: adminNavs

    getBannerView: ->
      new List.Banner

    getLayoutView: ->
      new List.Layout