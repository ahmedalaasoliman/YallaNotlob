class Orderuser < ActiveRecord::Base
  belongs_to :user
  belongs_to :order
end
