@PE.module "AdminRecipientsApp.List", (List, App, Backbone, Marionette, $, _) ->

  class List.Layout extends App.Views.Layout
    template: "admin_recipients/list/list_layout"

    regions:
      fooRegion: "#foo-region"