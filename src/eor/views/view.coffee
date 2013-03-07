define ["backbone"], (Backbone) ->
  class View extends Backbone.View
    getTemplateData: ->
      {}
    afterRender: ->
    render: ->
      @$el.html @template.render @getTemplateData()
      @afterRender()
      this
