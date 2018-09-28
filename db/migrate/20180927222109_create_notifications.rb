class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
      t.integer :recipient_id
      t.integer :sender_id
      t.string :text

      t.timestamps
    end
    add_index :notifications, :recipient_id
    add_index :notifications, :sender_id
    add_index :notifications, [:recipient_id, :sender_id], unique: true
  end
end
