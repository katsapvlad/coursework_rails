class NewsComment < ApplicationRecord
  has_one :user
  has_one :news
  validates_presence_of :news_id, :user_id, :text
end
