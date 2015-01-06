class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :content, null: false, default: ''

      t.timestamps null: false
    end

    create_join_table :activities, :couples
  end
end
