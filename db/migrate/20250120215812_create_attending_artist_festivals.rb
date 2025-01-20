class CreateAttendingArtistFestivals < ActiveRecord::Migration[7.1]
  def change
    create_table :attending_artist_festivals do |t|
      t.references :festival, null: false, foreign_key: true
      t.references :attending_artist, null: false, foreign_key: true

      t.timestamps
    end
  end
end
