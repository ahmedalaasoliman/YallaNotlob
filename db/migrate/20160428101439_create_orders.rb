class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :order_for
      t.string :order_from
      t.string :menu_image
      t.string :status
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
