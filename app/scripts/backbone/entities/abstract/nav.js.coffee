@XRG.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->

  class Entities.Nav extends Entities.Model
    isDivider: -> @get("divider")

  class Entities.NavsCollection extends Entities.Collection
    model: Entities.Nav

    chooseByName: (nav) ->
      @choose (@findWhere(name: nav) or @first())

    @include "SingleChooser"

  API =
    getNavs: ->
      new Entities.NavsCollection [
        { divider: true }
        { name: "Home",  url: "#home",  icon: "fa fa-home" }
        { divider: true }
        { name: "Games",       url: "#game",       icon: "fa fa-gamepad" }
        { divider: true }
        { name: "About",       url: "#about",       icon: "fa fa-question" }
                
      ]

    getAdminNavs: ->
      new Entities.NavsCollection [
        { name: "Locations",  url: "#admin/locations",  icon: "fa fa-fw fa-map-marker" }
        { name: "Recipients", url: "#admin/recipients", icon: "fa fa-fw fa-user" }
        { name: "Contents",   url: "#admin/contents",   icon: "fa fa-fw fa-archive" }
        { name: "Outcomes",   url: "#admin/outcomes",   icon: "fa fa-fw fa-check-square-o" }
      ]

  App.reqres.setHandler "nav:entities", ->
    API.getNavs()

  App.reqres.setHandler "admin:nav:entities", ->
    API.getAdminNavs()