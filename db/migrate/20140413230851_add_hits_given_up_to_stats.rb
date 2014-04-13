class AddHitsGivenUpToStats < ActiveRecord::Migration
  def change
    add_column :stats, :hits_given_up, :integer
  end
end
