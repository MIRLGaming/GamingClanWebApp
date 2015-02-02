@PE.module "DeliveriesApp.List", (List, App, Backbone, Marionette, $, _) ->

  class List.Layout extends App.Views.Layout
    template: "deliveries/list/list_layout"

    regions:
      fooRegion: "#foo-region"