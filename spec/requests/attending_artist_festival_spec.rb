require 'rails_helper'

RSpec.describe "Festivals", type: :request do
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
    it "deletes a show/artist from a festival" do
      delete "/api/v1/festivals/#{@festival1.id}/artist/#{@artist2.id}"

      expect(response).to be_successful
      expect(response.status).to eq(204)
    end

    it "sad path, cannot find a festival" do
      delete "/api/v1/festivals/9999999999/artist/#{@artist2.id}"

      expect(response).not_to be_successful
      json = JSON.parse(response.body, symbolize_names: true)

      expect(json[:message]).to eq("Couldn't find Festival with 'id'=9999999999")
      expect(json[:status]).to eq(404)
    end

    it "sad path, cannot find an artist" do
      delete "/api/v1/festivals/#{@festival1.id}/artist/999999999999"

      expect(response).not_to be_successful
      json = JSON.parse(response.body, symbolize_names: true)

      expect(json[:message]).to eq("Couldn't find AttendingArtist with 'id'=999999999999")
      expect(json[:status]).to eq(404)
    end

    it "sad path, cannot find an joins entry" do
      delete "/api/v1/festivals/#{@festival2.id}/artist/#{@artist1.id}"

      expect(response).not_to be_successful
      json = JSON.parse(response.body, symbolize_names: true)

      expect(json[:message]).to eq("Artist not found at this festival")
      expect(json[:status]).to eq(404)
    end

  end

end