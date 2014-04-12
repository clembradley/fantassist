class Drafter < ActiveRecord::Base
  belongs_to :user
  has_many :draft_picks

  validates :name, presence: true
  validates :user, presence: true
  validates :user_id, presence: true
end
