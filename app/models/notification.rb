# class Notification < ActiveRecord::Base

# end

class Notification < ActiveRecord::Base
  belongs_to :recipient, class_name: "User"
  belongs_to :actor, class_name: "User"
  belongs_to :notifiable, polymorphic: true
  belongs_to :order , foreign_key: :order_id
  belongs_to :user , foreign_key: :user_id
  
  scope :unread, ->{ where(read_at: nil) }
end