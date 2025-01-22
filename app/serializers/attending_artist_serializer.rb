class AttendingArtistSerializer
  include JSONAPI::Serializer

  set_type :artist
  set_id :id
  attributes :name
end