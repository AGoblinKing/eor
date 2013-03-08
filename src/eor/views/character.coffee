define [
  "./view"
  "tpl!../templates/character"
  "../models/settings"
  "../models/character"
  "css!../styles/character"
], (View, TPL, Settings, Character) ->
  class CharacterView extends View
    rendering: false
    attributes: 
      class: "character"
    template: TPL
    initialize: ->
      @setBlink()
    setBlink: ->
      setTimeout =>
        @$(".face").addClass("blink")
        setTimeout =>
          @$(".face").removeClass("blink")
          @setBlink()
        , 200
      , Math.max(8000*Math.random(), 4000)
    getTemplateData: ->
      _(@model.toJSON()).extend Settings.toJSON()
    events: 
      "click #sound": "toggleSound"
      "click .ears": "ohnoyoudidnt"

    ohnoyoudidnt: ->
      @say @model.get("eartouch")

    toggleSound: ->
      sound = Settings.get("sound")
      @$("#sound").toggleClass("icon-volume-up").toggleClass("icon-volume-off")
      if sound
        Settings.set("sound", false)
      else
        Settings.set("sound", true)

    afterRender: ->
      greeting = @model.get "greeting"
      @say greeting
      $("body").on "keypress.complete", (e) =>
        if e.keyCode == 32
          @complete = true
    settleDown: ->
      @$(".face").attr "class", "face"

    say: (text) ->
      @$(".chat .text").html("")
      @renderWords text.split(" "), true

    renderWords: (words, first) ->
      if @wait
        words = @wait
        first = true
        @rendering = false
        @wait = false
        clearInterval @chatInt

      if first and @rendering
        @wait = words
        @rendering = false
      else 
        @rendering = true
        $("body").off "keypress.next"
        emotions = @model.get("emotions")
        if words.length > 0
          @$(".cursor").show()
          @complete = false if first

          word = words.shift()
          if word in _(emotions).keys()
            @settleDown()
            @$(".face").addClass emotions[word]
            @renderWords words
          else
            switch word
              when "->"
                @rendering = false
                @$("#space").show()
                @$(".cursor").hide()
                $("body").on "keypress.next", (e) =>
                  if e.keyCode == 32
                    @$("#space").hide()
                    @$(".cursor").show()
                    $("body").off "keypress.next"
                    @$(".chat .text").html ""
                    @renderWords words, true
              when "||"
                @$(".chat .text").append "<br/><br/>"
                @renderWords words
              when "|"
                @$(".chat .text").append "<br/>"
                @renderWords words
              else
                word = " " + word unless first
                if @complete 
                  @$(".chat .text").append word
                  @renderWords words
                else
                  @renderWord word, =>
                    setTimeout =>
                      @renderWords words
                    , @model.get "pause"
        else 
          @rendering = false
          @$(".cursor").hide()

    renderWord: (text, callback) ->
      $chat = @$(".chat .text")
      mouth = @$(".face")
      text = text.split("")
      stripe = 0
      @chatInt = setInterval =>
        if @complete 
          $chat.append text
          callback?()
          clearInterval @chatInt
          mouth.removeClass("talk")
        else if text.length <= 0
          clearInterval @chatInt
          callback?()
          mouth.removeClass("talk")
        else 
          stripe++
          mouth.toggleClass("talk") if stripe % 2 == 0
          $chat.append text.shift()
      , @model.get "speed"

  new CharacterView model: new Character