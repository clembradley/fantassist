class RemoveNameFromDrafters < ActiveRecord::Migration
  def change
    remove_column :drafters, :name
  end
end
