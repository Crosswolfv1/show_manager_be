class User < ApplicationRecord
  has_many :user_festivals
  has_many :festivals, through: :user_festivals

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
end
