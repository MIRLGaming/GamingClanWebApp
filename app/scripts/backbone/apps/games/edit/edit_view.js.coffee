@XRG.module "GamesApp.Edit", (Edit, App, Backbone, Marionette, $, _) ->

  class Edit.Layout extends App.Views.Layout
    template: "games/edit/edit_layout"

    regions:
      bannerRegion:  "#banner-region"
      formRegion:   "#form-region"

  class Edit.Banner extends App.Views.ItemView
    template: "games/edit/edit_banner"

    modelEvents:
      "updated" : "render"

  class Edit.Game extends App.Views.ItemView
    template: "games/edit/edit_game"
    #
    # onFormSubmit: (data) ->
    #   console.log "Edit.Crew onFormSubmit", data
    #   false