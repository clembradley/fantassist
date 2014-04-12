class Player < ActiveRecord::Base
  POSITIONS = [POSITION_1B = '1B', POSITION_2B = '2B']
  ORGANIZATIONS = [ORGANIZATION_CHC = 'ChC', ORGANIZATION_CHW = 'ChW']

  validates :position, inclusion: {in: POSITIONS, allow_blank: true}, presence: true
  validates :organization, inclusion: {in: ORGANIZATIONS, allow_blank: true}, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
end
