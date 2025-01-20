class CreateAttendingArtists < ActiveRecord::Migration[7.1]
  def change
    create_table :attending_artists do |t|
      t.string :name, null: false

      t.timestamps
    end
  end
end
