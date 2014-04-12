class CreateDraftPicks < ActiveRecord::Migration
  def change
    create_table :draft_picks do |t|
      t.integer :drafter_id
      t.integer :player_id

      t.timestamps
      t.index :drafter_id
      t.index :player_id
      t.index [:drafter_id, :player_id], unique: true
    end
  end
end
