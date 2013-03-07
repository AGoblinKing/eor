define ["backbone"], (Backbone) ->
  class Character extends Backbone.Model
    defaults: 
      name: "Viera"
      id: "viera"
      speed: 100
      pause: 25
      emotions: 
        ":)": "smile"
      greeting: """
        Hello! :) My name is Vary Viera. -> 
        Sadly I am a test character... | So don't get too attached!"""