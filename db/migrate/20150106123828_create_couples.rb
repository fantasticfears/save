class CreateCouples < ActiveRecord::Migration
  def change
    create_table :couples do |t|
      t.timestamps null: false
    end

    create_join_table :users, :couples
  end
end
