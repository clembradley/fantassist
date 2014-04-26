class Fantassist2.Views.DraftPickView extends Backbone.View

  tagName: 'tr'
  className: 'draft-pick'

  initialize: ->
    @listenTo(@model, 'destroy', @handleDraftPickDestroy)

  render: ->
    @$el.html(Fantassist2.template('draft_pick').render(@model.attributes))
    @

  handleDraftPickDestroy: ->
    @remove()
