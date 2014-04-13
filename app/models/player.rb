class Player < ActiveRecord::Base
  has_many :draft_picks, dependent: :destroy
  has_many :stats, dependent: :destroy

  POSITIONS = ['1B', '2B', '3B', 'C', 'DH', 'OF', 'RP', 'SP', 'SS']
  ORGANIZATIONS = [
    'ARI', 'ATL', 'BAL', 'BOS', 'CHC', 'CHW', 'CIN', 'CLE', 'COL', 'DET',
    'HOU', 'KC', 'LAA', 'LAD', 'MIA', 'MIL', 'MIN', 'NYM', 'NYY', 'OAK',
    'PHI', 'PIT', 'SD', 'SEA', 'SF', 'STL', 'TB', 'TEX', 'TOR', 'WAS'
  ]
  validates :position, inclusion: {in: POSITIONS, allow_blank: true}, presence: true
  validates :organization, inclusion: {in: ORGANIZATIONS, allow_blank: true}, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
end
