class AddGamesPlayedToStats < ActiveRecord::Migration
  def change
    add_column :stats, :games_played, :integer
  end
end
