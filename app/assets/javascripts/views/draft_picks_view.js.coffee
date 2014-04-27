class Fantassist.Views.DraftPicksView extends Backbone.View

  events:
    'click #reset-btn': 'handleReset'

  initialize: ->
    @listenTo(@collection, 'add', @addNewDraftPick)
    @listenTo(Fantassist.EventBus, 'draftPick:create', @addDraftPickToCollection)

  render: ->
    @$el.html(Fantassist.template('draft_picks').render())
    @collection.each (draftPick) =>
      @addNewDraftPick(draftPick)
    @

  addDraftPickToCollection: (draftPick) ->
    @collection.add(draftPick)

  addNewDraftPick: (draftPick) ->
    draftPickView = new Fantassist.Views.DraftPickView model: draftPick
    @$('tbody').append(draftPickView.render().el)

  handleReset: (e) ->
    e.preventDefault()
    @destroyAllDraftPicks()

  destroyAllDraftPicks: ->
    while @collection.models.length > 0
      @collection.models[0].destroy()
