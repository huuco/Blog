require "rails_helper"
RSpec.describe Rate, type: :model do
  let!(:category) {FactoryBot.create :category, name: "Rubic"}
  let!(:user) {FactoryBot.create(:user, name: "Nguyen",
    email: Faker::Internet.email, password: "12345678",
     password_confirmation: "12345678")}
  let!(:post) {FactoryBot.create(:post, title: "title", content: "luck",
   user_id: user.id,category: category
   )}
  let!(:rate) {FactoryBot.create(:rate, user_id: user.id, post_id: post.id, star: 4, content: "good")}
  describe "Validations" do
    it {is_expected.to validate_presence_of :content}
    it {is_expected.to validate_presence_of :star}
    it {is_expected.to validate_length_of(:content).is_at_most 50}
    it {is_expected.to validate_numericality_of(:star).is_less_than_or_equal_to 5}
    it {is_expected.to validate_numericality_of(:star).is_greater_than_or_equal_to 1}

  end
  describe "associations" do
    it {is_expected.to belong_to(:user)}
    it {is_expected.to belong_to(:post)}
  end
end
