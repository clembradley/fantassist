class Fantassist2.Views.DraftPicksView extends Backbone.View

  events:
    'click #reset-btn': 'handleReset'

  initialize: ->
    @listenTo(@collection, 'add', @addNewDraftPick)
    @listenTo(Fantassist2.EventBus, 'draftPick:create', @addDraftPickToCollection)

  render: ->
    @$el.html(Fantassist2.template('draft_picks').render())
    @collection.each (draftPick) =>
      @addNewDraftPick(draftPick)
    @

  addDraftPickToCollection: (draftPick) ->
    @collection.add(draftPick)

  addNewDraftPick: (draftPick) ->
    draftPickView = new Fantassist2.Views.DraftPickView model: draftPick
    @$('tbody').append(draftPickView.render().el)

  handleReset: (e) ->
    e.preventDefault()
    @$('tbody').html('')
    @collection.each (draftPick) ->
      draftPick.destroy()

