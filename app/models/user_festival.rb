class UserFestival < ApplicationRecord
  belongs_to :user
  belongs_to :festival
end
