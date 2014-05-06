class AddProviderAndUidAndImageToUsers < ActiveRecord::Migration
  def change
    add_column :users, :provider, :string
    add_column :users, :uid, :string
    add_column :users, :image, :string

    add_index :users, [:provider, :uid], unique: true
  end
end