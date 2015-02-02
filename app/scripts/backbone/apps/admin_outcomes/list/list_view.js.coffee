@PE.module "AdminOutcomesApp.List", (List, App, Backbone, Marionette, $, _) ->

  class List.Layout extends App.Views.Layout
    template: "admin_outcomes/list/list_layout"

    regions:
      fooRegion: "#foo-region"