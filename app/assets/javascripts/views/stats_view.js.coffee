class Fantassist.Views.StatsView extends Backbone.View

  tagName: 'table'

  className: 'table table-condensed stats-table'

  render: ->
    @$el.html('<thead><th></th><th>G</th><th>R</th><th>HR</th><th>RBIs</th><th>SB</th><th>OBP</th></thead>')
    @collection.each (stat) =>
      statView = new Fantassist.Views.StatView model: stat
      @$el.append(statView.render().el)
    @
