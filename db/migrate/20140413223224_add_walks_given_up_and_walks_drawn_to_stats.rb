class AddWalksGivenUpAndWalksDrawnToStats < ActiveRecord::Migration
  def change
    add_column :stats, :walks_given_up, :integer
    add_column :stats, :walks_drawn, :integer
  end
end
