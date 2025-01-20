require 'rails_helper'

RSpec.describe Festival, type: :model do
  describe "relationships" do
    it {should have_many :user_festivals}
    it {should have_many :attending_artist_festivals}

    it {is_expected.to have_many(:attending_artists).through(:attending_artist_festivals)}
    it {is_expected.to have_many(:users).through(:user_festivals)}
  end

  describe "validations" do
    it { should validate_presence_of(:name) }
  end
end
