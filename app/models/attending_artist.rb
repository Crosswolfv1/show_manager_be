class AttendingArtist < ApplicationRecord
  has_many :attending_artist_festivals
  
  validates :name, presence: true, uniqueness: true
end
