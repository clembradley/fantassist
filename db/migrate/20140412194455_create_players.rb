class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :position, null: false
      t.string :organization, null: false

      t.timestamps
    end
  end
end
