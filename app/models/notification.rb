class Notification < ActiveRecord::Base
  belongs_to :users
  belongs_to :orders
end
