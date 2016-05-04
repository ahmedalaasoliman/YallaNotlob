class CreateOrderusers < ActiveRecord::Migration
  def change
    create_table :orderusers do |t|
      t.integer :user_id
      t.integer :order_id
      t.string :status
      t.references :user, index: true, foreign_key: true
      t.references :order, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
