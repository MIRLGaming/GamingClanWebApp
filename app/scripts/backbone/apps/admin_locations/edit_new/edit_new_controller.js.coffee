@PE.module "AdminLocationsApp.EditNew", (EditNew, App, Backbone, Marionette, $, _) ->

  class EditNew.Controller extends App.Controllers.Application

    initialize: (options) ->
      { locations, location } = options
      location ?= App.request "new:location:entity"

      locationView = @getLocationView locations, location

      form = App.request "form:component", locationView,
        proxy: "dialog"
        onFormCancel: => @region.close()
        onFormSuccess: => @region.close()

      @show form

    getLocationView: (locations, location) ->
      new EditNew.Location
        collection: locations
        model: location