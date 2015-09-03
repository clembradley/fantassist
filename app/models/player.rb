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

  def self.undrafted
    joins('LEFT OUTER JOIN draft_picks ON draft_picks.player_id = players.id').where('draft_picks.player_id IS NULL')
  end

  def full_name
    @full_name ||= [first_name, last_name].join(' ')
  end
end
