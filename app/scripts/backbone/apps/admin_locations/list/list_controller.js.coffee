@PE.module "AdminLocationsApp.List", (List, App, Backbone, Marionette, $, _) ->

  class List.Controller extends App.Controllers.Application

    initialize: ->
      locations = App.request "location:entities"

      @layout = @getLayoutView()

      @listenTo @layout, "show", =>
        @panelRegion locations
        @locationsRegion locations

      @show @layout,
        loading:
          entities: locations

    panelRegion: (locations) ->
      panelView = @getPanelView()

      @listenTo panelView, "new:location:clicked", ->
        App.vent.trigger "new:location:clicked", locations

      @show panelView, region: @layout.panelRegion

    locationsRegion: (locations) ->
      listView = @getListView locations

      @listenTo locations, "model:created", (location) ->
        location.choose()

      @listenTo listView, "childview:edit:location:clicked", (iv, args) ->
        args.model.choose()
        App.vent.trigger "edit:location:clicked", args.model

      @listenTo listView, "childview:destroy:location:clicked", (iv, args) ->
        { model } = args
        if confirm "Are you sure you want to delete: #{model.get("name")}" then model.destroy() else false

      @show listView, region: @layout.locationsRegion

    getPanelView: ->
      new List.Panel

    getListView: (locations) ->
      new List.Locations
        collection: locations

    getLayoutView: ->
      new List.Layout