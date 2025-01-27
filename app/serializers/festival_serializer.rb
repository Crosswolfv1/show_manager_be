class FestivalSerializer
  include JSONAPI::Serializer

  set_type :festival
  set_id :id
  attributes :name, :location, :start_time, :end_time, :imageURL

  has_many :attending_artists
  has_many :users
  
  attribute :start_time do |attr|
    attr.start_time.strftime("%Y-%m-%dT%H:%M:%SZ")
  end

  attribute :end_time do |attr|
    attr.end_time.strftime("%Y-%m-%dT%H:%M:%SZ")
  end

  attribute :attending_artists_with_times do |festival|
    festival.attending_artists.map do |artist|
      attending_artist_festival = AttendingArtistFestival.find_by(festival_id: festival.id, attending_artist_id: artist.id)
      {
        artist_name: artist.name,
        start_time: attending_artist_festival.start_time.strftime("%Y-%m-%dT%H:%M:%SZ"),
        end_time: attending_artist_festival.end_time.strftime("%Y-%m-%dT%H:%M:%SZ")
      }
    end
  end
end
