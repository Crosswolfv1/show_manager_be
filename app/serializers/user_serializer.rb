class UserSerializer
  include JSONAPI::Serializer

  set_type :user
  set_id :id
  attributes :first_name, :last_name, :email
end