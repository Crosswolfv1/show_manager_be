require 'rails_helper'

RSpec.describe "Users", type: :request do
  before(:each) do 
    @user1 = User.create!({ first_name: Faker::Name.first_name , last_name: Faker::Name.last_name, email: Faker::Internet.email })
    @user2 = User.create!({ first_name: Faker::Name.first_name , last_name: Faker::Name.last_name, email: Faker::Internet.email })
    @user3 = User.create!({ first_name: Faker::Name.first_name , last_name: Faker::Name.last_name, email: Faker::Internet.email })

    @festival1 = Festival.create!({ name: Faker::FunnyName.name, start_time: Time.now + 1.day, end_time: Time.now + 2.days, location: Faker::Address.community, imageURL: Faker::Internet.url })
    @festival2 = Festival.create!({ name: Faker::FunnyName.name, start_time: Time.now + 1.day, end_time: Time.now + 2.days, location: Faker::Address.community, imageURL: Faker::Internet.url })

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
      get "/api/v1/users"

      expect(response).to be_successful
      json = JSON.parse(response.body, symbolize_names: true)

      expect(json[:data].count).to eq(3)
      expect(json[:data][0][:attributes]).to have_key(:first_name)
      expect(json[:data][1][:attributes]).to have_key(:last_name)
      expect(json[:data][2][:attributes]).to have_key(:email)
    end

    it "#show" do
      get "/api/v1/users/#{@user1.id}"

      expect(response).to be_successful
      json = JSON.parse(response.body, symbolize_names: true)
      expect(json[:data][:attributes][:first_name]).to eq(@user1.first_name)
      expect(json[:data][:attributes][:last_name]).to eq(@user1.last_name)
      expect(json[:data][:attributes][:email]).to eq(@user1.email)
      expect(json[:data][:relationships][:festivals][:data].count).to eq(2)
      expect(json[:data][:relationships][:festivals][:data][0][:id]).to eq(@festival1.id.to_s)

      expect(json[:included].count).to eq(2)
      expect(json[:included][0][:id]).to eq(@festival1.id.to_s)
      expect(json[:included][0][:attributes][:name]).to eq(@festival1.name)
      expect(json[:included][0][:attributes][:location]).to eq(@festival1.location)
      expect(json[:included][0][:attributes][:start_time]).to eq(@festival1.start_time.iso8601)
      expect(json[:included][0][:attributes][:end_time]).to eq(@festival1.end_time.iso8601)
      expect(json[:included][0][:attributes][:imageURL]).to eq(@festival1.imageURL)
    end

    it "sad path show" do
      get "/api/v1/users/99999999"

      expect(response).not_to be_successful
      json = JSON.parse(response.body, symbolize_names: true)
      expect(json[:message]).to eq("User not found")
      expect(json[:status]).to eq(404)
    end
  end
end
