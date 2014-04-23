class Stat < ActiveRecord::Base
  belongs_to :player

  validates :player, presence: true
  validates :player_id, presence: true
  validates :projection, inclusion: {in: [true, false]}
  validates :year, presence: true

  def self.undrafted
    Stat
    .joins(:player)
    .joins('LEFT OUTER JOIN draft_picks ON draft_picks.player_id = players.id')
    .where('draft_picks.player_id IS NULL')
  end

  def batting_average
    return nil unless at_bats
    hits.to_f / at_bats.to_f
  end

  def on_base_percentage
    return nil unless plate_appearances
    (hits.to_i + walks_drawn.to_i + hit_by_pitch.to_i) / plate_appearances.to_f
  end
end
