class CreateNewsComments < ActiveRecord::Migration[6.1]
  def change
    create_table :news_comments do |t|
      t.integer :news_id
      t.integer :user_id
      t.text :text
      t.timestamps
    end
  end
end
