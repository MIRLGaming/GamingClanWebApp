@XRG.module "GamesApp.List", (List, App, Backbone, Marionette, $, _) ->

  class List.Layout extends App.Views.Layout
    template: "games/list/list_layout"

    regions:
      bannerRegion:   "#banner-region"
      panelRegion:  "#panel-region"
      newRegion:    "#new-region"
      gamesRegion:    "#games-region"
      

  class List.Banner extends App.Views.ItemView
    template: "games/list/_banner"

  class List.Panel extends App.Views.ItemView
    template: "games/list/_panel"

    triggers:
      "click #new-game" : "new:game:button:clicked"

  class List.Game extends App.Views.ItemView
    template: "games/list/_game"
    tagName: "li"
    className: "game-member"

    triggers:
      "click .game-delete button"   : "game:delete:clicked"
      "click .game-member-item"  : "game:member:clicked"
    ###
    events:
      "click": (event) ->
        $target = $(event.target)
        if $target.not('.external-link')
          event.preventDefault()
          @.trigger("game:member:clicked")
    ###


  class List.Empty extends App.Views.ItemView
    template: "games/list/_empty"
    tagName: "li"

  class List.Games extends App.Views.CompositeView
    template: "games/list/_games"
    childView: List.Game
    emptyView: List.Empty
    childViewContainer: "ul"

