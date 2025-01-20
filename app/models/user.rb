class User < ApplicationRecord
  has_many :user_festivals
  has_many :festivals, through: :user_festivals

  validates :name, presence: true
end
