@XRG.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->

  class Entities.Location extends Entities.Model
    urlRoot: -> Routes.admin_locations_path()

    dangerLookups: {low: "primary", medium: "moderate", high: "alert"}

    mutators:
      dangerClass: ->
        @dangerLookups[@get("danger")] if @get "danger"

      dangerFormatted: ->
        _(@get "danger").capitalize() if @get("danger")

  class Entities.LocationsCollection extends Entities.Collection
    model: Entities.Location
    url: -> Routes.admin_locations_path()
    comparator: (m) -> m.get("name").toLowerCase()

    @include "SingleChooser"

  API =
    getLocations: ->
      locations = new Entities.LocationsCollection
      locations.fetch
        reset: true
      locations

    newLocation: ->
      new Entities.Location

  App.reqres.setHandler "location:entities", ->
    API.getLocations()

  App.reqres.setHandler "new:location:entity", ->
    API.newLocation()