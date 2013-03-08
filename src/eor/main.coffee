define "eor", [
  "backbone" 
  "./views/main"
  "./views/title"
  "./views/bahamut"
], (Backbone, MainView, TitleView, BahamutView) ->
  class AppRouter extends Backbone.Router
    routes: 
      "": "default"
      ":page": "default"

    makePage: ->
      $("body").html (new MainView).render().el

    default: (page) ->
      @makePage()
      $("#scene").html (new TitleView).render().el
      $("#scene").append (new BahamutView).render().el

  new AppRouter()

  Backbone.history.start()