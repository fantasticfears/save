class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
      t.integer :user_id, null: false
      t.string :content, null: false, default: ''
      t.string :stress, null: false, default: ''
      t.text :details, null: false, default: ''

      t.timestamps null: false
    end
  end
end
