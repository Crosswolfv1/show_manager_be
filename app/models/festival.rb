class Festival < ApplicationRecord
  has_many :user_festivals
  has_many :artist_attending_festivals
  
  validates :name, presence: true, uniqueness: true
end
