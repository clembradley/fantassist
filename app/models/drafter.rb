class Drafter < ActiveRecord::Base
  belongs_to :user
  belongs_to :league
  has_many :draft_picks, dependent: :destroy

  validates :user, presence: true
  validates :league, presence: true
  validates :user_id, presence: true, uniqueness: {scope: :league_id}

  def name
    @name ||= [user.first_name, user.last_name].compact.join(' ')
  end
end
