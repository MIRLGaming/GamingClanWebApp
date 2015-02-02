@PE.module "CrewApp.Edit", (Edit, App, Backbone, Marionette, $, _) ->

  class Edit.Layout extends App.Views.Layout
    template: "crew/edit/edit_layout"

    regions:
      bannerRegion:  "#banner-region"
      formRegion:   "#form-region"

  class Edit.Banner extends App.Views.ItemView
    template: "crew/edit/edit_banner"

    modelEvents:
      "updated" : "render"

  class Edit.Crew extends App.Views.ItemView
    template: "crew/edit/edit_crew"
    #
    # onFormSubmit: (data) ->
    #   console.log "Edit.Crew onFormSubmit", data
    #   false