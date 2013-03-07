define ["./view", "tpl!../templates/character", "css!../styles/character"], (View, TPL) ->
  class CharacterView extends View
    attributes: 
      class: "character"
    template: TPL
    render: ->
      @$el.attr "id", @model.get "id"
      super()

    afterRender: ->
      greeting = @model.get "greeting"
      @renderWords greeting.split(" "), true
      $("body").on "keypress.complete", (e) =>
        if e.keyCode == 32
          @complete = true
    
    renderWords: (words, first) ->
      emotions = @model.get("emotions")
      if words.length > 0
        @complete = false if first

        word = words.shift()
        if word in _(emotions).keys()
          @$(".face").addClass emotions[word]
          @renderWords words
        else
          switch word
            when "->"
              $("body").on "keypress.next", (e) =>
                if e.keyCode == 32
                  $("body").off "keypress.next"
                  @$(".chat .text").html ""
                  @renderWords words, true
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

    renderWord: (text, callback) ->
      $chat = @$(".chat .text")
      text = text.split("")
      chatInt = setInterval =>
        if text.length <= 0
          clearInterval chatInt
          callback?()
        else 
          $chat.append text.shift()
      , @model.get "speed"