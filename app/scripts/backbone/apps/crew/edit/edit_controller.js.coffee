@PE.module "CrewApp.Edit", (Edit, App, Backbone, Marionette, $, _) ->

  class Edit.Controller extends App.Controllers.Application

    initialize: (options) ->
      { crew, id } = options
      crew or= App.request "crew:entity", id

      @listenTo crew, "updated", ->
        App.vent.trigger "crew:updated", crew

      @layout = @getLayoutView crew

      @listenTo @layout, "show", =>
        @bannerRegion crew
        @formRegion crew

      @show @layout, loading: true

    bannerRegion: (crew) ->
      bannerView = @getTitleView crew
      @show bannerView, region: @layout.bannerRegion

    formRegion: (crew) ->
      editView = @getEditView crew

      @listenTo editView, "form:cancel", ->
        App.vent.trigger "crew:cancelled", crew

      formView = App.request "form:wrapper", editView

      @show formView, region: @layout.formRegion

    getTitleView: (crew) ->
      new Edit.Banner
        model: crew

    getLayoutView: (crew) ->
      new Edit.Layout
        model: crew

    getEditView: (crew) ->
      new Edit.Crew
        model: crew