class AttendingArtist < ApplicationRecord
  has_many :attending_artist_festivals
  has_many :festivals, through: :attending_artist_festivals
  
  validates :name, presence: true
end
