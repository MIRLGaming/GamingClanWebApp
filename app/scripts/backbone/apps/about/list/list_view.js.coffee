@XRG.module "AboutApp.List", (List, App, Backbone, Marionette, $, _) ->

  class List.Layout extends App.Views.Layout
    template: "about/list/list_layout"

    regions:
      fooRegion: "#foo-region"