class AttendingArtistFestival < ApplicationRecord
  belongs_to :attending_artist
  belongs_to :festival
end
