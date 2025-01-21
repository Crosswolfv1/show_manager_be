class FestivalSerializer
  include JSONAPI::Serializer

  set_type :festival
  set_id :id
  attributes :name, :location, :start_time, :end_time

  has_many :attending_artists, serializer: AttendingArtistSerializer
  
private

  attribute :start_time do |attr|
    attr.start_time.strftime("%Y-%m-%dT%H:%M:%SZ")
  end

  attribute :end_time do |attr|
    attr.end_time.strftime("%Y-%m-%dT%H:%M:%SZ")
  end
 
end