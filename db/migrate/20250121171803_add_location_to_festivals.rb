class AddLocationToFestivals < ActiveRecord::Migration[7.1]
  def change
    add_column :festivals, :location, :string
  end
end
