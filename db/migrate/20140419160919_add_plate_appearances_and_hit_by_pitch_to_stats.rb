class AddPlateAppearancesAndHitByPitchToStats < ActiveRecord::Migration
  def change
    add_column :stats, :plate_appearances, :integer
    add_column :stats, :hit_by_pitch, :integer
  end
end
