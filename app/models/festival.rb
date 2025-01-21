class Festival < ApplicationRecord
  attr_accessor :id, :name, :start_time, :end_time

  has_many :user_festivals
  has_many :attending_artist_festivals
  has_many :attending_artists, through: :attending_artist_festivals
  has_many :users, through: :user_festivals

  validates :name, presence: true
end
