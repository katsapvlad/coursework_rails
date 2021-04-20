class Favour < ApplicationRecord
  validates_presence_of :title, :description, :price, :image_link
end
