class CreateStats < ActiveRecord::Migration
  def change
    create_table :stats do |t|
      t.integer :player_id
      t.integer :at_bats
      t.integer :hits
      t.integer :home_runs
      t.integer :rbis
      t.integer :runs
      t.integer :stolen_bases
      t.integer :innings_pitched
      t.integer :earned_runs
      t.integer :strikeouts
      t.integer :quality_starts
      t.integer :wins
      t.integer :saves
      t.integer :year, null: false
      t.boolean :projection, default: false

      t.timestamps
      t.index :player_id
    end
  end
end
