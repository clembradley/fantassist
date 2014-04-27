class Fantassist.Views.StatView extends Backbone.View

  tagName: 'tr'

  className: 'stat'

  events:
    'click .draftable-player': 'handleClickPlayer'

  render: ->
    @$el.html(Fantassist.template('stat').render(@model.attributes))
    @

  handleClickPlayer: (e) =>
    e.preventDefault()
    newDraftPick = new Fantassist.Models.DraftPick
    newDraftPick.set player_id: @model.attributes.player.id, drafter_id: Fantassist.current_drafter.id, player: @model.attributes.player

    $('#ajax-loader').css('visibility', 'visible')
    newDraftPick.save(null,
      success: (model, response, options) ->
        $('#ajax-loader').css('visibility', 'hidden')
      error: (model, response, options) ->
        $('#ajax-loader').css('visibility', 'hidden')
        alert 'unexpected error! draft pick did not save -- please try again!'
    )

    Fantassist.EventBus.trigger('draftPick:create', newDraftPick)
    @remove()
