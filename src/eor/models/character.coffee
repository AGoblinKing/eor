define ["backbone"], (Backbone) ->
  class Character extends Backbone.Model
    defaults: 
      name: "Viera"
      speed: 40
      pause: 10
      cursor: "<i class='icon-heart-empty small'/>"
      emotions: 
        ":)": "happy"
        ":(": "sad"
        ":!": "excited"
      eartouch: ":! Ayeeee~ Don't touch my ears! :("
      greeting: """
        Hello! :) My name is Vaary Viera. -> 
        Sadly I am a test character... | | So don't get too attached!"""