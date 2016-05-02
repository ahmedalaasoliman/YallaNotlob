# class AddAvatarsToOrders < ActiveRecord::Migration
#   def change
#   end
# end

class AddAvatarsToOrders < ActiveRecord::Migration
  def self.up
    change_table :orders do |t|
      t.attachment :avatar
    end
  end

  def self.down
    drop_attached_file :orders, :avatar
  end
end