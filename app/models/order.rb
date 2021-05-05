class Order < ApplicationRecord
  has_one :user
  has_one :favour
  validates_presence_of :favour_id, :user_id
end
