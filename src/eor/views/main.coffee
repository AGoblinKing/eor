define [
  "./view"
  "./character"
  "tpl!../templates/main"
  "css!../styles/body"
  "css!../styles/fontawesome.css"
], (View, CharacterView, MainTPL) ->
  class Main extends View
    id: "main"
    template: MainTPL
    afterRender: ->
      @$("#top").append CharacterView.render().el