class Fantassist2.Views.StatView extends Backbone.View

  tagName: 'tr'

  className: 'stat'

  render: ->
    console.log @model.attributes
    @$el.html(Fantassist2.template('stat').render(@model.attributes))
    @
