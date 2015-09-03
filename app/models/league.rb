class League < ActiveRecord::Base
  has_many :drafters
  validates :name, presence: true
end
