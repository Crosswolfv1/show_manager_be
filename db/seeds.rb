# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# db/seeds.rb

# Create users
users = User.create!([
  { first_name: "Alice", last_name: "Smith", email: "alice.smith@example.com" },
  { first_name: "Bob", last_name: "Johnson", email: "bob.johnson@example.com" },
  { first_name: "Charlie", last_name: "Williams", email: "charlie.williams@example.com" },
  { first_name: "Dana", last_name: "Brown", email: "dana.brown@example.com" }
])

# Create artists
artists = AttendingArtist.create!([
  { name: "The Rolling Beats" },
  { name: "Electric Sunrise" },
  { name: "Neon Vibes" },
  { name: "Moonlight Echoes" },
  { name: "The Midnight Owls" },
  { name: "Firestorm Revival" },
  { name: "The Lunar Strums" },
  { name: "Echo Heights" },
  { name: "Solar Waves" },
  { name: "Thunder Chords" }
])

# Create festivals with locations
festivals = Festival.create!([
  { name: "Rockin' Valley Fest", start_time: Time.now + 1.day, end_time: Time.now + 2.days, location: "Valley Park, New York" },
  { name: "Summer Jam Blast", start_time: Time.now + 3.days, end_time: Time.now + 4.days, location: "Central Beach, Los Angeles" },
  { name: "Echo Mountain Music Fest", start_time: Time.now + 5.days, end_time: Time.now + 6.days, location: "Echo Mountain, Colorado" }
])

# Assign artists to festivals
AttendingArtistFestival.create!([
  { attending_artist: artists[0], festival: festivals[0] },
  { attending_artist: artists[1], festival: festivals[0] },
  { attending_artist: artists[2], festival: festivals[1] },
  { attending_artist: artists[3], festival: festivals[1] },
  { attending_artist: artists[4], festival: festivals[2] },
  { attending_artist: artists[5], festival: festivals[2] },
  { attending_artist: artists[6], festival: festivals[0] },
  { attending_artist: artists[7], festival: festivals[1] },
  { attending_artist: artists[8], festival: festivals[2] },
  { attending_artist: artists[9], festival: festivals[0] }
])

# Assign users to festivals
UserFestival.create!([
  { user: users[0], festival: festivals[0] },
  { user: users[1], festival: festivals[0] },
  { user: users[2], festival: festivals[1] },
  { user: users[3], festival: festivals[2] },
  { user: users[0], festival: festivals[2] },
  { user: users[1], festival: festivals[1] },
  { user: users[3], festival: festivals[1] }
])
