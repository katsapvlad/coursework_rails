class CreateArticleComments < ActiveRecord::Migration[6.1]
  def change
    create_table :article_comments do |t|
      t.integer :article_id
      t.integer :user_id
      t.text :text
      t.timestamps
    end
  end
end
