class V1::DraftPickPresenter

  def initialize(draft_pick)
    @draft_pick = draft_pick
  end

  def as_json(options = {})
    {
      drafter: {name: @draft_pick.drafter.name},
      id: @draft_pick.id,
      player: V1::PlayerPresenter.new(@draft_pick.player).as_json
    }
  end
end
