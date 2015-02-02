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
        { name: "Home",        url: "#home",        icon: "fa fa-home" }
        { name: "Roster",      url: "#roster",        icon: "fa fa-users", submenu: [
                                                                          { name: "Officers",     url: "#roster/officers",    icon: false }
                                                                          { name: "Players",      url: "#roster/players",     icon: false }
                                                                          { name: "Recruitment",  url: "#roster/recruitment", icon: false }
                                                                        ] 
                                                                      }
        { name: "Games",       url: "#games",        icon: "fa fa-gamepad" }
        { name: "About",       url: "#about",       icon: "fa fa-question" }         
      ]

    getAdminNavs: ->
      new Entities.NavsCollection [
        { name: "Locations",  url: "#admin/locations",  icon: "fa fa-fw fa-map-marker" }        
      ]

  App.reqres.setHandler "nav:entities", ->
    API.getNavs()

  App.reqres.setHandler "admin:nav:entities", ->
    API.getAdminNavs()