class Fantassist.Views.DraftPickView extends Backbone.View

  tagName: 'tr'
  className: 'draft-pick'

  initialize: ->
    @listenTo(@model, 'destroy', @handleDraftPickDestroy)

  render: ->
    @$el.html(Fantassist.template('draft_pick').render(@model.attributes))
    @

  handleDraftPickDestroy: ->
    @remove()
