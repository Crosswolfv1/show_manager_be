class AddStartAndEndTimeToFestivals < ActiveRecord::Migration[7.1]
  def change
    add_column :festivals, :start_time, :datetime, null: false
    add_column :festivals, :end_time, :datetime, null: false
  end
end
