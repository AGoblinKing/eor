define "eor", [
  "backbone" 
  "./views/character"
  "./models/character"
], (Backbone, CharacterView, Character) ->
  class AppRouter extends Backbone.Router
    routes: 
      "": "default"

    default: ->
      cModel = new Character()
      $("body").html (new CharacterView model: cModel).render().el

  new AppRouter()

  Backbone.history.start()