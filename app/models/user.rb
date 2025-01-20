class User < ApplicationRecord
  has_many :user_festivals
  
  validates :name, presence: true, uniqueness: true
end
