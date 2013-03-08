define ["./view", "tpl!../templates/title"], (View, TitleTPL) ->
  class Title extends View 
    template: TitleTPL
    id: "titleScene"
    events: 
      "click #bahamutStory": "gotoBahamut"

    gotoBahamut: ->
      @$el.toggleClass("hideTop")
      #window.location.hash = "bahamut"