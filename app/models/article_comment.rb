class ArticleComment < ApplicationRecord
  has_one :user
  has_one :article
  validates_presence_of :article_id, :user_id, :text
end
