@XRG.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->

  class Entities.Slide extends Entities.Model
    defaults:
      title: ""
      image: ""

  class Entities.SlidesCollection extends Entities.Collection
    model: Entities.Slide

  API =
    getSlides: ->
      new Entities.SlidesCollection [
        { title: "slide 1",  image: "banner1.png" }
        { title: "slide 2",  image: "banner2.png" }
        { title: "slide 3",  image: "banner3.png" }                
      ]

  App.reqres.setHandler "slide:entities", ->
    API.getSlides()
