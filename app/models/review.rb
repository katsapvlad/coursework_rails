class Review < ApplicationRecord
  has_one :user
  validates_presence_of :text, :user_id, :rating
end
