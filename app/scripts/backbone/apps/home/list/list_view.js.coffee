@XRG.module "HomeApp.List", (List, App, Backbone, Marionette, $, _) ->

  class List.Layout extends App.Views.Layout
    template: "home/list/list_layout"
    regions:
      bannerRegion: "#banner-region"
      panelRegion: "#panel-region"
      contentRegion: "#content-region"

  class List.Banner extends App.Views.ItemView
    template: "home/list/_banner"

  class List.Panel extends App.Views.ItemView
    template: "home/list/_panel"

  class List.Content extends App.Views.ItemView
    template: "home/list/_content"

  class List.Slide extends App.Views.ItemView
    template: "home/list/_slide"
    className: "slide"
  
  class List.Slider extends App.Views.CollectionView
    childView: List.Slide
    onShow: ->
      @$el.slick
        infinite: true
        autoplay: true
    onClose: ->
      @$el.unslick()