class AddStartAndEndTimesToAttendingArtistFestivals < ActiveRecord::Migration[7.1]
  def change
    add_column :attending_artist_festivals, :start_time, :datetime
    add_column :attending_artist_festivals, :end_time, :datetime
  end
end
