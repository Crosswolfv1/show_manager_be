class CreateUserFestivals < ActiveRecord::Migration[7.1]
  def change
    create_table :user_festivals do |t|
      t.references :festival, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
