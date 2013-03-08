define ["backbone"], (Backbone) ->
  class Settings extends Backbone.Model
    defaults: 
      sound: false
    initialize: ->
      # Get Settings
      try 
        @set JSON.parse(window.localStorage.getItem("settings"))
      catch error
        console.log "Unable to set settings"
      @on "change", =>
        console.log "never called"
        @save()

    save: ->
      window.localStorage.setItem "settings", JSON.stringify(@toJSON())

  new Settings