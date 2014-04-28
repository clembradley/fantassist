class Drafter < ActiveRecord::Base
  belongs_to :user
  has_many :draft_picks, dependent: :destroy

  validates :user, presence: true
  validates :user_id, presence: true

  def name
    @name ||= [user.first_name, user.last_name].compact.join(' ')
  end
end
