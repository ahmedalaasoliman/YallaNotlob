class AddOrderToNotifications < ActiveRecord::Migration
  def change
    add_reference :notifications, :order, index: true, foreign_key: true
  end
end
