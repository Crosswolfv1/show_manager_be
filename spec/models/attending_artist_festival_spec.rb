require "rails_helper"

RSpec.describe AttendingArtistFestival, type: :model do
  describe "relationships" do
    it {should belong_to :attending_artist}
    it {should belong_to :festival}
  end
end