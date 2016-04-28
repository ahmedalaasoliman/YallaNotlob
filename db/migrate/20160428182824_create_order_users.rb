class CreateOrderUsers < ActiveRecord::Migration
  def change
    create_table :order_users do |t|
      t.integer :order_id
      t.integer :user_id
      t.string :userstatus
      t.references :user, index: true, foreign_key: true
      t.references :order, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
