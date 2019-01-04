require "rails_helper"

RSpec.describe User, type: :model do
  let!(:user1) {FactoryBot.create(:user, name: "co123",
    email: Faker::Internet.email, password: "12345678", password_confirmation: "12345678")}
  let!(:user2) {FactoryBot.create(:user, name: "Nguyen",
    email: Faker::Internet.email, password: "12345678", password_confirmation: "12345678")}

  describe "validations" do
    it {is_expected.to validate_presence_of :name}
    it {is_expected.to validate_presence_of :email}
    it {is_expected.to validate_confirmation_of :password}
    it {is_expected.to validate_confirmation_of :password}
  end

  context "associations" do
    it {is_expected.to have_many(:rates).dependent :destroy}
    it {is_expected.to have_many(:posts).dependent :destroy}
    it {is_expected.to have_many(:comments).dependent :destroy}
    it {is_expected.to have_many(:likes).dependent :destroy}
  end
end
