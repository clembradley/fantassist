class DraftPick < ActiveRecord::Base
  belongs_to :drafter
  belongs_to :player

  validates :drafter_id, presence: true
  validates :drafter, presence: true
  validates :player_id, presence: true, uniqueness: {scope: :drafter_id}
  validates :player, presence: true
end
