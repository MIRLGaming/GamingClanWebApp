@XRG.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->

  class Entities.Collection extends Backbone.Collection

  class Entities.FirebaseCollection extends Backbone.Firebase.Collection