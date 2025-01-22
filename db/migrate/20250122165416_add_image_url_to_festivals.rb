class AddImageUrlToFestivals < ActiveRecord::Migration[7.1]
  def change
    add_column :festivals, :imageURL, :string
  end
end
