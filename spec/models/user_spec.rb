require 'rails_helper'

RSpec.describe User, type: :model do
  describe "relationships" do
    it {should have_many :user_festivals}
    it {is_expected.to have_many(:festivals).through(:user_festivals)}
  end

  describe "validations" do
    it {should validate_presence_of(:first_name)}
    it {should validate_presence_of(:last_name)}
    it {should validate_presence_of(:email)}
  end
end
