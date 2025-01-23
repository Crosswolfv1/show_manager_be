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

# Create users and store the ActiveRecord objects
users = [
  { first_name: "Alice", last_name: "Smith", email: "alice.smith@example.com" },
  { first_name: "Bob", last_name: "Johnson", email: "bob.johnson@example.com" },
  { first_name: "Charlie", last_name: "Williams", email: "charlie.williams@example.com" },
  { first_name: "Dana", last_name: "Brown", email: "dana.brown@example.com" }
].map { |user| User.find_or_create_by!(user) }

# Create artists and store the ActiveRecord objects
artists = [
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
].map { |artist| AttendingArtist.find_or_create_by!(artist) }

# Create festivals with locations and store the ActiveRecord objects
festivals = [
  { name: "Rockin' Valley Fest", start_time: Time.now + 1.day, end_time: Time.now + 2.days, location: "Valley Park, New York", imageURL: "https://i.imgur.com/4TvsNzy.gif" },
  { name: "Summer Jam Blast", start_time: Time.now + 3.days, end_time: Time.now + 4.days, location: "Central Beach, Los Angeles", imageURL: "https://i.imgur.com/3GUX00f.jpeg" },
  { name: "Echo Mountain Music Fest", start_time: Time.now + 5.days, end_time: Time.now + 6.days, location: "Echo Mountain, Colorado", imageURL: "https://i.imgur.com/KqW9LQZ.jpeg" },
  { name: "Sunset Groove Festival", start_time: Time.now + 7.days, end_time: Time.now + 8.days, location: "Sunset Beach, Miami", imageURL: "https://i.imgur.com/2gMfj6L.jpeg" },
  { name: "Mountain Escape Festival", start_time: Time.now + 9.days, end_time: Time.now + 10.days, location: "Rocky Mountains, Colorado", imageURL: "https://i.imgur.com/Uj1IYer.jpeg" },
  { name: "Desert Beats Music Fest", start_time: Time.now + 11.days, end_time: Time.now + 12.days, location: "Desert Oasis, Arizona", imageURL: "https://i.imgur.com/TOajvwo.jpeg" },
  { name: "Lakeside Music Fest", start_time: Time.now + 13.days, end_time: Time.now + 14.days, location: "Lakeview Park, Oregon", imageURL: "https://i.imgur.com/rShF4ci.png" },
  { name: "Forest Groove Festival", start_time: Time.now + 15.days, end_time: Time.now + 16.days, location: "Pinewood Forest, California", imageURL: "https://i.imgur.com/KwFUTYx.jpeg" },
  { name: "Riverfront Jazz Fest", start_time: Time.now + 17.days, end_time: Time.now + 18.days, location: "Riverfront Park, Chicago", imageURL: "https://i.imgur.com/TAIfhnX.jpeg" },
  { name: "Urban Vibes Festival", start_time: Time.now + 19.days, end_time: Time.now + 20.days, location: "Downtown, New York", imageURL: "https://i.imgur.com/Wjbpmfz.jpeg" },
  { name: "Coastal Beats Festival", start_time: Time.now + 21.days, end_time: Time.now + 22.days, location: "Coastal Park, San Diego", imageURL: "https://i.imgur.com/IQu5OgE.jpeg" },
  { name: "Twilight Music Celebration", start_time: Time.now + 23.days, end_time: Time.now + 24.days, location: "Twilight Hills, Utah", imageURL: "https://i.imgur.com/mu7KfBh.jpeg" },
  { name: "City Lights Music Fest", start_time: Time.now + 25.days, end_time: Time.now + 26.days, location: "Downtown Square, Boston", imageURL: "https://i.imgur.com/AZutsbU.png" }
].map { |festival| Festival.find_or_create_by!(festival) }

# Assign artists to festivals
attending_artist_festivals = [
  { attending_artist_id: artists[0].id, festival_id: festivals[0].id },
  { attending_artist_id: artists[1].id, festival_id: festivals[0].id },
  { attending_artist_id: artists[2].id, festival_id: festivals[1].id },
  { attending_artist_id: artists[3].id, festival_id: festivals[1].id },
  { attending_artist_id: artists[4].id, festival_id: festivals[2].id },
  { attending_artist_id: artists[5].id, festival_id: festivals[2].id },
  { attending_artist_id: artists[6].id, festival_id: festivals[0].id },
  { attending_artist_id: artists[7].id, festival_id: festivals[1].id },
  { attending_artist_id: artists[8].id, festival_id: festivals[2].id },
  { attending_artist_id: artists[9].id, festival_id: festivals[0].id }
]
attending_artist_festivals.each { |entry| AttendingArtistFestival.find_or_create_by!(entry) }

# Assign users to festivals
user_festivals = [
  { user_id: users[0].id, festival_id: festivals[0].id },
  { user_id: users[1].id, festival_id: festivals[0].id },
  { user_id: users[2].id, festival_id: festivals[1].id },
  { user_id: users[3].id, festival_id: festivals[2].id },
  { user_id: users[0].id, festival_id: festivals[2].id },
  { user_id: users[1].id, festival_id: festivals[1].id },
  { user_id: users[3].id, festival_id: festivals[1].id }
]
user_festivals.each { |entry| UserFestival.find_or_create_by!(entry) }
