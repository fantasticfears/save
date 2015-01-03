class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, default: '', null: false
      t.string :password_hash, limit: 64
      t.string :salt, limit: 32
      t.string :remember_hash, limit: 60
      t.timestamps null: false
    end
  end
end
