class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.integer :order_id
      t.string :message
      t.integer :user_id
      t.references :users, index: true, foreign_key: true
      t.references :orders, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
