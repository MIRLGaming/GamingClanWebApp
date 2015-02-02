@XRG = do (Backbone, Marionette) ->

  App = new Marionette.Application

  App.on "before:start", (options) ->
    App.environment = options.environment
    App.navs = App.request "nav:entities"

  App.addRegions
    headerRegion: "#header-region"
    mainRegion:    "#main-region"
    footerRegion: "#footer-region"

  App.rootRoute = "home"

  App.addInitializer ->
    App.module("HeaderApp").start(App.navs)
    App.module("FooterApp").start()

  App.vent.on           "nav:choose", (nav) -> App.navs.chooseByName nav
  App.reqres.setHandler "default:region", -> App.mainRegion
  App.reqres.setHandler "concern", (concern) -> App.Concerns[concern]

  App.on "start", ->
    ## create our specialized dialog region
    @addRegions dialogRegion: { selector: "#dialog-region", regionType: App.Regions.Dialog }

    ## starts listening to Backbone History
    @startHistory()

    ## navigates us to the root route unless we're already navigated somewhere else
    @navigate(@rootRoute, trigger: true) unless @getCurrentRoute()

  App