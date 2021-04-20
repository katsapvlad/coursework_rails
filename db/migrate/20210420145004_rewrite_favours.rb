class RewriteFavours < ActiveRecord::Migration[6.1]
  def change
    add_column :favours, :title, :string
    add_column :favours, :description, :text
    add_column :favours, :price, :integer
    add_column :favours, :image_link, :string
  end
end
