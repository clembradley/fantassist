class CreateDrafters < ActiveRecord::Migration
  def change
    create_table :drafters do |t|
      t.integer :user_id, null: false
      t.string :name, null: false

      t.timestamps
      t.index :user_id
    end
  end
end
