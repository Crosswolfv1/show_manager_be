require 'rails_helper'

RSpec.describe AttendingArtist, type: :model do
  describe "relationships" do
    it {should have_many :attending_artist_festivals}
    it {is_expected.to have_many(:festivals).through(:attending_artist_festivals)}
  end

  describe "validations" do
    it { should validate_presence_of(:name) }
  end
end
