class CreateArticles < ActiveRecord::Migration[6.1]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :text
      t.integer :admin_id
      t.string :image_link
      t.timestamps
    end
  end
end
