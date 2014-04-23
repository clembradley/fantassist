class V1::DraftPickPresenter

  def initialize(draft_pick)
    @draft_pick = draft_pick
  end

  def as_json(options = {})
    {
      player: V1::PlayerPresenter.new(@draft_pick.player).as_json,
      drafter: {name: @draft_pick.drafter.name}
    }
  end
end
