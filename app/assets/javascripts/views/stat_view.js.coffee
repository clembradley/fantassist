class Fantassist2.Views.StatView extends Backbone.View

  tagName: 'tr'

  className: 'stat'

  events:
    'click .draftable-player': 'handleClickPlayer'

  render: ->
    @$el.html(Fantassist2.template('stat').render(@model.attributes))
    @

  handleClickPlayer: (e) =>
    e.preventDefault()
    newDraftPick = new Fantassist2.Models.DraftPick
    newDraftPick.set player_id: @model.attributes.player.id, drafter_id: Fantassist2.current_drafter.id, player: @model.attributes.player
    newDraftPick.save()
    Fantassist2.EventBus.trigger('draftPick:create', newDraftPick)
    @remove()
