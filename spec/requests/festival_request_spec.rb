require 'rails_helper'

RSpec.describe "Festivals", type: :request do
  before(:each) do 
    @user1 = User.create!({ first_name: Faker::Name.first_name , last_name: Faker::Name.last_name, email: Faker::Internet.email })
    @user2 = User.create!({ first_name: Faker::Name.first_name , last_name: Faker::Name.last_name, email: Faker::Internet.email })
    @user3 = User.create!({ first_name: Faker::Name.first_name , last_name: Faker::Name.last_name, email: Faker::Internet.email })

    @festival1 = Festival.create!({ name: Faker::FunnyName.name, start_time: Time.now + 1.day, end_time: Time.now + 2.days, location: Faker::Address.community })
    @festival2 = Festival.create!({ name: Faker::FunnyName.name, start_time: Time.now + 1.day, end_time: Time.now + 2.days, location: Faker::Address.community })

    @artist1 = AttendingArtist.create!({ name: Faker::Music.band })
    @artist2 = AttendingArtist.create!({ name: Faker::Music.band })

    AttendingArtistFestival.create!([
      { attending_artist: @artist1, festival: @festival1 },
      { attending_artist: @artist2, festival: @festival1 },
      { attending_artist: @artist2, festival: @festival2 }
    ])

    UserFestival.create!([
      { user: @user1, festival: @festival1 },
      { user: @user2, festival: @festival1 },
      { user: @user3, festival: @festival1 },
      { user: @user1, festival: @festival2 },
      { user: @user2, festival: @festival2 }
    ])  
  end

  describe "CRUD" do
    it "#index" do
      get "/api/v1/festivals"

      expect(response).to be_successful
      json = JSON.parse(response.body, symbolize_names: true)

      expect(json[:data].count).to eq(2)
      expect(json[:data][0][:attributes]).to have_key(:name)
      expect(json[:data][0][:attributes]).to have_key(:location)
      expect(json[:data][1][:attributes]).to have_key(:start_time)
      expect(json[:data][1][:attributes]).to have_key(:end_time)
    end

    it "#show" do
      get "/api/v1/festivals/#{@festival1.id}"

      expect(response).to be_successful
      json = JSON.parse(response.body, symbolize_names: true)

      expect(json[:data][:attributes][:name]).to eq(@festival1.name)
      expect(json[:data][:attributes][:location]).to eq(@festival1.location)
      expect(json[:data][:attributes][:start_time]).to eq(@festival1.start_time.iso8601)
      expect(json[:data][:attributes][:end_time]).to eq(@festival1.end_time.iso8601)
    end
  end
end