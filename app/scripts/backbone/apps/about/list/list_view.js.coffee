@XRG.module "AboutApp.List", (List, App, Backbone, Marionette, $, _) ->

  class List.Layout extends App.Views.Layout
    template: "about/list/list_layout"
    
    regions:
      panelRegion: "#panel-region"
      contentRegion: "#content-region"

  class List.Panel extends App.Views.ItemView
  	template: "about/list/panel"

  class List.Content extends App.Views.ItemView
  	template: "about/list/content"