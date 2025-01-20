require "rails_helper"

RSpec.describe UserFestival, type: :model do
  describe "relationships" do
    it {should belong_to :user}
    it {should belong_to :festival}
  end
end