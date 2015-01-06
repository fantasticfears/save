class AddEmailToUser < ActiveRecord::Migration
  def change
    add_column :users, :email, :string

    add_index :users, :email, unique: true
    add_index :users, :name, unique: true
  end
end
