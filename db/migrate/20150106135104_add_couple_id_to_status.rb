class AddCoupleIdToStatus < ActiveRecord::Migration
  def change
    add_column :statuses, :couple_id, :integer, null: false
  end
end
