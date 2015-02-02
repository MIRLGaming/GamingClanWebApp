@PE.module "AdminLocationsApp.EditNew", (EditNew, App, Backbone, Marionette, $, _) ->

  class EditNew.Location extends App.Views.Layout
    template: "admin_locations/edit_new/edit_new_location"

    dialog: ->
      title: @getTitle()

    getTitle: ->
      (if @model.isNew() then "New" else "Edit") + " Location"

    templateHelpers: ->
      dangerLookups: @model.dangerLookups