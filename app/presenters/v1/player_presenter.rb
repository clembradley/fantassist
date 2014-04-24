class V1::PlayerPresenter < V1::BasePresenter

  def initialize(player)
    @player = player
  end

  def as_json(options = {})
    {
      first_name: @player.first_name,
      id: @player.id,
      last_name: @player.last_name,
      organization: @player.organization,
      position: @player.position
    }
  end
end
