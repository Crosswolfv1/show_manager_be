require 'rails_helper'

RSpec.describe "Users", type: :request do
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
    end
  end
end
