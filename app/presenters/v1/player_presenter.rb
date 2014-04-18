class V1::PlayerPresenter

  def initialize(player)
    @player = player
  end

  def as_json(options = {})
    {
      first_name: @player.first_name,
      last_name: @player.last_name,
      organization: @player.organization,
      position: @player.position
    }
  end
end
