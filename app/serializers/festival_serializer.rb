class FestivalSerializer
  include JSONAPI::Serializer

  set_type :festival
  set_id :id
  attributes :name, :start_time, :end_time
end