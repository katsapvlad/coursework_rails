class Article < ApplicationRecord
  has_one :admin
  validates_presence_of :title, :text, :admin_id, :image_link
end
