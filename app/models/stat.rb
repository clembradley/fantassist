class Stat < ActiveRecord::Base
  belongs_to :player

  validates :player, presence: true
  validates :player_id, presence: true
  validates :projection, inclusion: {in: [true, false]}
  validates :year, presence: true
end
