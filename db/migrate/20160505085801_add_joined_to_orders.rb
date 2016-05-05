class AddJoinedToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :joined, :string
  end
end
