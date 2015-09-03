class AddLeagueIdToDrafters < ActiveRecord::Migration
  def change
    add_column :drafters, :league_id, :integer
    add_index :drafters, :league_id
    add_index :drafters, [:league_id, :user_id], unique: true
  end
end
