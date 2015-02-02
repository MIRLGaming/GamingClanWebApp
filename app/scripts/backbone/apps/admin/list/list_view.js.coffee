@PE.module "AdminApp.List", (List, App, Backbone, Marionette, $, _) ->

  class List.Layout extends App.Views.Layout
    template: "admin/list/list_layout"

    regions:
      bannerRegion:      "#banner-region"
      articleRegion:     "#article-region"
      adminNavsRegion:   "#admin-navs-region"

  class List.Banner extends App.Views.ItemView
    template: "admin/list/_banner"

  class List.Nav extends App.Views.ItemView
    template: "admin/list/_nav"

    tagName: "li"

    events:
      "click a" : "choose"

    @include "Chooseable"

  class List.Navs extends App.Views.CollectionView
    tagName: "ul"
    className: "side-nav"
    itemView: List.Nav