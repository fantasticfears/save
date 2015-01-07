class AddAdditionalFieldsToUser < ActiveRecord::Migration
  def change
    add_column :users, :avatar, :string
    add_column :users, :location, :string, default: '', null: false
    add_column :users, :timezone, :string, default: '', null: false
    add_column :users, :longitude, :string
    add_column :users, :latitude, :string
  end
end
