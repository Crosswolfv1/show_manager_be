class Festival < ApplicationRecord
  has_many :user_festivals
  has_many :attending_artist_festivals
  has_many :attending_artists, through: :attending_artist_festivals
  has_many :users, through: :user_festivals

  validates :name, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :location, presence: true
  validates :imageURL, presence: true

end
