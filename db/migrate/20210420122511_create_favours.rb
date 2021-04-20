class CreateFavours < ActiveRecord::Migration[6.1]
  def change
    create_table :favours do |t|
      t.string :title
      t.text :description
      t.integer :price
      t.string :image_link
      t.timestamps
    end
  end
end
