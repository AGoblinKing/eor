define ["./view", "tpl!../templates/bahamut"], (View, BahTPL) ->
  class Scene extends View
    id: "bahamut"
    template: BahTPL